<%-- web/DBConnection.jsp --%>
<%@ page import="java.sql.*" %>

<%!
  public class DBConnection {
    // 数据库连接参数，请根据实际情况修改
    private static final String URL = "jdbc:sqlserver://localhost;database=HospitalQueueSystem";
    private static final String USER = "sa";
    private static final String PASSWORD = "123456";  // 替换为你的数据库密码

    // 驱动名称
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    // 获取数据库连接
    public Connection getConnection() throws SQLException {
      try {
        Class.forName(DRIVER);
      } catch (ClassNotFoundException e) {
        throw new RuntimeException("数据库驱动加载失败", e);
      }
      return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 关闭资源（Connection, Statement, ResultSet）
    public void closeResources(Connection conn, Statement stmt, ResultSet rs) {
      try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
      try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
      try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }
  }
%>
