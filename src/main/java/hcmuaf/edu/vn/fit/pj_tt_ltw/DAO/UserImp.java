package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;
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
                String pass = result.getString("password");
                String role= result.getString("role");
                resultList.add(new Users(name, pass,role, role));
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
        // TODO Auto-generated method stub
        Connection conn = null;
        int row = 0;
        try {
            String sqluser = "INSERT INTO user (email, pass,firstname, lastname,role) VALUES (?, ?,?,?,?)";

            conn = DBConnect.getConnection();
            PreparedStatement preStatement1 = conn.prepareStatement(sqluser);
            preStatement1.setString(1, user.getEmail());
            preStatement1.setString(2, user.getPassword());
            preStatement1.setString(3, user.getFirstname());
            preStatement1.setString(4, user.getLastname());
            preStatement1.setInt(5, user.getRole());
            row += preStatement1.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return row ;
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
            String sql = "SELECT * FROM user WHERE email= ? ;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs= pstmt.executeQuery();
            while(rs.next()) {
                if(passwordEncoder.matches(password, rs.getString("pass"))) {
                    String userName = rs.getString("username");
                    email = rs.getString("email");
                    String role= rs.getString("role");
                    userTemp = new Users(userName, email, rs.getString("pass"),role);
                    break;
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return userTemp;
    }
}
