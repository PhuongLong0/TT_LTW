package hcmuaf.edu.vn.fit.pj_tt_ltw.DB;

import java.sql.*;

public class DBConnect {
    static String url = "jdbc:mysql://localhost:3306/QLBanDongHoDatabase";
    static Connection conn = null;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                makeConnect();
            }
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    private static void makeConnect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, DbProperties.username(), DbProperties.password());

    }

    public static Statement get() {
        try {
            if (conn == null || conn.isClosed()) {
                makeConnect(); // Tạo kết nối nếu chưa có hoặc kết nối đã đóng
            }
            return conn.createStatement(); // Trả về Connection hợp lệ
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) throws SQLException {
        Statement s = DBConnect.get();
        if (s == null) return;
        ResultSet rs = s.executeQuery("select * from products");
        while (rs.next()) {
            System.out.println(rs.getInt(1) + ";" + rs.getString(2) + ";" + rs.getInt(3) + ";" + rs.getInt(4) + ";" +
                    rs.getString(5) + ";" + rs.getString(6) + ";" + rs.getString(7) +  ";"
                    + rs.getTimestamp(8) + ";" + rs.getInt(9));

        }
    }
}
