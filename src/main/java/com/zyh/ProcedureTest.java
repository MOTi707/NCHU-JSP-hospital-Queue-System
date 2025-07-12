package com.zyh;

import java.sql.*;

/**
 * @author zyh
 * @modify 整合 修改数据库名字
 * @since 2025-5-29 00:31:12
 */

public class ProcedureTest {
    public static void main (String[] args) {
        testProcedure("day", "2025-05-16", "2025-05-16", 0);
    }

    static void testProcedure (String timeUnit, String start, String end, int deptId) {
        String sql = "{call sp_DepartmentDailyStatistics(?, ?, ?)}";

        try (Connection conn = JDBC.getConnection() ;
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setDate(1, Date.valueOf(start));
            stmt.setDate(2, Date.valueOf(end));
            stmt.setInt(3, deptId);

            ResultSet rs = stmt.executeQuery();

            ResultSetMetaData meta = rs.getMetaData();
            System.out.println("=== 存储过程返回结构 ===");
            for (int i = 1 ; i <= meta.getColumnCount() ; i++) {
                System.out.println(meta.getColumnName(i) + " (" + meta.getColumnTypeName(i) + ")");
            }

            System.out.println("=== 数据内容 ===");
            while (rs.next()) {
                System.out.println(
                        rs.getString("deptName") + "\t" +
                                rs.getString("date") + "\t" +
                                rs.getInt("patientCount")
                );
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}