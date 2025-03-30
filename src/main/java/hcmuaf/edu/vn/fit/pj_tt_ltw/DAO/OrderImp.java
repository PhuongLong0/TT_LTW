package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Orders;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderImp implements OrderDAO{
    @Override
    public List<Orders> all() {
        String sql="select * from donhang ";
        String productsql="select * from product p join donhang_product dp on p.id=dp.product_id where donhang_id=?";
        Connection connection;
        List <Orders>res= new ArrayList<Orders>();
      /*  try {
            connection= DBConnect.getConnection();
            PreparedStatement prs= connection.prepareStatement(sql);
            ResultSet rs= prs.executeQuery();
            while(rs.next()) {
                List<Products> list= new ArrayList<Products>();
                PreparedStatement pr= connection.prepareStatement(productsql);
                pr.setInt(1, rs.getInt("id"));
                ResultSet rsp= pr.executeQuery();
                while(rsp.next()) {
                    list.add(new Products(rsp.getInt("id"), rsp.getString("name"), rsp.getString("detail"), rsp.getDouble("cost")));
                }
                res.add(new Orders(rs.getInt("id"),list, rs.getDate("ngaylaphoadon"), rs.getBoolean("pheduyet")));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/

        return res;
    }

    @Override
    public int insert(Orders donhang) {
        Connection conn = null;
        PreparedStatement pstmtDonHang = null;
        PreparedStatement pstmtDonHangProduct = null;
        int rowsAffected = 0;

       /* try {
            // Kết nối tới cơ sở dữ liệu
            conn = DBConnect.getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Câu lệnh chèn vào bảng `donhang`
            String sqlDonHang = "INSERT INTO donhang (ngaylaphoadon, pheduyet) VALUES (?, ?)";
            pstmtDonHang = conn.prepareStatement(sqlDonHang, Statement.RETURN_GENERATED_KEYS);
            pstmtDonHang.setDate(1, new java.sql.Date(donhang.getNgaylaphoadon().getTime()));
            pstmtDonHang.setBoolean(2, donhang.isPheduyet());
            pstmtDonHang.executeUpdate();

            // Lấy ID đơn hàng vừa chèn
            ResultSet generatedKeys = pstmtDonHang.getGeneratedKeys();
            if (generatedKeys.next()) {
                int donhangId = generatedKeys.getInt(1);

                // Câu lệnh chèn vào bảng `donhang_product`
                String sqlDonHangProduct = "INSERT INTO donhang_product (donhang_id, product_id, quantity) VALUES (?, ?, ?)";
                pstmtDonHangProduct = conn.prepareStatement(sqlDonHangProduct);

                // Duyệt qua danh sách sản phẩm
                for (Products product : donhang.getListproduct()) {
                    pstmtDonHangProduct.setInt(1, donhangId);
                    pstmtDonHangProduct.setInt(2, product.getProductId());
                    pstmtDonHangProduct.setInt(3, product.getQuantity());
                    pstmtDonHangProduct.addBatch(); // Thêm batch để tối ưu
                }

                // Thực thi batch
                int[] productRows = pstmtDonHangProduct.executeBatch();
                rowsAffected = productRows.length;
            }

            conn.commit(); // Commit transaction
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback nếu có lỗi
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (pstmtDonHang != null) pstmtDonHang.close();
                if (pstmtDonHangProduct != null) pstmtDonHangProduct.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }*/

        return rowsAffected; // Số dòng sản phẩm được chèn
    }


    @Override
    public int update(Orders donhang) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int delete(Orders donhang) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public void duyet(int id) {
        String sql = "UPDATE donhang SET pheduyet = true WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preStatement = conn.prepareStatement(sql)) {
            // Gán giá trị id cho câu lệnh SQL
            preStatement.setInt(1, id);

            // Thực thi câu lệnh
            int rowsUpdated = preStatement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Đơn hàng ID " + id + " đã được phê duyệt thành công.");
            } else {
                System.out.println("Không tìm thấy đơn hàng với ID: " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
