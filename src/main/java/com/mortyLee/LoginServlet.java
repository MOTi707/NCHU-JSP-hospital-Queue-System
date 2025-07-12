package com.mortyLee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;


/**
 * @author Morty Lee
 * @update 2025-5-24 18:18:23
 * 用户登录 controller
 * @since 2025-5-14 21:11
 */

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem";
    private static final String USER = "sa";
    private static final String PASS = "123456";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取表单参数（对应login.jsp中input的name属性）
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 加载JDBC驱动
            Class.forName(DRIVER);
            // 2. 建立数据库连接
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("连接成功");
            // 3. 执行SQL查询
            String sql = "SELECT * FROM userTable WHERE username = '" + username + "' AND userPassword = '" + password + "'";
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            // 4. 验证登录结果
            if (rs.next()) {
                // 登录成功：跳转到患者主页面（需根据实际路径修改）
                request.getSession().setAttribute("username", username); // 保存用户会话
                if (identity.equals("patient")) {
                    response.sendRedirect("choose.jsp");
                }
                else if (identity.equals("doctor")) {
                    response.sendRedirect("chooseFuncDoc.jsp");
                }
            }
            else {
                // 登录失败：返回登录页并提示错误
                request.setAttribute("errorMsg", "用户名或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }


        catch (ClassNotFoundException e) {
            // 驱动未找到异常
            System.out.println("数据库驱动加载失败，请检查JDBC驱动");
        }
        catch (SQLException e) {
            System.out.println("数据库操作失败：");
        }
        finally {
            // 关闭数据库资源
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}