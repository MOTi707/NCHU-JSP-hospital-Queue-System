<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>重新呼叫患者</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff;
            color: #333;
        }
        .header {
            background-color: #1e88e5;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .nav {
            background-color: #2196f3;
            display: flex;
            justify-content: space-around;
        }
        .nav a {
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            display: block;
            transition: background-color 0.3s;
        }
        .nav a:hover {
            background-color: #1976d2;
        }
        .content {
            padding: 30px;
        }
        .doctor-info {
            background-color: #e3f2fd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        .queue-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        .queue-table th, .queue-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e3f2fd;
        }
        .queue-table th {
            background-color: #1976d2;
            color: white;
        }
        .queue-table tr:hover {
            background-color: #e3f2fd;
        }
        .priority {
            background-color: #ff9800;
            color: white;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 12px;
        }
        .status-waiting {
            color: #2196f3;
        }
        .status-calling {
            color: #ff9800;
            font-weight: bold;
        }
        .status-finished {
            color: #4caf50;
            text-decoration: line-through;
        }
        .status-passed {
            color: #f44336;
            font-style: italic;
        }
        .button-group {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .btn {
            background-color: #2196f3;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #1976d2;
        }
        .btn-secondary {
            background-color: #607d8b;
        }
        .btn-secondary:hover {
            background-color: #455a64;
        }
        .btn-danger {
            background-color: #f44336;
        }
        .btn-danger:hover {
            background-color: #d32f2f;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            display: none;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>重新呼叫</h1>
</div>

<div class="container">
    <div class="nav">
        <a href="callHomepage.jsp">首页</a>
        <a href="callPatient.jsp">叫号</a>
        <a href="reCallPatient.jsp" style="background-color: #1976d2;">重新呼叫</a>
        <a href="transferPatient.jsp">转号</a>
    </div>

    <div class="content">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String action = request.getParameter("action");
            String message = "";
            String alertType = "";
            int queueID = 0;
            int regID = 0;
            int doctorID = 0;
            int queueNumber = 0;
            String patientName = "";
            int reCallCount = 0;

            if (action != null && action.equals("re_call")) {
                try {
                    conn = new DBConnection().getConnection();
                    stmt = conn.createStatement();

                    // 获取参数
                    queueID = Integer.parseInt(request.getParameter("queueID"));
                    regID = Integer.parseInt(request.getParameter("regID"));

                    // 查询当前重呼次数
                    String countQuery = "SELECT ISNULL(ReCallCount, 0) AS ReCallCount FROM Queue WHERE QueueID = " + queueID;
                    rs = stmt.executeQuery(countQuery);

                    if (rs.next()) {
                        reCallCount = rs.getInt("ReCallCount");
                        reCallCount++;
                    }

                    // 更新队列状态为"等待"，增加重呼次数，更新呼叫时间
                    String updateQuery = "UPDATE Queue SET Status = '等待', ReCallCount = " + reCallCount + ", CallTime = GETDATE() WHERE QueueID = " + queueID;
                    int affectedRows = stmt.executeUpdate(updateQuery);

                    if (affectedRows > 0) {
                        // 更新挂号记录状态为"等待"
                        String regUpdateQuery = "UPDATE Registrations SET Status = '等待' WHERE RegID = " + regID;
                        stmt.executeUpdate(regUpdateQuery);

                        // 成功后重定向到主页面
                        response.sendRedirect("callHomepage.jsp?action=re_call_success");
                        return;
                    } else {
                        message = "重新呼叫失败，请重试！";
                        alertType = "danger";
                    }
                } catch (SQLException e) {
                    message = "操作出错：" + e.getMessage();
                    alertType = "danger";
                } catch (Exception e) {
                    message = "发生错误：" + e.getMessage();
                    alertType = "danger";
                } finally {
                    new DBConnection().closeResources(conn, stmt, rs);
                }
            } else {
                // 获取队列信息
                if (request.getParameter("queueID") != null) {
                    queueID = Integer.parseInt(request.getParameter("queueID"));
                    regID = Integer.parseInt(request.getParameter("regID"));
                    doctorID = Integer.parseInt(request.getParameter("doctorID"));
                    queueNumber = Integer.parseInt(request.getParameter("queueNumber"));
                    patientName = request.getParameter("patientName");

                    // 查询重呼次数
                    try {
                        conn = new DBConnection().getConnection();
                        stmt = conn.createStatement();

                        String countQuery = "SELECT ISNULL(ReCallCount, 0) AS ReCallCount FROM Queue WHERE QueueID = " + queueID;
                        rs = stmt.executeQuery(countQuery);

                        if (rs.next()) {
                            reCallCount = rs.getInt("ReCallCount");
                        }
                    } catch (SQLException e) {
                        reCallCount = 0;
                    } finally {
                        new DBConnection().closeResources(conn, stmt, rs);
                    }
                } else {
                    response.sendRedirect("callHomepage.jsp?action=error");
                    return;
                }
            }

            if (!message.isEmpty()) {
        %>
        <div class="alert alert-<%= alertType %>" style="display: block;">
            <%= message %>
        </div>
        <% } %>

        <% if (queueID > 0) { %>
        <div class="doctor-info">
            <h2>重新呼叫患者</h2>
            <table>
                <tr>
                    <td>排队号：</td>
                    <td><%= queueNumber %></td>
                    <td>患者姓名：</td>
                    <td><%= patientName %></td>
                </tr>
                <tr>
                    <td>已呼叫次数：</td>
                    <td><%= reCallCount %></td>
                    <td>当前状态：</td>
                    <td>等待</td>
                </tr>
            </table>
        </div>

        <div class="button-group">
            <a href="reCallPatient.jsp?action=re_call&queueID=<%= queueID %>&regID=<%= regID %>&doctorID=<%= doctorID %>&queueNumber=<%= queueNumber %>&patientName=<%= patientName %>" class="btn" style="font-size: 24px; padding: 20px 40px;">
                重新呼叫 <span style="font-size: 32px; margin-left: 10px;"><%= patientName %></span>
            </a>
        </div>

        <div class="button-group">
            <a href="callHomepage.jsp" class="btn btn-secondary">返回首页</a>
        </div>
        <% } else { %>
        <div class="alert alert-warning" style="display: block;">
            没有可重新呼叫的患者，请确认选择正确
        </div>
        <div class="button-group">
            <a href="callHomepage.jsp" class="btn">返回首页</a>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
