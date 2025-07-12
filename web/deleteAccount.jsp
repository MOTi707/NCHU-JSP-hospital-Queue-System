<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /**
     * @author Morty Lee
     * @since 2025-5-14 21:11
     */
%>

<html>
<head>
    <title>注销账户 - 健康医疗平台</title>
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
            margin-bottom: 20px;
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

        /* 新增/调整错误提示样式（更醒目） */
        .error-msg {
            margin: 10px;
            color: #721c24; /* 深暗红色文字 */
            background-color: #f8d7da; /* 浅红色背景 */
            border: 2px solid #f5c6cb; /* 红色边框 */
            border-radius: 8px; /* 圆角 */
            padding: 12px 15px; /* 内边距 */
            text-align: center;
            font-weight: bold; /* 加粗文字 */
            font-size: 15px; /* 字体略大 */
            box-shadow: 0 2px 8px rgba(220, 53, 69, 0.15); /* 阴影增强层次感 */
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1 class="login-title" style="color: #dc3545;">注销账户确认</h1>

    <%-- 错误提示区域（样式已优化） --%>
    <% if (request.getAttribute("errorMsg") != null) { %>
    <div class="error-msg"><%= request.getAttribute("errorMsg") %>
    </div>
    <% } %>

    <p style="color: #666; text-align: center; margin-bottom: 5px;">
        提示：注销后您的账户信息将被永久删除，<br>所有关联数据（如预约记录）将无法恢复。
    </p>
    <form action="deleteAccountServlet" method="post">
        <div class="input-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" required placeholder="请输入注册用户名">
        </div>
        <div class="input-group">
            <label for="password">登录密码</label>
            <input type="password" id="password" name="password" required placeholder="请输入当前登录密码">
        </div>
        <div class="input-group">
            <label for="captcha">验证码（计算结果）</label>  <!-- 调整提示文本 -->
            <div style="display: flex; gap: 10px; align-items: center;">
                <input type="text" id="captcha" name="captcha" required placeholder="请输入表达式计算结果">
                <img src="generateCaptchaServlet" alt="验证码"
                     onclick="this.src='generateCaptchaServlet?'+Math.random()"
                     style="height: 40px; cursor: pointer; border-radius: 4px;">
            </div>
        </div>
        <button type="submit" class="btn-login" style="background-color: #dc3545;">确认注销</button>
        <div class="other-links">
            <a href="javascript:history.back()">取消，返回上一页</a>
        </div>
    </form>
</div>
</body>
</html>