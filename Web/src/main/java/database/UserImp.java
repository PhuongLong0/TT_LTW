package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.mysql.cj.protocol.Resultset;

import bean.User;

public class UserImp implements UserDao {

	@Override
	public List<User> all() {
		Connection conn = null;
		List<User> resultList = new ArrayList<User>();
		try {
//ket noi database
			conn = DatabaseConnection.getConnection();
//tao statement
			Statement stmt = conn.createStatement();
//ResulSet Lấy kq trả về
			ResultSet result = stmt.executeQuery("SELECT * FROM user;");
			while (result.next()) {
				String name = result.getString("userName");
				String pass = result.getString("password");
				String role= result.getString("role");
				resultList.add(new User(name, pass,role));
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
	public int insert(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		int row = 0;
		try {
			String sqluser = "INSERT INTO user (email, pass,firstname, lastname,role) VALUES (?, ?,?,?,?)";
			
			conn = DatabaseConnection.getConnection();
			PreparedStatement preStatement1 = conn.prepareStatement(sqluser);
			preStatement1.setString(1, user.getEmail());
			preStatement1.setString(2, user.getPassword());
			preStatement1.setString(3, user.getFirstname());
			preStatement1.setString(4, user.getLastname());
			preStatement1.setString(5, user.getRole());
			row += preStatement1.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row ;
	}

	@Override
	public int update(User user) {
		return 0;
	}

	@Override
	public int delete(User user) {
		return 0;
	}
	public boolean checkAdmin(String admin,String password) {
		boolean res=false;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
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
	public User checkPass(String email, String password) {
		Connection conn = null;
		User userTemp = null;
		 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT * FROM user WHERE email= ? ;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()) {
				if(passwordEncoder.matches(password, rs.getString("pass"))) {
					String firstName = rs.getString("firstname");
					String lastName = rs.getString("lastname");
					String role= rs.getString("role");
					userTemp = new User(firstName, lastName, email, rs.getString("pass"),role);
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
