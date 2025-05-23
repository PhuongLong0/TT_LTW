package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.IProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Categories;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewProductServlet", value = "newProduct")
public class NewProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();

        IProductDAO productdao = DAOFactory.getInstance().getProductdao();
        request.setAttribute("productdao", productdao);

        List<Categories> categories = ((ProductDAO) productdao).getCategories();
        request.setAttribute("categories", categories);

//        int totalProducts = 18;
//        int totalPagesNew = totalProducts / 6 + (totalProducts % 6 == 0 ? 0 : 1);
//        request.setAttribute("totalPagesNew", totalPagesNew);

        // Lấy danh sách sản phẩm mới
       // List<Products> newProducts = dao.getNewestProducts(totalProducts).subList(0, 6);

        int pageSize = 6;
        String pageStr = request.getParameter("pageNew");
        int currentPage = 1;
        if (pageStr != null && !pageStr.isEmpty()) {
            currentPage = Integer.parseInt(pageStr);
        }
        List<Products> allNewProducts = dao.getNewestProducts(18);
        int fromIndex = (currentPage - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, allNewProducts.size());
        List<Products> newProducts = allNewProducts.subList(fromIndex, toIndex);

        request.setAttribute("listNewProducts", newProducts);
        request.setAttribute("totalPagesNew", (int) Math.ceil(allNewProducts.size() / (double) pageSize));
        request.setAttribute("currentPage", currentPage);



        ShoppingCart cart= new ShoppingCart();
        request.setAttribute("cart", cart);

       // request.setAttribute("listNewProducts", newProducts);
        request.getRequestDispatcher("/new.jsp").forward(request, response);
    }
}