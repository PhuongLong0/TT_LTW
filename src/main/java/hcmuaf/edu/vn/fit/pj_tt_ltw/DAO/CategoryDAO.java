package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Categories;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CategoryDAO {
    public List<Categories> getCategoriesWithProductCount() {
        List<Categories> list = new ArrayList<>();
        String sql = "SELECT c.categoryId, c.categoryName, COUNT(p.productId) as productCount " +
                "FROM categories c LEFT JOIN products p ON c.categoryId = p.categoryId " +
                "GROUP BY c.categoryId, c.categoryName";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Categories category = new Categories(
                        rs.getInt("categoryId"),
                        rs.getString("categoryName")
                );
                category.setNum(rs.getInt("productCount"));
                list.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

}
