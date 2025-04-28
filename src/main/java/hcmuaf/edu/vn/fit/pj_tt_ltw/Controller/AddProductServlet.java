package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.UUID;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddProductServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String name = request.getParameter("name");
        String categoryIdStr = request.getParameter("categoryId"); // Đổi từ category -> categoryId
        String priceBuyStr = request.getParameter("priceBuy");
        String priceSellStr = request.getParameter("priceSell");
        String quantityStr = request.getParameter("quantity");
        String detail = request.getParameter("detail");
        String brandName = request.getParameter("brandName");


        // Kiểm tra lỗi nhập liệu
        if (name == null || name.trim().isEmpty() ||
                categoryIdStr == null || categoryIdStr.trim().isEmpty() ||
                priceBuyStr == null || priceBuyStr.trim().isEmpty() ||
                priceSellStr == null || priceSellStr.trim().isEmpty() ||
                quantityStr == null || quantityStr.trim().isEmpty() ||
                detail == null || detail.trim().isEmpty() ||
                brandName == null || brandName.trim().isEmpty()) {

            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
            return;
        }

        try {
            int categoryId = Integer.parseInt(categoryIdStr);
            int priceBuy = Integer.parseInt(priceBuyStr);
            int priceSell = Integer.parseInt(priceSellStr);
            int quantity = Integer.parseInt(quantityStr);

            if (priceBuy <= 0 || priceSell <= 0 || quantity <= 0) {
                request.setAttribute("errorMessage", "Giá mua, giá bán và số lượng phải lớn hơn 0.");
                request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
                return;
            }

            // Lấy danh sách hình ảnh (chỉ lấy một ảnh)
            String imageName = null;
            for (Part imagePart : request.getParts()) {
                if (imagePart.getContentType() != null && imagePart.getContentType().startsWith("image/")) {
                    String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

                    // Lưu file vào thư mục images
                    String uploadPath = getServletContext().getRealPath("/images");
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    String storeName = changeName(fileName);
                    String filePath = uploadPath + File.separator + storeName;
                    imagePart.write(filePath);

                    imageName = storeName; // Lưu tên file ảnh đầu tiên
                    break;
                }
            }

            // Tạo đối tượng sản phẩm mới
            Products products = new Products();
            products.setProductName(name);
            products.setPriceBuy(priceBuy);
            products.setPriceSell(priceSell);
            products.setProductDetail(detail);
            products.getListimg();
            products.setBrandName(brandName);
            products.setCreateAt(new Timestamp(System.currentTimeMillis())); // Thêm ngày tạo sản phẩm
            products.setCategoryId(categoryId);

            // Kết nối tới ProductDao để lưu sản phẩm
            ServletContext application = getServletContext();
            ProductDAO dao = (ProductDAO) application.getAttribute("products");

            dao.insert(products);

            // Chuyển hướng sau khi thêm sản phẩm thành công
            response.sendRedirect("adminAdd.jsp");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Giá hoặc số lượng không hợp lệ.");
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
        }
    }

    private String changeName(String fileName) {
        // Tạo chuỗi ngẫu nhiên bằng UUID
        String randomString = UUID.randomUUID().toString();
        // Kết hợp chuỗi ngẫu nhiên với phần mở rộng của file
        return randomString + fileName;
    }


}
