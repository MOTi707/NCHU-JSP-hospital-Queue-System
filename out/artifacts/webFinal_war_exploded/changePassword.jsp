<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /**
     * @author Morty Lee
     * @since 2025-5-14 21:11
     */
%>

<html>
<head>
    <title>修改密码 - 健康医疗平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 完全复用登录页样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: '微软雅黑', sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('./image/bgImage.jpg'); /* 与登录页共用背景图 */
            background-size: cover;
            background-position: center;
            opacity: 0.7;
            z-index: -1;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.75);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.1);
            width: 100%;
            max-width: 450px;
            z-index: 1;
        }

        .login-title {
            text-align: center;
            color: #007bff;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 25px;
        }

        .input-group label {
            display: block;
            color: #333;
            font-size: 16px;
            margin-bottom: 8px;
        }

        .input-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
            background-color: rgba(255, 255, 255, 0.85);
        }

        .input-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #0056b3;
        }

        .other-links {
            margin-top: 20px;
            text-align: center;
        }

        .other-links a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
            margin: 0 10px;
        }

        .other-links a:hover {
            text-decoration: underline;
        }

        /* 错误提示样式（与注销页一致） */
        .error-msg {
            color: #721c24;
            background-color: #f8d7da;
            border: 2px solid #f5c6cb;
            border-radius: 8px;
            padding: 12px 15px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 15px;
            box-shadow: 0 2px 8px rgba(220, 53, 69, 0.15);
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1 class="login-title" style="color: #007bff;">修改登录密码</h1>


    <%-- 成功提示区域 --%>
    <% if (request.getAttribute("successMsg") != null) { %>
    <div class="success-msg"
         style="color: #155724; background-color: #d4edda; border: 2px solid #c3e6cb; border-radius: 8px; padding: 12px 15px; text-align: center; margin-bottom: 20px; font-weight: bold; font-size: 15px; box-shadow: 0 2px 8px rgba(40,167,69,0.15);">
        <%= request.getAttribute("successMsg") %>
    </div>
    <% } %>
    <%-- 错误提示区域（与注销页一致） --%>
    <% if (request.getAttribute("errorMsg") != null) { %>
    <div class="error-msg"><%= request.getAttribute("errorMsg") %>
    </div>
    <% } %>

    <form action="changePasswordServlet" method="post">
        <div class="input-group">
            <label for="username">需修改密码的用户名</label>
            <input type="text" id="username" name="username" required placeholder="请输入用户名">
        </div>
        <div class="input-group">
            <label for="oldPassword">原密码</label>
            <input type="password" id="oldPassword" name="oldPassword" required placeholder="请输入当前登录密码">
        </div>
        <div class="input-group">
            <label for="newPassword">新密码</label>
            <input type="password" id="newPassword" name="newPassword" required placeholder="请输入新密码">
        </div>
        <button type="submit" class="btn-login">提交修改</button>
        <div class="other-links">
            <a href="javascript:history.back()">返回上一页</a>
        </div>
    </form>
</div>
</body>
</html>