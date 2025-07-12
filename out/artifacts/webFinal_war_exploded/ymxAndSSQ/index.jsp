<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>医院门诊排队叫号系统</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h1>医院门诊排队叫号系统</h1>

        <% if (error != null && !error.isEmpty()) { %>
        <div class="alert error"><%= error %>
        </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <div class="form-group">
                <label for="username">用户名:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">密码:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="role">角色:</label>
                <select id="role" name="role" required>
                    <option value="">--请选择角色--</option>
                    <option value="doctor">医生</option>
                    <option value="admin">管理员</option>
                </select>
            </div>

            <button type="submit" class="btn-login">登录</button>
        </form>

        <div class="system-info">
            <p>系统版本: 1.0.0</p>
            <p>© 2023 医院门诊排队叫号系统 版权所有</p>
        </div>
    </div>
</div>
</body>
</html>