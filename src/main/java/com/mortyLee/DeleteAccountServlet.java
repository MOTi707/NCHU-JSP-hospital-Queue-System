package com.mortyLee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


/**
 * @author Morty Lee
 * @since 2025-5-14 21:11
 * 注销用户 controller
 */

@WebServlet("/deleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem";
    private static final String USER = "sa";
    private static final String PASS = "123456";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取表单参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String inputCaptcha = request.getParameter("captcha");
        HttpSession session = request.getSession();
        String correctCaptcha = (String) session.getAttribute("captcha");

        // 1. 验证验证码
        if (inputCaptcha == null || !inputCaptcha.equals(correctCaptcha)) {
            request.setAttribute("errorMsg", "验证码错误");
            request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 2. 数据库连接
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // 3. 验证用户是否存在
            /*String checkSql = "SELECT userID FROM [userTable] WHERE userName = ? AND userPassword = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();*/
            String checkSql = "SELECT userID FROM [userTable] WHERE userName = '" + username + "' AND userPassword = '" + password + "'";
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(checkSql);

            if (!rs.next()) {
                request.setAttribute("errorMsg", "用户名或密码错误或账号不存在");
                request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
                return;
            }

            // 4. 执行删除操作（注意：如果有外键关联，可能需要先删除关联表数据）
            int userId = rs.getInt("userID");
            String deleteSql = "DELETE FROM [userTable] WHERE userID = ?";
            pstmt = conn.prepareStatement(deleteSql);
            pstmt.setInt(1, userId);
            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                // 删除成功，销毁会话
                session.invalidate();

                // 输出JavaScript弹窗并跳转
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>");
                    out.println("alert('账户注销成功！');");  // 弹窗提示
                    out.println("window.location.href = 'login.jsp';");  // 跳转至登录页
                    out.println("</script>");
                }
            }
            else {
                request.setAttribute("errorMsg", "账户删除失败");
                request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
            }

        }
        catch (ClassNotFoundException e) {
            request.setAttribute("errorMsg", "数据库驱动加载失败");
            request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
        }
        catch (SQLException e) {
            // 处理外键约束异常（如用户有预约记录）
            if (e.getErrorCode() == 547) {
                // SQL Server外键约束错误码
                request.setAttribute("errorMsg", "存在关联数据（如预约记录），无法注销");
            }
            else {
                request.setAttribute("errorMsg", "数据库操作失败：" + e.getMessage());
            }
            request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
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