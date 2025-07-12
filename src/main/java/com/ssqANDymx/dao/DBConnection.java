package com.ssqANDymx.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:sqlserver://localhost;database=hqs";
    private static final String USER = "sa";
    private static final String PASSWORD = "wxyawxh517";

    public static Connection getConnection () throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        }
        catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
    }
}