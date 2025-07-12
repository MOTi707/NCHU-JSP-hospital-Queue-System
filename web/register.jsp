<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /**
     * @author Morty Lee
     * @since 2025-5-14 21:11
     */
%>

<html>
<head>
    <title>医院系统注册 - 健康医疗平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 完全复用登录页样式，保持风格统一 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: '微软雅黑', sans-serif;
        }

        body {
            background: #f0f4f8; /* 与登录页一致的浅蓝背景 */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* 背景图片样式 */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('./image/bgImage.jpg'); /* 替换为你的背景图片链接 */
            background-size: cover;
            background-position: center;
            opacity: 0.7;
            z-index: -1;
        }

        .register-container {
            background-color: rgba(255, 255, 255, 0.75); /* 半透明白色背景 */
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.1); /* 蓝色阴影 */
            width: 100%;
            max-width: 450px;
            z-index: 1; /* 确保登录框在背景图片上方 */
        }

        .register-title { /* 标题样式与登录页login-title一致 */
            text-align: center;
            color: #007bff;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .input-group { /* 输入组样式完全复用登录页 */
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
        }

        .input-group input:focus {
            outline: none;
            border-color: #007bff; /* 焦点颜色与登录页一致 */
        }

        .btn-register { /* 按钮样式与登录页btn-login一致 */
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-register:hover {
            background: #0056b3; /* 悬停颜色与登录页一致 */
        }

        .other-links { /* 底部链接样式复用登录页 */
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

        /* 新增错误提示样式（复用注销页样式） */
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
<div class="register-container">
    <h1 class="register-title">健康医疗平台患者注册</h1>

    <%-- 新增错误提示区域（参考注销页） --%>
    <% if (request.getAttribute("errorMsg") != null) { %>
    <div class="error-msg"><%= request.getAttribute("errorMsg") %>
    </div>
    <% } %>

    <form action="registerServlet" method="post">
        <div class="input-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" required placeholder="请输入用户名">
        </div>
        <div class="input-group">
            <label for="password">登录密码</label>
            <input type="password" id="password" name="password" required placeholder="请输入登录密码">
        </div>
        <!-- 新增验证码输入组 -->
        <div class="input-group">
            <label for="captcha">验证码</label>
            <div style="display: flex; align-items: center; gap: 10px;">
                <input type="text" id="captcha" name="captcha" required placeholder="请输入验证码">

                <img src="generateCaptchaServlet"
                     alt="验证码"
                     onclick="this.src='generateCaptchaServlet?'+Math.random()"
                     style="cursor: pointer; height: 40px; border: 2px solid #e0e0e0; border-radius: 8px;">
            </div>
        </div>
        <button type="submit" class="btn-register">立即注册</button>
        <div class="other-links">
            <a href="login.jsp">已有账号？立即登录</a>
        </div>
    </form>
</div>
</body>
</html>