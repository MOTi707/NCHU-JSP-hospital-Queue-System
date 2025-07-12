<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>转号功能</title>
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
    <h1>转号功能</h1>
</div>

<div class="container">
    <div class="nav">
        <a href="callHomepage.jsp">首页</a>
        <a href="callPatient.jsp">叫号</a>
        <a href="reCallPatient.jsp">重新呼叫</a>
        <a href="transferPatient.jsp" style="background-color: #1976d2;">转号</a>
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
            String targetDoctorName = "";
            int targetDoctorID = 0;

            if (action != null && action.equals("transfer")) {
                try {
                    conn = new DBConnection().getConnection();
                    stmt = conn.createStatement();

                    // 获取参数
                    queueID = Integer.parseInt(request.getParameter("queueID"));
                    regID = Integer.parseInt(request.getParameter("regID"));
                    targetDoctorID = Integer.parseInt(request.getParameter("targetDoctorID"));

                    // 开始事务
                    conn.setAutoCommit(false);

                    // 更新队列所属医生和状态
                    String updateQuery = "UPDATE Queue SET DoctorID = " + targetDoctorID + ", Status = '等待' WHERE QueueID = " + queueID;
                    int affectedRows = stmt.executeUpdate(updateQuery);

                    if (affectedRows > 0) {
                        // 更新挂号记录的医生
                        String regUpdateQuery = "UPDATE Registrations SET DoctorID = " + targetDoctorID + " WHERE RegID = " + regID;
                        stmt.executeUpdate(regUpdateQuery);

                        // 查询目标医生姓名
                        String doctorQuery = "SELECT DoctorName FROM Doctors WHERE DoctorID = " + targetDoctorID;
                        rs = stmt.executeQuery(doctorQuery);

                        if (rs.next()) {
                            targetDoctorName = rs.getString("DoctorName");
                        }

                        // 提交事务
                        conn.commit();

                        // 成功后重定向到主页面
                        response.sendRedirect("callHomepage.jsp?action=transfer_success");
                        return;
                    } else {
                        // 回滚事务
                        conn.rollback();
                        message = "转号失败，请重试！";
                        alertType = "danger";
                    }
                } catch (SQLException e) {
                    // 发生异常，回滚事务
                    if (conn != null) {
                        try {
                            conn.rollback();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                    message = "操作出错：" + e.getMessage();
                    alertType = "danger";
                } catch (Exception e) {
                    message = "发生错误：" + e.getMessage();
                    alertType = "danger";
                } finally {
                    // 恢复自动提交
                    if (conn != null) {
                        try {
                            conn.setAutoCommit(true);
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
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
            <h2>转号操作</h2>
            <table>
                <tr>
                    <td>排队号：</td>
                    <td><%= queueNumber %></td>
                    <td>患者姓名：</td>
                    <td><%= patientName %></td>
                </tr>
            </table>
        </div>

        <form action="transferPatient.jsp?action=transfer&queueID=<%= queueID %>&regID=<%= regID %>&queueNumber=<%= queueNumber %>&patientName=<%= patientName %>" method="post">
            <div class="form-group">
                <label for="targetDoctor">选择目标医生：</label>
                <select id="targetDoctor" name="targetDoctorID" required>
                    <option value="">请选择医生</option>
                    <%
                        try {
                            conn = new DBConnection().getConnection();
                            stmt = conn.createStatement();

                            // 查询同一科室的其他医生
                            String deptQuery = "SELECT d.DoctorID, d.DoctorName FROM Doctors d " +
                                    "JOIN Registrations r ON d.DeptID = (SELECT DeptID FROM Registrations WHERE RegID = " + regID + ") " +
                                    "WHERE d.DoctorID != " + doctorID + " AND d.Status = 1";
                            rs = stmt.executeQuery(deptQuery);

                            while (rs.next()) {
                                int docID = rs.getInt("DoctorID");
                                String docName = rs.getString("DoctorName");
                    %>
                    <option value="<%= docID %>"><%= docName %></option>
                    <% } %>
                    <% } catch (SQLException e) { %>
                    <option value="">查询医生出错</option>
                    <% } finally {
                        new DBConnection().closeResources(conn, stmt, rs);
                    } %>
                </select>
            </div>

            <div class="button-group">
                <button type="submit" class="btn">确认转号</button>
                <a href="callHomepage.jsp" class="btn btn-secondary">取消</a>
            </div>
        </form>
        <% } else { %>
        <div class="alert alert-warning" style="display: block;">
            没有可转号的患者，请确认选择正确
        </div>
        <div class="button-group">
            <a href="callHomepage.jsp" class="btn">返回首页</a>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
