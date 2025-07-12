<%@page contentType="application/json;charset=UTF-8"%>
<%@page import="java.time.format.DateTimeParseException"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zyh.JDBC"%>
<%@ page import="com.google.gson.Gson"%>


<%
    /**
     * @author zyh
     * @since 2025-5-29 00:31:12
     */
%>


<%!
private String getProcedure(String timeUnit) {
    switch(timeUnit) {
        case "hour": return "sp_DepartmentHourlyStatistics";
        case "week": return "sp_DepartmentWeeklyStatistics";
        default: return "sp_DepartmentDailyStatistics";
    }
}

private void setStatementParams(CallableStatement stmt, String timeUnit, String startDate, String endDate) throws SQLException {
    if ("hour".equals(timeUnit)) {
        stmt.setTimestamp(1, Timestamp.valueOf(startDate + " 00:00:00"));
        stmt.setTimestamp(2, Timestamp.valueOf(endDate + " 23:59:59"));
    } else {
        stmt.setDate(1, Date.valueOf(startDate));
        stmt.setDate(2, Date.valueOf(endDate));
    }
}
%>

<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("X-Content-Type-Options", "nosniff");

Gson gson = new Gson();
Map<String, Object> responseData = new LinkedHashMap<>();

try {
    // 获取参数并设置默认值
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String timeUnit = request.getParameter("timeUnit");
    String deptParam = request.getParameter("department");

    // 日志输出接收到的参数
    System.out.println("接收到的参数:");
    System.out.println("startDate: " + startDate);
    System.out.println("endDate: " + endDate);
    System.out.println("timeUnit: " + timeUnit);
    System.out.println("deptParam: " + deptParam);

    // 检查必要参数是否存在
    if (startDate == null || endDate == null || timeUnit == null || deptParam == null) {
        response.setStatus(400);
        responseData.put("error", "缺少必要参数: " +
            (startDate == null ? "startDate " : "") +
            (endDate == null ? "endDate " : "") +
            (timeUnit == null ? "timeUnit " : "") +
            (deptParam == null ? "department" : ""));
        out.print(gson.toJson(responseData));
        return;
    }

    // 日期格式验证
    try {
        LocalDate.parse(startDate);
        LocalDate.parse(endDate);
    } catch (DateTimeParseException e) {
        response.setStatus(400);
        responseData.put("error", "日期格式错误，应为YYYY-MM-DD");
        out.print(gson.toJson(responseData));
        return;
    }

    // 科室ID验证
    int deptId;
    try {
        deptId = Integer.parseInt(deptParam);
    } catch (NumberFormatException e) {
        response.setStatus(400);
        responseData.put("error", "科室ID必须为有效数字: " + deptParam);
        out.print(gson.toJson(responseData));
        return;
    }

    // === 执行存储过程 ===
    List<Map<String, Object>> resultData = new ArrayList<>();
    String procedure = getProcedure(timeUnit);

    try (Connection conn = JDBC.getConnection();
         CallableStatement stmt = conn.prepareCall("{call " + procedure + "(?, ?, ?)}")) {

        setStatementParams(stmt, timeUnit, startDate, endDate);
        stmt.setInt(3, deptId);

        try (ResultSet rs = stmt.executeQuery()) {
            ResultSetMetaData meta = rs.getMetaData();
            while (rs.next()) {
                Map<String, Object> row = new LinkedHashMap<>();
                for (int i = 1; i <= meta.getColumnCount(); i++) {
                    String colName = meta.getColumnLabel(i);
                    Object value = rs.getObject(i);
                    // 统一处理时间单位为timeUnit（兼容旧存储过程返回的date/hourUnit/weekUnit）
                    if (colName.equals("date") || colName.equals("hourUnit") || colName.equals("weekUnit")) {
                        colName = "timeUnit"; // 强制统一列名
                    }
                    row.put(colName, value);
                }
                resultData.add(row);
            }
        }
    }

    responseData.put("data", resultData);

} catch (SQLException e) {
    response.setStatus(500);
    responseData.put("error", "数据库错误：" + e.getErrorCode() + " - " + e.getMessage());
    e.printStackTrace();
} catch (Exception e) {
    response.setStatus(500);
    responseData.put("error", "服务器异常：" + e.getMessage());
    e.printStackTrace();
} finally {
    out.print(gson.toJson(responseData));
    out.flush();
}
%>