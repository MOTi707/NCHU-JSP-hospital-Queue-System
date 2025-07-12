package com.mortyLee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


/**
 * @author Morty Lee
 * @since 2025-5-14 21:11
 * 用户注册 controller
 */

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem";
    private static final String USER = "sa";
    private static final String PASS = "123456";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String inputCaptcha = request.getParameter("captcha");
        String correctCaptcha = (String) request.getSession().getAttribute("captcha");

        // 1. 验证验证码（保持逻辑，错误提示已通过request传递）
        if (inputCaptcha == null || !inputCaptcha.equals(correctCaptcha)) {
            request.setAttribute("errorMsg", "验证码错误");  // 明确提示验证码问题
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 2. 验证参数完整性（保持不变）
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("errorMsg", "用户名和密码不能为空");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();  // 创建普通Statement

            // 3. 检查用户名是否已存在（改为拼接SQL）
            String checkSql = "SELECT COUNT(*) FROM [userTable] WHERE userName = '" + username + "'";
            rs = stmt.executeQuery(checkSql);
            rs.next();
            if (rs.getInt(1) > 0) {
                request.setAttribute("errorMsg", "用户名已存在，请更换");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // 4. 插入新用户（改为拼接SQL）
            String insertSql = "INSERT INTO [userTable] (userName,userType,userPassword) VALUES ('" + username + "','patient', '" + password + "')";
            int affectedRows = stmt.executeUpdate(insertSql);

            if (affectedRows > 0) {
                // 注册成功提示（保持不变）
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>");
                    out.println("alert('注册成功！请登录');");
                    out.println("window.location.href = 'login.jsp';");
                    out.println("</script>");
                }
            }
            else {
                request.setAttribute("errorMsg", "注册失败，请联系管理员");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        }
        catch (ClassNotFoundException e) {
            request.setAttribute("errorMsg", "数据库驱动加载失败，请联系管理员");  // 明确驱动问题
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        catch (SQLException e) {
            // 参考DeleteAccountServlet，可添加特定错误码处理（如外键约束）
            request.setAttribute("errorMsg", "数据库操作失败：" + e.getMessage());  // 传递具体异常信息
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        finally {
            // 关闭资源（改为关闭Statement）
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();  // 替换pstmt为stmt
                if (conn != null) conn.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}