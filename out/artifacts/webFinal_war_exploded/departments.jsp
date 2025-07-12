<%@ page import="java.util.Map"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.zyh.JDBC"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.sql.SQLException"%>
<%@ page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>


<%
    /**
     * @author zyh
     * @since 2025-5-29 00:31:12
     */
%>



<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("X-Content-Type-Options", "nosniff");

Gson gson = new Gson();
Map<String, Object> responseData = new LinkedHashMap<>();

try {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    List<Map<String, Object>> departments = new ArrayList<>();

    try (Connection conn = JDBC.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT departmentID AS id, name FROM department")) {

        while (rs.next()) {
            Map<String, Object> dept = new LinkedHashMap<>();
            dept.put("id", rs.getInt("id"));
            dept.put("name", rs.getString("name"));
            departments.add(dept);
        }
        responseData.put("data", departments);
    }
} catch (ClassNotFoundException e) {
    response.setStatus(500);
    responseData.put("error", "JDBC驱动加载失败：" + e.getMessage());
} catch (SQLException e) {
    response.setStatus(500);
    responseData.put("error", "数据库错误：" + e.getErrorCode() + " - " + e.getMessage());
} catch (Exception e) {
    response.setStatus(500);
    responseData.put("error", "服务器异常：" + e.getMessage());
} finally {
    out.print(gson.toJson(responseData));
    out.flush();
}
%>