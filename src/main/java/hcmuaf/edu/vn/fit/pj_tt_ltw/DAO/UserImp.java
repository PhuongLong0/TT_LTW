package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Service.MailjetService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserImp implements UserDao{

    @Override
    public List<Users> all() {
        Connection conn = null;
        List<Users> resultList = new ArrayList<Users>();
        try {
//ket noi database
            conn = DBConnect.getConnection();
//tao statement
            Statement stmt = conn.createStatement();
//ResulSet Lấy kq trả về
            ResultSet result = stmt.executeQuery("SELECT * FROM user;");
            while (result.next()) {
                String name = result.getString("userName");
                String pass = result.getString("passwordUser");
                int role= result.getInt("role");
                resultList.add(new Users(name, pass,role));
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultList;
    }

    @Override
    public int insert(Users user) {
        Connection conn = null;
        int row = 0;
        try {
            String sql = "INSERT INTO users (username, firstname, lastname,passwordUser,  role, email,created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getFirstname());
            ps.setString(3, user.getLastname());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getRole());
            ps.setString(6, user.getEmail());
            ps.setTimestamp(7, user.getCreatedAt());
            ps.setTimestamp(8, user.getUpdatedAt());

            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }


    @Override
    public int update(Users user) {
        return 0;
    }

    @Override
    public int delete(Users user) {
        return 0;
    }
    public boolean checkAdmin(String admin,String password) {
        boolean res=false;
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM user WHERE email= ? AND pass= ? and role= ? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,admin);
            pstmt.setString(2,password);
            pstmt.setString(3, "admin");
            ResultSet result = pstmt.executeQuery();

            res=result.next();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    @Override
    public Users checkPass(String email, String password) {
        Connection conn = null;
        Users userTemp = null;
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        try {
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM users WHERE email= ? ;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs= pstmt.executeQuery();
            while(rs.next()) {
                String hashedPassword = rs.getString("passwordUser");
                if(passwordEncoder.matches(password, hashedPassword)) {
                    int id = rs.getInt("userid");
                    String userName = rs.getString("username");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    int role = rs.getInt("role");
                    String emailFromDB = rs.getString("email");

                    userTemp = new Users(id, userName, hashedPassword, firstname, lastname, role, emailFromDB);
                }
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return userTemp;
    }

    @Override
    public boolean existsEmail(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updatePassword(String emailToReset, String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        try {
            conn = DBConnect.getConnection();
            String sql = "UPDATE users SET password = ? WHERE email = ?";
            stmt = conn.prepareStatement(sql);

            // Mã hóa mật khẩu mới
            String hashedPassword = passwordEncoder.encode(newPassword);

            stmt.setString(1, hashedPassword);
            stmt.setString(2, emailToReset);

            int affected = stmt.executeUpdate();
            return affected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean sendOtpToEmail(String email, String otp) {
        try {
            return MailjetService.sendOtpMail(email, otp);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
