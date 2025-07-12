<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>排队叫号</title>
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
    <h1>排队叫号</h1>
</div>

<div class="container">
    <div class="nav">
        <a href="callHomepage.jsp">首页</a>
        <a href="callPatient.jsp">叫号</a>
        <a href="reCallPatient.jsp">重新呼叫</a>
        <a href="transferPatient.jsp">转号</a>
    </div>

    <div class="content">
        <%
            // 显示提示信息
            String action = request.getParameter("action");
            String message = "";
            String alertType = "";

            if (action != null) {
                if (action.equals("call_success")) {
                    message = "叫号成功！";
                    alertType = "success";
                } else if (action.equals("re_call_success")) {
                    message = "重新呼叫成功！";
                    alertType = "success";
                } else if (action.equals("transfer_success")) {
                    message = "转号成功！";
                    alertType = "success";
                } else if (action.equals("no_patient")) {
                    message = "当前没有等待的患者！";
                    alertType = "warning";
                } else if (action.equals("error")) {
                    message = "操作失败，请重试！";
                    alertType = "danger";
                }
            }

            if (!message.isEmpty()) {
        %>
        <div class="alert alert-<%= alertType %>" style="display: block;">
            <%= message %>
        </div>
        <% } %>

        <div class="doctor-info">
            <h2>当前医生信息</h2>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    conn = new DBConnection().getConnection();
                    stmt = conn.createStatement();

                    // 获取当前登录医生信息（这里假设医生ID为1）
                    String doctorQuery = "SELECT d.DoctorID, d.DoctorName, d.Title, d.WorkHours, d.Status, dept.DeptName " +
                            "FROM Doctors d " +
                            "JOIN Departments dept ON d.DeptID = dept.DeptID " +
                            "WHERE d.DoctorID = 1"; // 这里固定为医生ID=1，实际应用中应根据登录情况获取
                    rs = stmt.executeQuery(doctorQuery);

                    if (rs.next()) {
                        int doctorID = rs.getInt("DoctorID");
                        String doctorName = rs.getString("DoctorName");
                        String title = rs.getString("Title");
                        String deptName = rs.getString("DeptName");
                        String workHours = rs.getString("WorkHours");
                        boolean status = rs.getBoolean("Status");
            %>
            <table>
                <tr>
                    <td>姓名：</td>
                    <td><%= doctorName %></td>
                    <td>科室：</td>
                    <td><%= deptName %></td>
                </tr>
                <tr>
                    <td>职称：</td>
                    <td><%= title %></td>
                    <td>状态：</td>
                    <td><%= status ? "在岗" : "离岗" %></td>
                </tr>
                <tr>
                    <td>工作时间：</td>
                    <td colspan="3"><%= workHours %></td>
                </tr>
            </table>
            <% } else { %>
            <p>未找到医生信息</p>
            <% } %>
        </div>

        <h2>当前排队队列</h2>
        <table class="queue-table">
            <tr>
                <th>排队号</th>
                <th>患者姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>挂号时间</th>
                <th>优先级</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <%
                // 查询排队队列
                String queueQuery = "SELECT q.QueueID, q.QueueNumber, p.PatientName, p.Gender, p.Age, " +
                        "r.RegTime, r.Priority, q.Status, r.RegID, q.DoctorID, q.ReCallCount " +
                        "FROM Queue q " +
                        "JOIN Registrations r ON q.RegID = r.RegID " +
                        "JOIN Patients p ON r.PatientID = p.PatientID " +
                        "WHERE q.DoctorID = 1 " + // 这里固定为医生ID=1，实际应用中应根据登录情况获取
                        "ORDER BY CASE WHEN r.Priority = 1 THEN 0 ELSE 1 END, q.EnterTime";
                rs = stmt.executeQuery(queueQuery);

                while (rs.next()) {
                    int queueID = rs.getInt("QueueID");
                    int queueNumber = rs.getInt("QueueNumber");
                    String patientName = rs.getString("PatientName");
                    String gender = rs.getString("Gender");
                    int age = rs.getInt("Age");
                    Date regTime = rs.getDate("RegTime");
                    int priority = rs.getInt("Priority");
                    String status = rs.getString("Status");
                    int regID = rs.getInt("RegID");
                    int doctorID = rs.getInt("DoctorID");
                    int reCallCount = rs.getInt("ReCallCount");
            %>
            <tr>
                <td><%= queueNumber %></td>
                <td><%= patientName %></td>
                <td><%= gender %></td>
                <td><%= age %></td>
                <td><%= regTime %></td>
                <td><%= priority == 1 ? "<span class='priority'>优先</span>" : "普通" %></td>
                <td><span class="status-<%= status.toLowerCase().replace(' ', '-') %>"><%= status %></span></td>
                <td>
                    <% if (status.equals("等待")) { %>
                    <a href="callPatient.jsp?queueID=<%= queueID %>&regID=<%= regID %>&doctorID=<%= doctorID %>&queueNumber=<%= queueNumber %>&patientName=<%= patientName %>" class="btn">呼叫</a>
                    <% } else if (status.equals("就诊中")) { %>
                    <a href="reCallPatient.jsp?queueID=<%= queueID %>&regID=<%= regID %>&doctorID=<%= doctorID %>&queueNumber=<%= queueNumber %>&patientName=<%= patientName %>" class="btn btn-secondary">重呼</a>
                    <% } %>
                    <a href="transferPatient.jsp?queueID=<%= queueID %>&regID=<%= regID %>&doctorID=<%= doctorID %>&queueNumber=<%= queueNumber %>&patientName=<%= patientName %>" class="btn btn-secondary">转号</a>
                </td>
            </tr>
            <% } %>
        </table>

        <% if (rs != null && !rs.isBeforeFirst()) { %>
        <div class="button-group">
            <a href="callPatient.jsp" class="btn">呼叫下一位</a>
        </div>
        <% } %>

        <% } catch (SQLException e) { %>
        <div class="alert alert-danger" style="display: block;">
            数据库查询错误：<%= e.getMessage() %>
        </div>
        <% } finally {
            new DBConnection().closeResources(conn, stmt, rs);
        } %>
    </div>
</div>
</body>
</html>
