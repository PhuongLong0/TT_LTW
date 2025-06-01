package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

/**
 * Servlet implementation class BrandServlet
 */
@WebServlet(name = "BrandsServlet", value = "/brand")
public class BrandsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandsServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAO();
        List<String> brands = Arrays.asList("OMEGA", "LONGINES", "G-SHOCK", "Garmin");

        // Kiểm tra nếu có tham số "brand" được gửi từ View Products
        String selectedBrand = request.getParameter("brand");
        System.out.println("Brand Selected: " + selectedBrand);

        if (selectedBrand != null && !selectedBrand.isEmpty()) {
            // Trường hợp người dùng click "View Products" theo brand => chuyển sang BrandProducts.jsp
            List<Products> productsByBrand = productDAO.getProductsByBrand(selectedBrand);

            Map<String, List<Products>> brandProductMap = new LinkedHashMap<>();
            for (String brand : brands) {
                brandProductMap.put(brand, productDAO.getProductsByBrand(brand));
            }
            request.setAttribute("brandProducts", brandProductMap);
            request.setAttribute("products", productsByBrand);
            request.setAttribute("brandName", selectedBrand);
            request.getRequestDispatcher("/BrandProducts.jsp").forward(request, response);
        } else {
            // Trường hợp vào trang brands.jsp
            Map<String, Integer> brandProductCount = new HashMap<>();
            for (String brand : brands) {
                int count = productDAO.countProductsByBrand(brand);
                brandProductCount.put(brand, count);
            }
            request.setAttribute("brandProductCount", brandProductCount);
            request.setAttribute("brands", brands); // Gửi list brands để JSP xử lý lặp
            request.getRequestDispatcher("/brands.jsp").forward(request, response);
        }
    }
        // Tạo map lưu brand -> list sản phẩm
//        Map<String, List<Products>> brandProductsMap = new HashMap<>();
//        for (String brand : brands) {
//            List<Products> list = productDAO.getProductsByBrand(brand);
//            brandProductsMap.put(brand, list);
//        }
//
//        request.setAttribute("productsBrand", brandProductsMap);
//        request.getRequestDispatcher("/BrandProducts.jsp").forward(request, response);
//        // Lấy count sản phẩm thuộc brand đó
//        Map<String, Integer> brandProductCount = new HashMap<>();
//        for (String brand : brands) {
//            int count = productDAO.countProductsByBrand(brand);
//            brandProductCount.put(brand, count);
//        }
//        request.setAttribute("productsBrand", brands);
//        request.setAttribute("brandProductCount", brandProductCount);
//        request.getRequestDispatcher("/brands.jsp").forward(request, response);


//}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //doGet(request, response);

    }

}
