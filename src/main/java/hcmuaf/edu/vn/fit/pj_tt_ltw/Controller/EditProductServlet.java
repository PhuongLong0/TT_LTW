package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

@WebServlet("/EditProductServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        // Lấy thông tin từ form

        String id = request.getParameter("productId");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String priceSellStr = request.getParameter("cost");
        String priceBuyStr = request.getParameter("priceBuy");
        String detail = request.getParameter("detail");


        System.out.println("ID: " + id);
        System.out.println("Name: " + name);
		System.out.println("Category: " + category);
        System.out.println("Price Sell: " + priceSellStr);
        System.out.println("Price Buy: " + priceBuyStr);
        System.out.println("Detail: " + detail);
        Collection<Part> imageParts = request.getParts();
        // Kiểm tra lỗi nhập liệu
        if (name == null || name.trim().isEmpty() || category == null || category.trim().isEmpty() || priceSellStr == null
                || priceSellStr.trim().isEmpty() || priceBuyStr == null || priceBuyStr.trim().isEmpty() || detail == null
                || detail.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("/AdminEdit.jsp").forward(request, response);
            return;
        }

        try {
            int productId = Integer.parseInt(id);
            int categoryId = Integer.parseInt(category);
            int priceSell = Integer.parseInt(priceSellStr);
            int priceBuy = Integer.parseInt(priceBuyStr);

            if (priceSell <= 0 || priceBuy <= 0) {
                request.setAttribute("errorMessage", "Giá và số lượng phải lớn hơn 0.");
                request.getRequestDispatcher("/AdminEdit.jsp").forward(request, response);
                return;
            }

            // Lưu danh sách hình ảnh
            ArrayList<String> imageNames = new ArrayList<>();
            String uploadPath = getServletContext().getRealPath("/images");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists() && !uploadDir.mkdirs()) {
                throw new IOException("Không thể tạo thư mục lưu trữ hình ảnh.");
            }

            for (Part imagePart : imageParts) {
                if (imagePart.getContentType() != null && imagePart.getContentType().startsWith("image/")) {
                    String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                    if (fileName.trim().isEmpty())
                        continue;

                    String storeName = changeName(fileName);
                    String filePath = uploadPath + File.separator + storeName;
                    imagePart.write(filePath);

                    imageNames.add(storeName);
                }
            }

            // Kết nối tới ProductDao để lưu sản phẩm
            ServletContext application = getServletContext();
            ProductDAO dao = (ProductDAO) application.getAttribute("products");
            if (dao == null) {
                throw new ServletException("Không tìm thấy ProductDao trong ServletContext.");
            }

            // Lưu sản phẩm vào database
            dao.update(new Products(productId, name, priceSell, priceBuy, detail, categoryId, imageNames));

            // Chuyển hướng sau khi chỉnh sửa sản phẩm thành công
            response.sendRedirect("adminListProduct.jsp");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Giá hoặc số lượng không hợp lệ.");
            request.getRequestDispatcher("/AdminEdit.jsp").forward(request, response);
        } catch (IOException e) {
            request.setAttribute("errorMessage", "Lỗi trong quá trình tải lên hình ảnh.");
            request.getRequestDispatcher("/AdminEdit.jsp").forward(request, response);
        }
    }

    private String changeName(String fileName) {
        return UUID.randomUUID().toString() + "_" + fileName;
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
