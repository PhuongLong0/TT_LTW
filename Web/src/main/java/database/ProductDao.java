package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Category;
import bean.Product;
import bean.User;

public class ProductDao implements IProductDao {

	@Override
	public List<Product> all() {
		Connection connect;
		List<Product> res = new ArrayList<Product>();
		String sql = "SELECT * FROM product";
		String sqlimgage = "SELECT * FROM product_image  where id_product = ?";
		try {
			connect = DatabaseConnection.getConnection();
			Statement statment = connect.createStatement();
			ResultSet rs = statment.executeQuery(sql);
			while (rs.next()) {
				Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("detail"),
						rs.getDouble("cost"));

//				thêm danh sách ảnh
				PreparedStatement pre = connect.prepareStatement(sqlimgage);
				pre.setInt(1, rs.getInt("id"));
				ResultSet rsimg = pre.executeQuery();
				while (rsimg.next()) {
					product.getListimg().add(rsimg.getString("image"));
				}
				res.add(product);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(Product product) {
		// TODO Auto-generated method stub
		String sql = "Insert into product(name,quantity,cost,detail,category) values(?,?,?,?,?)";

		Connection connect;
		int res = 0;
		try {
			connect = DatabaseConnection.getConnection();
			PreparedStatement prs = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			prs.setString(1, product.getName());
			prs.setInt(2, product.getQuantity());
			prs.setDouble(3, product.getCost());
			prs.setString(4, product.getDetail());
			prs.setString(5, product.getCategory());
			res = prs.executeUpdate();

			updateCategory(product.getCategory());
			if (res > 0) {
				// Lấy ID của sản phẩm vừa chèn
				ResultSet rs = prs.getGeneratedKeys();
				if (rs.next()) {
					int productId = rs.getInt(1); // Lấy khóa tự động (id)
					product.setId(productId); // Gán id cho đối tượng Product
				}

				// Gọi insertImage để chèn ảnh cho sản phẩm
				insertImage(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	private int updateCategory(String category) {
		String sql = "update categories set soluong= soluong+1 where category=?";
		Connection connection;
		int res = 0;
		try {
			connection = DatabaseConnection.getConnection();
			PreparedStatement prs = connection.prepareStatement(sql);
			prs.setString(1, category);
			res = prs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	private void insertImage(Product product) {
		String sql = "INSERT INTO product_image(id_product, image) VALUES( ?, ?)";
		Connection connect = null;

		try {
			// Kết nối cơ sở dữ liệu
			connect = DatabaseConnection.getConnection();
			PreparedStatement prs = connect.prepareStatement(sql);

			// Duyệt qua danh sách hình ảnh của sản phẩm và chèn từng ảnh vào bảng
			// ProductImages
			for (int i = 0; i < product.getListimg().size(); i++) {
				// ...
				prs.setInt(1, product.getId()); // product_id là ID của sản phẩm
				prs.setString(2, product.getListimg().get(i)); // image là tên ảnh hoặc đường dẫn ảnh

				// Thực thi câu lệnh chèn ảnh
				prs.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int update(Product product) {
		String sql = "UPDATE product SET name= ?, quantity=?, cost=?, detail=?, category=? WHERE id = ?;";
		Connection connection;
		int res=0;
		try {
			connection = DatabaseConnection.getConnection();
			PreparedStatement prs= connection.prepareStatement(sql);
			prs.setString(1, product.getName());
			prs.setInt(2, product.getQuantity());
			prs.setDouble(3, product.getCost());
			prs.setString(4, product.getDetail());
			prs.setString(5, product.getCategory());
			prs.setInt(6, product.id);
			res=prs.executeUpdate();
			degreecategory(product);
			deleteImage(product);
			insertImage(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(Product product) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM product WHERE id=? ";
		Connection connection;
		int res = 0;
		try {
			connection = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, product.id);
			res = preparedStatement.executeUpdate();
			degreecategory(product);
			deleteImage(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	private void deleteImage(Product product) {
		String sql = "DELETE FROM product_image WHERE id_product=?";
		Connection connect = null;

		try {
			connect = DatabaseConnection.getConnection();
			PreparedStatement prs = connect.prepareStatement(sql);
			prs.setInt(1, product.getId());
			prs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private int degreecategory(Product product) {
		String sql = "update categories set soluong= soluong-1 where category=?";
		Connection connection;
		int res = 0;
		try {
			connection = DatabaseConnection.getConnection();
			PreparedStatement prs = connection.prepareStatement(sql);
			prs.setString(1, product.getCategory());
			res = prs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;

	}

	@Override
	public Product findById(String id) {
		// TODO Auto-generated method stub
		Connection connect;
		int pid = Integer.parseInt(id);
		String sql = "SELECT *" + "FROM product where id= ?";
		String imageSql = "SELECT * FROM product_image where id_product = ?";
		Product res = null;
		try {
			connect = DatabaseConnection.getConnection();
			PreparedStatement prs = connect.prepareStatement(sql);
			prs.setInt(1, pid);
			ResultSet rs = prs.executeQuery();
			if (rs.next()) {
				res = new Product(pid, rs.getString("name"), rs.getString("detail"), rs.getDouble("cost"));
				PreparedStatement preImage = connect.prepareStatement(imageSql);
				preImage.setInt(1, pid);
				ResultSet rsImage = preImage.executeQuery();
				while (rsImage.next()) {
					res.getListimg().add(rsImage.getString("image"));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public List<Category> getCategories() {
		Connection connect;
		List<Category> res = new ArrayList<>();
		String sql = "select * from categories";
		try {
			connect = DatabaseConnection.getConnection();
			Statement st = connect.createStatement();
			ResultSet resultset = st.executeQuery(sql);
			while (resultset.next()) {
				res.add(new Category(resultset.getString("category"), resultset.getInt("soluong")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public int count(String txtSearch) {
		String query = "SELECT count(*) FROM product WHERE name LIKE ?";
		Connection connect;
		int count = 0;
		try {
			connect = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = connect.prepareStatement(query);
			preparedStatement.setString(1, "%" + txtSearch + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt(1); // Retrieve the count value
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<Product> searchResult(String txtSearch) {
		Connection connect;
		List<Product> res = new ArrayList<>();
		String sql = "select * from product where name like ?";
		String sqlImage = "SELECT * FROM product_image WHERE id_product = ?";
		try {
			connect = DatabaseConnection.getConnection();
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setString(1, "%" + txtSearch + "%");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("detail"),
						rs.getDouble("cost"));

//				thêm danh sách ảnh
				PreparedStatement pre = connect.prepareStatement(sqlImage);
				pre.setInt(1, rs.getInt("id"));
				ResultSet rsimg = pre.executeQuery();
				while (rsimg.next()) {
					product.getListimg().add(rsimg.getString("image"));
				}
				res.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	public List<Product> filter(String categoryFilter) {
		// TODO Auto-generated method stub
		List<Product>res= new ArrayList<Product>();
		String sql="select * from product where category= ?";
		String imageSql = "SELECT * FROM product_image where id_product = ?";
		Connection conn;
		try {
			conn=DatabaseConnection.getConnection();
			PreparedStatement prs= conn.prepareStatement(sql);
			prs.setString(1, categoryFilter);
			ResultSet rs= prs.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("detail"),
						rs.getDouble("cost"));

//				thêm danh sách ảnh
				PreparedStatement pre = conn.prepareStatement(imageSql);
				pre.setInt(1, rs.getInt("id"));
				ResultSet rsimg = pre.executeQuery();
				while (rsimg.next()) {
					product.getListimg().add(rsimg.getString("image"));
				}
				res.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

}
