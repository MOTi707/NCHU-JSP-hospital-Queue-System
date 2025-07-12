<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /**
     * @author 李茂田
     * @since 2025-5-14 21:11
     * @see com.mortyLee.LoginServlet 登录处理流程
     * @update 2025-5-31 14:35:00 新增不同身份跳转不同页面 RBAC 基于用户-角色-权限控制
     *
     * 运行环境:
     * JDK 22
     * Tomcat 11.0.5
     * 测试环境:
     * Chromium 102.0.5005.167
     */
%>

<html>
<head>
    <title>医院患者登录 - 健康医疗平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
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

        .login-container {
            background-color: rgba(255, 255, 255, 0.75); /* 半透明白色背景 */
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.1); /* 蓝色阴影 */
            width: 100%;
            max-width: 450px;
            z-index: 1; /* 确保登录框在背景图片上方 */
        }

        .login-title {
            text-align: center;
            color: #007bff; /* 主色 */
            font-size: 28px;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 25px;
            position: relative;
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
            background-color: rgba(255, 255, 255, 0.85); /* 半透明白色背景 */
        }

        .input-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #007bff; /* 主色按钮 */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #0056b3; /* 深色悬停 */
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


        .input-group select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
            background-color: rgba(255, 255, 255, 0.85); /* 半透明白色背景 */
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            padding-right: 40px; /* 为自定义箭头留出空间 */
            background-image: url('data:image/svg+xml;utf8,<svg fill="grey" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
            background-repeat: no-repeat;
            background-position: right 15px center;
        }

        .input-group select:focus {
            outline: none;
            border-color: #007bff;
        }



    /* 优化消息提示层样式 */
    .message-overlay {
        position: fixed;
        top: 20px;
        right: 20px;
        background: rgba(255, 235, 238, 0.95); /* 浅红色背景 */
        backdrop-filter: blur(8px);
        padding: 15px 25px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        border-left: 4px solid #ff5252; /* 红色强调线 */
        max-width: 500px;
        opacity: 0;
        transform: translateY(-20px);
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        pointer-events: none;
        font-size: 24px;
        font-weight: bold;
    }

    .message-overlay.show {
        opacity: 1;
        transform: translateY(0);
        pointer-events: auto;
    }

    .message-overlay::before {
        content: "⚠️";
        margin-right: 10px;
        font-size: 28px;
    }


    </style>
</head>

<body>
<%
    String message = (String) session.getAttribute("message");
%>

<div class="message-overlay <%= message != null ? "show" : "" %>">
    <%= message != null ? message : "" %>
</div>

<%
    message = null;
%>



<div class="login-container">
    <h1 class="login-title">医院系统登录</h1>
    <form action="loginServlet" method="post">
        <div class="input-group">
            <label for="patientId">用户名</label>
            <input type="text" id="patientId" name="username" required placeholder="请输入患者ID或注册手机号">
        </div>
        <div class="input-group">
            <label for="password">登录密码</label>
            <input type="password" id="password" name="password" required placeholder="请输入登录密码">
        </div>
        <div class="input-group">
            <label for="identity">登录身份</label>
            <select id="identity" name="identity" required>
                <option value="patient">患者</option>
                <option value="doctor">医生</option>
            </select>
        </div>

        <button type="submit" class="btn-login">立即登录</button>
        <div class="other-links">
            <a href="" style="color: black">忘记密码</a>
            <a href="register.jsp">用户注册</a>

            <%--            <br>--%>

            <a href="changePassword.jsp">修改密码</a>
            <a href="deleteAccount.jsp">注销账户</a>
        </div>
    </form>
</div>
</body>
</html>