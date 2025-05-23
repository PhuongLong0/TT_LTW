package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Categories;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    @Override
    public List<Products> all() {
        Connection connect;
        List<Products> res = new ArrayList<>();
        String sql = "SELECT * FROM products ";
        String sqlImage = "SELECT imageUrl FROM product_images WHERE productId = ?";
        try {connect = DBConnect.getConnection();
             Statement statement = connect.createStatement();
             ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Products products = new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getString("productDetail"),
                        rs.getInt("priceSell"));

                // Lấy danh sách ảnh theo productId
                PreparedStatement pre = connect.prepareStatement(sqlImage);
                pre.setInt(1, rs.getInt("productId"));
                ResultSet rsimg = pre.executeQuery();
                while (rsimg.next()) {
                    products.getListimg().add(rsimg.getString("imageUrl"));
                }

                res.add(products);
                }
            }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    @Override
    public int insert(Products products) {
        String sql = "INSERT INTO products (productName, priceBuy, priceSell, productDetail, brandName, createAt, categoryId) VALUES (?, ?, ?, ?, ?, ?, ?)";
        int res = 0;

        try (Connection connect = DBConnect.getConnection();
             PreparedStatement prs = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            prs.setString(1, products.getProductName());
            prs.setDouble(2, products.getPriceBuy());
            prs.setDouble(3, products.getPriceSell());
            prs.setString(4, products.getProductDetail());
            prs.setString(5, products.getBrandName());
            prs.setTimestamp(6, products.getCreateAt());
            prs.setInt(7, products.getCategoryId());

            res = prs.executeUpdate();
            if (res > 0) {
                ResultSet rs = prs.getGeneratedKeys();
                if (rs.next()) {
                    int productId = rs.getInt(1);
                    products.setProductId(productId);
                }
                insertImages(products);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }


    private int updateCategory(int categoryId) {
        String sql = "update categories set soluong= soluong+1 where categoryId=?";
        Connection connection;
        int res = 0;
        try {
            connection = DBConnect.getConnection();
            PreparedStatement prs = connection.prepareStatement(sql);
            prs.setInt(1, categoryId);
            res = prs.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return res;
    }

    private void insertImage(Products products) {
        String sql = "INSERT INTO products(productId, imageProduct ) VALUES( ?, ?)";
        Connection connect = null;

        try {
            // Kết nối cơ sở dữ liệu
            connect = DBConnect.getConnection();
            PreparedStatement prs = connect.prepareStatement(sql);

            // Duyệt qua danh sách hình ảnh của sản phẩm và chèn từng ảnh vào bảng
            // ProductImages
            for (String img : products.getListimg()) {
                prs.setInt(1, products.getProductId());
                prs.setString(2, img);
                prs.executeUpdate();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int update(Products products) {
        String sql = "UPDATE products SET productName = ?, priceBuy = ?, priceSell = ?, productDetail = ?, brandName = ?, categoryId = ? WHERE productId = ?";
        int res = 0;

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement prs = connection.prepareStatement(sql)) {

            prs.setString(1, products.getProductName());
            prs.setInt(2, products.getPriceBuy());
            prs.setInt(3, products.getPriceSell());
            prs.setString(4, products.getProductDetail());
            prs.setString(5, products.getBrandName());
            prs.setInt(6, products.getCategoryId());
            prs.setInt(7, products.getProductId());

            res = prs.executeUpdate();

            // Xóa và cập nhật danh sách ảnh
            deleteImages(products.getProductId());
            insertImages(products);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int delete(Products products) {
        String sql = "DELETE FROM products WHERE productId=? ";
        int res = 0;
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Xóa ảnh trước khi xóa sản phẩm
            deleteImages(products.getProductId());

            preparedStatement.setInt(1, products.getProductId());
            res = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public Products findById(String id) {
        System.out.println("Đang tìm sản phẩm ...");
        String sql = "SELECT * FROM products WHERE productId = ?";
        Products products = null;

        try (Connection connect = DBConnect.getConnection();
             PreparedStatement prs = connect.prepareStatement(sql)) {

            prs.setInt(1, Integer.parseInt(id));
            ResultSet rs = prs.executeQuery();

            if (rs.next()) {
                products = new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                );

                // Lấy danh sách ảnh từ bảng product_images
                products.setListimg(getImagesForProduct(products.getProductId()));
                System.out.println("Lấy sản phẩm thành công!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private void insertImages(Products products) {
        String sql = "INSERT INTO product_images (productId, imageProduct) VALUES (?, ?)";
        try (Connection connect = DBConnect.getConnection();
             PreparedStatement prs = connect.prepareStatement(sql)) {

            for (String img : products.getListimg()) {
                prs.setInt(1, products.getProductId());
                prs.setString(2, img);
                prs.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    private void deleteImages(int productId) {
        String sql = "DELETE FROM product_images WHERE productId=?";
        try (Connection connect = DBConnect.getConnection();
             PreparedStatement prs = connect.prepareStatement(sql)) {

            prs.setInt(1, productId);
            prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


private int degreecategory(Products products) {
    String sql = "update categories set soluong= soluong-1 where category=?";
    Connection connection;
    int res = 0;
    try {
        connection = DBConnect.getConnection();
        PreparedStatement prs = connection.prepareStatement(sql);
        prs.setInt(1, products.getCategoryId());
        res = prs.executeUpdate();
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

    return res;

}


    public List<Categories> getCategories() {
        List<Categories> res = new ArrayList<>();
        String sql = "SELECT * FROM categories";

        try (Connection connect = DBConnect.getConnection();
             Statement st = connect.createStatement();
             ResultSet resultset = st.executeQuery(sql)) {

            while (resultset.next()) {
                res.add(new Categories(resultset.getString("categoryName")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    //Search sản phẩm
    @Override
    public int count(String txtSearch) {
        String query = "SELECT count(*) FROM products WHERE productName LIKE ?";
        int count = 0;
        try (Connection connect = DBConnect.getConnection();
             PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            preparedStatement.setString(1, "%" + txtSearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public List<Products> searchResult(String txtSearch, int index, int size) {
        List<Products> res = new ArrayList<>();
        //String sql = "SELECT * FROM products WHERE productName LIKE ?";
        String sql = "SELECT * FROM products WHERE productName LIKE ? LIMIT ?, ?";
        try (Connection connect = DBConnect.getConnection();
             PreparedStatement ps = connect.prepareStatement(sql)) {

            int offset = (index - 1) * size;
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, offset);
            ps.setInt(3, size);

            // ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                );

                product.setListimg(getImagesForProduct(product.getProductId()));
                res.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;

}
// In ra số lượng 18 sản phẩm mới
    @Override
    public List<Products> getNewestProducts(int size) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY createAt DESC LIMIT ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, size);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductId(rs.getInt("productId"));
                p.setProductName(rs.getString("productName"));
                p.setPriceBuy(rs.getInt("priceBuy"));
                p.setPriceSell(rs.getInt("priceSell"));
                p.setProductDetail(rs.getString("productDetail"));
                p.setBrandName(rs.getString("brandName"));
                p.setCreateAt(rs.getTimestamp("createAt"));
                p.setCategoryId(rs.getInt("categoryId"));
               // p.setImageId(rs.getInt("imageId"));

                list.add(p);
            }
            for (Products p : list) {
                List<String> images = getImagesForProduct(p.getProductId());
                p.setListimg(images);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
// Lọc trong sản phẩm mới
    @Override
    public List<Products> filterNewest(String categoryName) {
            List<Products> list = new ArrayList<>();
        String imgSql = "SELECT * FROM product_images WHERE productId=?";
        try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(
                         "SELECT * FROM products p " +
                                 "JOIN categories c ON p.categoryId = c.categoryId " +
                                 "WHERE c.categoryName = ? " +
                                 "ORDER BY p.createAt DESC")) {
                ps.setString(1, categoryName);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Products product = new Products(
                            rs.getInt("productId"),
                            rs.getString("productName"),
                            rs.getInt("priceBuy"),
                            rs.getInt("priceSell"),
                            rs.getString("productDetail"),
                            rs.getString("brandName"),
                            rs.getTimestamp("createAt"),
                            rs.getInt("categoryId")

                    );
                    try (PreparedStatement pre = conn.prepareStatement(imgSql)) {
                        pre.setInt(1, product.getProductId());
                        ResultSet rsimg = pre.executeQuery();
                        while (rsimg.next()) {
                            product.getListimg().add(rsimg.getString("imageURL"));
                        }
                    }
                    list.add(product);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;


    }

    private List<String> getImagesForProduct(int productId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT imageURL FROM product_images WHERE productId=?";
        try (Connection connect = DBConnect.getConnection();
             PreparedStatement prs = connect.prepareStatement(sql)) {

            prs.setInt(1, productId);
            ResultSet rs = prs.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("imageURL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }


    public List<Products> filter(String categoryFilter) {
        List<Products> res = new ArrayList<>();
        //String sql = "SELECT * FROM products WHERE categoryName = ?";
        String sql =
                "SELECT p.* FROM products p " +
                        "JOIN categories c ON p.categoryId = c.categoryId " +
                        "WHERE c.categoryName = ?";
        String imgSql = "SELECT * FROM product_images WHERE productId=?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement prs = conn.prepareStatement(sql)) {

            prs.setString(1, categoryFilter);
            ResultSet rs = prs.executeQuery();

            while (rs.next()) {
                Products product = new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                );

                //thêm danh sách ảnh
                PreparedStatement pre = conn.prepareStatement(imgSql);
                pre.setInt(1, rs.getInt("productId"));
                ResultSet rsimg = pre.executeQuery();
                while (rsimg.next()) {
                    product.getListimg().add(rsimg.getString("imageURL"));
                }
                res.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public int countAll() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM products";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    //Gọi lấy ảnh trong giỏ hàng
    public String getFirstImage(int productId) {
        String sql = "SELECT imageUrl FROM Product_Images WHERE productId = ? LIMIT 1";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("imageUrl");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "default.jpg"; // Ảnh mặc định nếu không có
    }

}
