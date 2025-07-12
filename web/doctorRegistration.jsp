<%@ page import="java.sql.*" %>
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
    <title>医生挂号</title>
    <style>
        .search-section {
            margin-bottom: 20px;
        }

        .search-input {
            width: 300px;
            padding: 8px;
        }

        .search-btn {
            padding: 8px 16px;
            background: #2196F3;
            color: white;
            border: none;
        }

        .doctor-table {
            width: 100%;
            border-collapse: collapse;
        }

        .doctor-table td, .doctor-table th {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }


        /* 整体样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background-color: #f5f7fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* 搜索区域 */
        .search-section {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .search-input {
            width: 300px;
            padding: 0.8rem 1rem;
            border: 2px solid #e0e5ec;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .search-input:focus {
            outline: none;
            border-color: #2196f3;
        }

        .search-btn {
            background-color: #2196f3;
            color: white;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            margin-left: 1rem;
            transition: background-color 0.3s;
        }

        .search-btn:hover {
            background-color: #1976d2;
        }

        /* 医生列表表格 */
        .doctor-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .doctor-table th, .doctor-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0e5ec;
        }

        .doctor-table th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: 500;
        }

        .doctor-table tr:hover {
            background-color: #f5f7fa;
            cursor: pointer;
        }

        /* 挂号表单（选择后显示） */
        .appointment-form {
            display: none;
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-top: 2rem;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }


        .section-title {
            margin: 0 30px;
            padding: 10px;

        }


        .btn-order {
            padding: 12px 24px;
            background: linear-gradient(135deg, #2196F3 0%, #1976D2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(33, 150, 243, 0.2);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        /* 悬停效果 */
        .btn-order:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(33, 150, 243, 0.3);
        }

        /* 点击动画 */
        .btn-order:active {
            transform: scale(0.98);
        }

        @keyframes ripple {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            100% {
                transform: scale(20);
                opacity: 0;
            }
        }

        /* 禁用状态 */
        .btn-order:disabled {
            background: #BBDEFB;
            cursor: not-allowed;
            box-shadow: none;
        }

    </style>
</head>


<body>
<h1 class="section-title">按医生姓名挂号</h1>

<div class="container">
    <form method="get">
        <div class="search-section">
            <input type="text" class="search-input" name="keyword"
                   placeholder="输入医生姓名"
                   value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
            <button type="submit" class="search-btn">搜索</button>
        </div>
    </form>

    <!-- 新增挂号表单 -->
    <table class="doctor-table">
        <thead>
        <tr>
            <th>姓名</th>
            <th>科室</th>
            <th>职称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            request.setCharacterEncoding("UTF-8");
            String keyword = request.getParameter("keyword");
            if (keyword != null && !keyword.isEmpty()) {
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    conn = DriverManager.getConnection(
                            "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem", "sa", "123456");
                    stmt = conn.createStatement();

                    String sql = "SELECT d.name, d.position, dep.name AS department  " +
                            "FROM doctor d " +
                            "JOIN department dep ON d.departmentID = dep.departmentID " +
                            "WHERE d.name LIKE '%" + keyword + "%'";

                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %>
            </td>
            <td><%= rs.getString("department") %>
            </td>
            <td><%= rs.getString("position") %>
            </td>

            <td>
                <!-- 每行单独的表单，只传递当前行数据 -->
                <form method="post" action="makeAppointment.jsp">
                    <input type="hidden" name="doctorName" value="<%= rs.getString("name") %>">
                    <input type="hidden" name="deptName" value="<%= rs.getString("department") %>">
                    <button type="submit" class="btn-order">挂号</button>
                </form>
            </td>
        </tr>

        <%
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        %>
        <tr>
            <td colspan="4">数据库查询失败</td>
        </tr>
        <%
            }
            finally {
                try {
                    if (rs != null) rs.close();
                }
                catch (SQLException e) {
                }
                try {
                    if (stmt != null) stmt.close();
                }
                catch (SQLException e) {
                }
                try {
                    if (conn != null) conn.close();
                }
                catch (SQLException e) {
                }
            }
        }
        else {
        %>
        <tr>
            <td colspan="4">请输入医生姓名进行搜索</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>


<script>
    function order() {
        //等待完善
    }
</script>


</body>
</html>