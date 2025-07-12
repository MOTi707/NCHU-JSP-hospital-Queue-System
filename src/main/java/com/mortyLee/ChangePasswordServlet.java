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
 * @since 2025-5-14 21:11
 * 更改密码 controller
 */


@WebServlet("/changePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=hospitalQueueSystem";
    private static final String USER = "sa";
    private static final String PASS = "123456";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置字符编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取表单参数
        String username = request.getParameter("username");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        // 验证参数完整性（与其他Servlet逻辑一致）
        if (username == null || oldPassword == null || newPassword == null
                || username.trim().isEmpty() || oldPassword.trim().isEmpty() || newPassword.trim().isEmpty()) {
            request.setAttribute("errorMsg", "所有字段均为必填项");
            request.getRequestDispatcher("/changePassword.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 加载数据库驱动（参考DeleteAccountServlet）
            Class.forName(DRIVER);
            // 2. 建立数据库连接
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // 3. 验证原密码是否正确（参考LoginServlet的查询逻辑）
            String checkSql = "SELECT userID FROM [userTable] WHERE userName = ? AND userPassword = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, username);
            pstmt.setString(2, oldPassword);
            rs = pstmt.executeQuery();

            if (!rs.next()) { // 用户不存在或原密码错误
                request.setAttribute("errorMsg", "用户名不存在或原密码错误");
                request.getRequestDispatcher("/changePassword.jsp").forward(request, response);
                return;
            }

            // 4. 更新密码（参考DeleteAccountServlet的更新逻辑）
            String updateSql = "UPDATE [userTable] SET userPassword = ? WHERE userName = ?";
            pstmt = conn.prepareStatement(updateSql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, username);
            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                request.setAttribute("successMsg", "密码修改成功！");
            }
            else {
                request.setAttribute("errorMsg", "密码修改失败，请联系管理员");
            }

        }
        catch (ClassNotFoundException e) {
            request.setAttribute("errorMsg", "数据库驱动加载失败");
        }
        catch (SQLException e) {
            request.setAttribute("errorMsg", "数据库操作失败：" + e.getMessage());
        }
        finally {
            // 关闭数据库资源（参考DeleteAccountServlet）
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/changePassword.jsp").forward(request, response);
    }
}