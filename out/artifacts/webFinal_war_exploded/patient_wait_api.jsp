<%@page contentType="application/json;charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.zyh.JDBC"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>


<%
    /**
     * @author zyh
     * @since 2025-5-29 00:31:12
     */
%>


<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Access-Control-Allow-Origin", "*");
Gson gson = new Gson();
Map<String, Object> responseData = new LinkedHashMap<>();

try (Connection conn = JDBC.getConnection()) {
    // 参数验证
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String deptIdParam = request.getParameter("department");
    String timeUnit = request.getParameter("timeUnit");

    // 检查必要参数是否存在
    if (startDate == null || endDate == null || deptIdParam == null || timeUnit == null) {
        responseData.put("error", "缺少必要参数: startDate, endDate, department, timeUnit");
        out.print(gson.toJson(responseData));
        return;
    }

    int deptId = Integer.parseInt(deptIdParam);

    // 修正：将结束日期加1天以包含全天数据
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    cal.setTime(sdf.parse(endDate));
    cal.add(Calendar.DATE, 1);
    String adjustedEndDate = sdf.format(cal.getTime());

    // 调用存储过程
    String procedure = "{call sp_PatientWaitTimeAnalysis(?, ?, ?, ?)}";
    try (CallableStatement stmt = conn.prepareCall(procedure)) {
        stmt.setDate(1, Date.valueOf(startDate));
        stmt.setDate(2, Date.valueOf(adjustedEndDate));  // 使用调整后的结束日期
        stmt.setInt(3, deptId);
        stmt.setString(4, timeUnit);

        try (ResultSet rs = stmt.executeQuery()) {
            List<Map<String, Object>> result = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> row = new LinkedHashMap<>();
                row.put("timePeriod", rs.getString("TimePeriod") != null ? rs.getString("TimePeriod") : "");
                row.put("deptName", rs.getString("DeptName") != null ? rs.getString("DeptName") : "");
                row.put("totalPatients", rs.getInt("TotalPatients"));
                row.put("averageWaitTime", rs.getString("AverageWaitTime") != null ? rs.getString("AverageWaitTime") : "0分钟");
                row.put("maxWaitTime", rs.getString("MaxWaitTime") != null ? rs.getString("MaxWaitTime") : "0分钟");
                row.put("minWaitTime", rs.getString("MinWaitTime") != null ? rs.getString("MinWaitTime") : "0分钟");
                result.add(row);
            }
            responseData.put("data", result);

            // 检查是否有数据
            if (result.isEmpty()) {
                responseData.put("message", "未找到符合条件的数据");
            }
        }
    }
} catch (IllegalArgumentException e) {
    responseData.put("error", "参数错误：" + e.getMessage());
} catch (SQLException e) {
    responseData.put("error", "数据库错误：" + e.getMessage());
    e.printStackTrace();
} catch (Exception e) {
    responseData.put("error", "服务器内部错误：" + e.getMessage());
    e.printStackTrace();
} finally {
    out.print(gson.toJson(responseData));
    out.flush();
}
%>