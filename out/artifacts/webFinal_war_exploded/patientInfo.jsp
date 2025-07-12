<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatterBuilder" %>

<%
    String patientId = (String) session.getAttribute("username");

    if (patientId == null) {
        session.setAttribute("message", "请先登录，再进行操作");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>患者个人信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 整体样式（复用登录页基础样式） */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: '微软雅黑', sans-serif;
        }

        body {
            min-height: 100vh;
            background-color: #f5f7fa;
            padding: 20px;
        }

        /* 页头样式 */
        .page-header {
            background: #007bff;
            color: white;
            padding: 20px 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0, 123, 255, 0.15);
        }

        /* 表格容器 */
        .record-container {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        /* 挂号记录表样式（扁平化设计） */
        .registration-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .registration-table th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
        }

        .registration-table td {
            padding: 12px;
            border-bottom: 1px solid #e0e5ec;
        }

        .registration-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .no-record {
            text-align: center;
            color: #666;
            padding: 20px;
            font-size: 16px;
        }
    </style>
    <style>
        /* 成功提示样式 */
        .success-alert {
            background: #e8f5e9;
            border: 2px solid #4caf50;
            border-radius: 8px;
            padding: 15px 25px;
            margin: 20px auto;
            max-width: 600px;
            display: flex;
            align-items: center;
            animation: slideIn 0.5s ease-out;
            box-shadow: 0 2px 8px rgba(76, 175, 80, 0.15);
        }

        .alert-icon {
            color: #4caf50;
            font-size: 24px;
            margin-right: 15px;
            font-weight: bold;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<!-- 页头 -->
<!-- 在页头下方添加提示区域 -->
<div class="page-header">
    <h1>患者个人信息</h1>
    <p>当前患者：<%= patientId %>
    </p>
</div>

<%-- 挂号成功提示 --%>
<% String successMsg = (String) request.getAttribute("successMessage"); %>
<% if(successMsg != null) { %>
<div class="success-alert">
    <span class="alert-icon">✓</span>
    <%= successMsg %>
</div>
<% } %>

<!-- 挂号记录区域 -->
<div class="record-container">
    <h2 style="color: #333;">我的挂号记录</h2>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // 数据库连接（根据现有项目配置调整）
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(
                    "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem", "sa", "123456");
            stmt = conn.createStatement();

            // 查询当前患者的挂号记录
            String sql = "SELECT username,department.name as dept_name,doctor.name as doctor_name,recentAppointment.scheduledTime,recentAppointment.isComein " +
                    "FROM recentappointment " +
                    "JOIN doctor ON recentAppointment.doctorID= doctor.doctorID " +
                    "JOIN department ON doctor.departmentID= department.departmentID " +
                    "WHERE username = '" + patientId + "'";
            rs = stmt.executeQuery(sql);
    %>

    <table class="registration-table">
        <thead>
        <tr>
            <th>患者姓名</th>
            <th>科室名称</th>
            <th>医生姓名</th>
            <th>挂号时间</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <%
            boolean hasRecords = false;
            while (rs.next()) {
                hasRecords = true;
        %>
        <tr>
            <td><%= rs.getString("username") %>
            </td>
            <td><%= rs.getString("dept_name") %>
            </td>
            <td><%= rs.getString("doctor_name") %>
            </td>

            <td>
                <% 
                    try {
                        String rawTime = rs.getString("scheduledTime");
                        // 解析ISO格式时间（示例：2025-06-10T01:13:50.605716900）
                        SimpleDateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
                        Date date = sourceFormat.parse(rawTime);
                        
                        // 格式化为中国常用格式（yyyy-MM-dd HH:mm）
                        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                        out.print(targetFormat.format(date));
                    } catch (Exception e) {
                        out.print("时间解析错误");
                    }
                %>
            </td>


            <td><%= rs.getString("isComein").equals("1") ? "已就诊" : "待就诊" %>
            </td>
        </tr>
        <% } %>

        <% if (!hasRecords) { %>
        <tr>
            <td colspan="5" class="no-record">暂无挂号记录</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <%
    }
    catch (Exception e) {
        e.printStackTrace();
    %>
    <div class="error-msg">查询记录时发生错误，请联系管理员</div>
    <%
        }
        finally {
            if (rs != null) try {
                rs.close();
            }
            catch (SQLException e) {
            }
            if (stmt != null) try {
                stmt.close();
            }
            catch (SQLException e) {
            }
            if (conn != null) try {
                conn.close();
            }
            catch (SQLException e) {
            }
        }
    %>
</div>
</body>
</html>