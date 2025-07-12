package com.zyh;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * @author zyh
 * @modify 整合
 * @since 2025-5-29 00:31:12
 */


public class JDBC {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=hospitalQueueSystem;encrypt=true;trustServerCertificate=true;charset=utf8";
    private static final String USER = "sa";
    private static final String PASSWORD = "123456";

    public static Connection getConnection () throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("SQL Server JDBC Driver已成功加载");
        }
        catch (ClassNotFoundException e) {
            throw new RuntimeException("SQL Server JDBC Driver未找到", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main (String[] args) {
        try (Connection conn = getConnection()) {
            System.out.println("数据库连接成功: " + conn);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
