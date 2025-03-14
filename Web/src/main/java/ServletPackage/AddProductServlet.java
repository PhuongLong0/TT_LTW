package ServletPackage;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

import jakarta.servlet.http.Part;
import bean.Product;
import database.ProductDao;
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
        String category = request.getParameter("category");
        String costStr = request.getParameter("cost");
        String quantityStr = request.getParameter("quantity");
        String detail = request.getParameter("detail");
        
        // Lấy tất cả các phần file
        Collection<Part> imageParts = request.getParts(); // Lấy tất cả các phần tử từ form
        
        // Kiểm tra lỗi nhập liệu
        if (name == null || name.trim().isEmpty() ||
            category == null || category.trim().isEmpty() ||
            costStr == null || costStr.trim().isEmpty() ||
            quantityStr == null || quantityStr.trim().isEmpty() ||
            detail == null || detail.trim().isEmpty()) {

            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
            return;
        }

        try {
            double cost = Double.parseDouble(costStr);
            int quantity = Integer.parseInt(quantityStr);

            if (cost <= 0 || quantity <= 0) {
                request.setAttribute("errorMessage", "Giá và số lượng phải lớn hơn 0.");
                request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
                return;
            }

            // Lưu danh sách hình ảnh
            ArrayList<String> imageNames = new ArrayList<>();
            for (Part imagePart : imageParts) {
                // Kiểm tra nếu là phần file hình ảnh
                if (imagePart.getContentType() != null && imagePart.getContentType().startsWith("image/")) {
                    String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                    
                    // Lưu file vào thư mục images
                    String uploadPath = getServletContext().getRealPath("/images");
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    String storeName=changeName(fileName);
                    String filePath = uploadPath + File.separator + storeName;
                    imagePart.write(filePath);

                    imageNames.add(storeName); // Thêm tên file vào danh sách
                }
            }

            // Kết nối tới ProductDao để lưu sản phẩm
            ServletContext application = getServletContext();
            ProductDao dao = (ProductDao) application.getAttribute("products");

            dao.insert(new Product(name, imageNames, detail, cost, category, quantity));

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
