<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /**
     * @author Morty Lee
     * @since 2025-5-24 18:15:37
     */
%>


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
    <title>选择挂号方式</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 整体容器 */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 2rem;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
        }

        /* 标题样式 */
        .page-title {
            color: #2c3e50;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2.5rem;
            font-weight: 500;
        }

        /* 按钮容器（flex布局实现水平排列） */
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 1.5rem; /* 按钮间距 */
            padding: 0 2rem;
        }

        /* 挂号按钮通用样式 */
        .reg-button {
            padding: 1.2rem;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none; /* 链接去下划线 */
        }

        /* 按科室挂号按钮 */
        .dept-button {
            background: #42a5f5;
            color: white;
            box-shadow: 0 2px 8px rgba(66, 165, 245, 0.2);
        }

        .dept-button:hover {
            background: #2196f3;
            transform: translateY(-2px);
        }

        /* 按医生挂号按钮 */
        .doctor-button {
            background: #66bb6a;
            color: white;
            box-shadow: 0 2px 8px rgba(102, 187, 106, 0.2);
        }

        .doctor-button:hover {
            background: #4caf50;
            transform: translateY(-2px);
        }

        /* 图标样式（可选，需引入图标库或替换为本地图标） */
        .button-icon {
            margin-right: 0.8rem;
            font-size: 1.4rem;
        }

        /* 个人中心按钮 */
        .profile-button {
            background: #9575cd; /* 淡紫色主色调 */
            color: white;
            box-shadow: 0 2px 8px rgba(149, 117, 205, 0.2); /* 与主色匹配的阴影 */
        }

        .profile-button:hover {
            background: #7e57c2; /* 加深的淡紫色悬停颜色 */
            transform: translateY(-2px); /* 保持一致的上移动画 */
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="page-title">选择挂号方式</h1>
    <div class="button-group">


        <!-- 按医生挂号按钮（跳转到医生挂号页） -->
        <a href="doctorRegistration.jsp" class="reg-button doctor-button">
            按医生姓名挂号
        </a>

        <!-- 按科室挂号按钮（跳转到科室挂号页） -->
        <a href="chooseDept.jsp" class="reg-button dept-button">
            按科室挂号
        </a>
    </div>


    <h1 class="page-title">个人中心</h1>
    <div class="button-group">
        <!-- 个人中心按钮（跳转到个人中心页） -->
        <a href="patientInfo.jsp" class="reg-button profile-button">
            个人中心
        </a>
    </div>


</div>
</body>
</html>