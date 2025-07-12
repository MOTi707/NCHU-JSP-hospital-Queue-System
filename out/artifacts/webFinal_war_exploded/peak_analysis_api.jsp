<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.zyh.JDBC"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>
<%@ page contentType="application/json;charset=UTF-8"%>


<%
    /**
     * @author zyh
     * @since 2025-5-29 00:31:12
     * @update 2025-5-29 01:03:25 修改默认时间选择保证有数据展示 数据库增加数据 mortyLee
     */
%>

<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Access-Control-Allow-Origin", "*");

Gson gson = new Gson();
Map<String, Object> responseData = new LinkedHashMap<>();

try {
    System.out.println("Java 版本: " + System.getProperty("java.version"));

    final String startDate = request.getParameter("startDate");
    final String endDate = request.getParameter("endDate");
    final String deptIdStr = request.getParameter("department");
    final String analysisType = request.getParameter("analysisType");

    if (startDate == null || endDate == null || deptIdStr == null || analysisType == null) {
        throw new IllegalArgumentException("缺少必要参数");
    }

    final int deptId = Integer.parseInt(deptIdStr);
    String dateFormat = null;
    String groupByExpr = null; // 分组表达式（与 SELECT 中的 timeUnit 逻辑一致）

    // 动态构建分组表达式
    switch (analysisType) {
        case "hourly":
            dateFormat = "yyyy-MM-dd HH:00:00";
            groupByExpr = "FORMAT(firstTimeCalled, '" + dateFormat + "')"; // 分组表达式与 SELECT 一致
            break;
        case "daily":
            dateFormat = "yyyy-MM-dd";
            groupByExpr = "CONVERT(VARCHAR, firstTimeCalled, 23)"; // yyyy-MM-dd 格式的 CONVERT 表达式
            break;
        case "weekly":
            groupByExpr = "DATEPART(WEEK, firstTimeCalled)"; // 周次分组依据
            break;
        default:
            throw new IllegalArgumentException("不支持的分析类型：" + analysisType);
    }

    // 构建流量趋势 SQL（显式包含分组表达式和原始列）
    final String flowTrendSql =
        "SELECT " +
        "  " + (analysisType.equals("weekly") ? "'第 ' + CAST(" + groupByExpr + " AS VARCHAR) + '周'" : "FORMAT(firstTimeCalled, ?)") + " AS timeUnit, " +
        "  COUNT(*) AS patientCount, " +
        "  AVG(DATEDIFF(MINUTE, scheduledTime, firstTimeCalled)) AS avgWaitTime " +
        "FROM oldAppointment " +
        "WHERE firstTimeCalled BETWEEN ? AND ? " +
        (deptId != 0 ? "AND doctorID IN (SELECT doctorID FROM doctor WHERE departmentID = ?)" : "") +
        "GROUP BY " + groupByExpr + ", firstTimeCalled " + // 分组依据包含表达式和原始列
        "ORDER BY MIN(firstTimeCalled)";

    System.out.println("流量趋势SQL: " + flowTrendSql);

    List<Map<String, Object>> flowTrend = new ArrayList<>();
    try (Connection conn = JDBC.getConnection();
         PreparedStatement stmt = conn.prepareStatement(flowTrendSql)) {

        int paramIndex = 1;
        if (!analysisType.equals("weekly")) {
            stmt.setString(paramIndex++, dateFormat); // 设置 FORMAT 格式参数
        }
        stmt.setString(paramIndex++, startDate + " 00:00:00");
        stmt.setString(paramIndex++, endDate + " 23:59:59");
        if (deptId != 0) {
            stmt.setInt(paramIndex++, deptId);
        }

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> item = new LinkedHashMap<>();
                item.put("timeUnit", rs.getString("timeUnit"));
                item.put("patientCount", rs.getInt("patientCount"));
                item.put("avgWaitTime", rs.getDouble("avgWaitTime"));
                flowTrend.add(item);
            }
        }
    }

    // 每日高峰分布查询（修正 HOUR 和 DATE 函数）
    List<Map<String, Object>> dailyDistribution = new ArrayList<>();
    if (analysisType.equals("hourly") || analysisType.equals("daily")) {
        final String dailySql =
            "SELECT " +
            "  DATEPART(HOUR, firstTimeCalled) AS hour, " + // 使用 DATEPART(HOUR, ...)
            "  COUNT(*) AS patientCount " +
            "FROM oldAppointment " +
            "WHERE CONVERT(DATE, firstTimeCalled) BETWEEN CONVERT(DATE, ?) AND CONVERT(DATE, ?) " + // 使用 CONVERT(DATE, ...)
            (deptId != 0 ? "AND doctorID IN (SELECT doctorID FROM doctor WHERE departmentID = ?)" : "") +
            "GROUP BY DATEPART(HOUR, firstTimeCalled)"; // 分组依据对应

        System.out.println("每日分布SQL: " + dailySql);

        try (Connection conn = JDBC.getConnection();
             PreparedStatement stmt = conn.prepareStatement(dailySql)) {

            stmt.setString(1, startDate);
            stmt.setString(2, endDate);
            if (deptId != 0) stmt.setInt(3, deptId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> item = new LinkedHashMap<>();
                    item.put("hour", rs.getInt("hour") + ":00");
                    item.put("patientCount", rs.getInt("patientCount"));
                    dailyDistribution.add(item);
                }
            }
        }
    }

    // 计算高峰期（逻辑不变）
    List<Map<String, Object>> peakPeriods = new ArrayList<>();
    if (!flowTrend.isEmpty()) {
        int total = 0;
        for (Map<String, Object> item : flowTrend) {
            Integer patientCount = (Integer) item.get("patientCount");
            if (patientCount != null) {
                total += patientCount;
            }
        }
        double avg = total > 0 ? total / (double) flowTrend.size() : 0;

        for (Map<String, Object> item : flowTrend) {
            Integer count = (Integer) item.get("patientCount");
            if (count != null && count >= avg * 1.5) {
                peakPeriods.add(new LinkedHashMap<>(item));
            }
        }

        if (peakPeriods.isEmpty()) {
            flowTrend.sort(new Comparator<Map<String, Object>>() {
                @Override
                public int compare(Map<String, Object> a, Map<String, Object> b) {
                    Integer countA = (Integer) a.get("patientCount");
                    Integer countB = (Integer) b.get("patientCount");
                    return countB != null && countA != null ? countB.compareTo(countA) : 0;
                }
            });
            peakPeriods.addAll(flowTrend.subList(0, Math.min(3, flowTrend.size())));
        }

        for (Map<String, Object> peak : peakPeriods) {
            Integer count = (Integer) peak.get("patientCount");
            if (count != null && total > 0) {
                double percentage = count * 100.0 / total;
                double utilization = count * 100.0 / (avg > 0 ? avg * 2 : 1);
                peak.put("percentage", Math.round(percentage * 10) / 10.0);
                peak.put("resourceUtilization", Math.round(utilization));
            }
        }
    }

    // 创建不可变副本，解决内部类访问限制问题
    final List<Map<String, Object>> finalFlowTrend = Collections.unmodifiableList(flowTrend);
    final List<Map<String, Object>> finalDailyDistribution = Collections.unmodifiableList(dailyDistribution);
    final List<Map<String, Object>> finalPeakPeriods = Collections.unmodifiableList(peakPeriods);

    // 使用传统方式创建Map，避免内部类访问问题
    Map<String, Object> dataMap = new LinkedHashMap<>();
    dataMap.put("flowTrend", finalFlowTrend);
    dataMap.put("dailyDistribution", finalDailyDistribution);
    dataMap.put("peakPeriods", finalPeakPeriods);
    responseData.put("data", dataMap);

} catch (Exception e) {
    response.setStatus(500);
    responseData.put("error", "服务器错误：" + e.getMessage());
    e.printStackTrace();
} finally {
    out.print(gson.toJson(responseData));
}
%>