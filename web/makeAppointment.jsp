<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取当前患者ID（从session获取）
    request.setCharacterEncoding("UTF-8");
    String patientName = (String) session.getAttribute("username");
   /* if (patientId == null) {
        response.sendRedirect("login.jsp");
        return;
    }*/

    // 获取表单参数
    String doctorName = request.getParameter("doctorName");
    String deptName = request.getParameter("deptName");
    System.out.println("接收参数-医生姓名：" + doctorName + "，科室名称：" + deptName);

    // 数据库操作
    Connection conn = null;
    Statement stmt = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(
                "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem", "sa", "123456");
        stmt = conn.createStatement();

        // 第一步：通过医生姓名和科室名称查询医生ID
        String queryDoctorIdSql = "SELECT d.doctorID " +
                "FROM doctor d " +
                "JOIN department dept ON d.departmentID = dept.departmentID " +
                "WHERE d.name = '" + doctorName + "' AND dept.name = '" + deptName + "'";
        ResultSet doctorIdRs = stmt.executeQuery(queryDoctorIdSql);

        if (!doctorIdRs.next()) {
            out.println("挂号失败：未找到对应医生信息（姓名：" + doctorName + "，科室：" + deptName + "）");
            return;
        }
        int doctorId = doctorIdRs.getInt("doctorID");
        System.out.println("查询到医生ID：" + doctorId);

        String dateTime= LocalDateTime.now().toString();
        // 第二步：插入挂号记录（状态0表示待就诊，使用GETDATE()获取当前时间）
        /*String insertSql = "INSERT INTO recentappointment " +
                "(username, doctorID, priority, scheduledTime) " +
                "VALUES ('" + patientName + "', " + doctorId + ", '" + 5 + "', GETDATE())";*/
        String insertSql = "INSERT INTO recentappointment " +
                "(username, doctorID, priority, scheduledTime) " +
                "VALUES ('" + patientName + "', " + doctorId + ", '" + 5 + "', '"+dateTime+"')";
        stmt.executeUpdate(insertSql);

        // 挂号成功跳转
        request.setAttribute("successMessage", "挂号成功！医生：" + doctorName + "，科室：" + deptName);
        // 使用forward保持request属性
        RequestDispatcher dispatcher = request.getRequestDispatcher("patientInfo.jsp");
        dispatcher.forward(request, response);
        //response.sendRedirect("patientInfo.jsp");
    }
    catch (Exception e) {
        e.printStackTrace();
        out.println("挂号失败：" + e.getMessage());
    }
    finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>