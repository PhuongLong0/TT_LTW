package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "FilterNewProductServlet", value = "/filterNew")
public class FilterNewProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String categoryFilter = request.getParameter("category");
        if (categoryFilter == null) {
            categoryFilter = (String) session.getAttribute("category");
        } else {
            session.setAttribute("category", categoryFilter);
        }

        String pageStr = request.getParameter("pageNew");

        ProductDAO productdao = new ProductDAO();

        List<Products> filteredList;
        if (categoryFilter != null && !categoryFilter.isEmpty()) {
            filteredList = productdao.filterNewest(categoryFilter);
        } else {
            filteredList = productdao.getNewestProducts(18); // 18 sản phẩm
        }

        int pageSize = 6;
        int currentPage = 1;
        if (pageStr != null && !pageStr.isEmpty()) {
            currentPage = Integer.parseInt(pageStr);
        }
        int fromIndex = (currentPage - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, filteredList.size());

        List<Products> pagedList = filteredList.subList(fromIndex, toIndex);

        request.setAttribute("filterProducts", pagedList);
       // request.setAttribute("listNewProducts", pagedList);
        request.setAttribute("totalPagesNew", (int) Math.ceil(filteredList.size() / (double) pageSize));
        request.setAttribute("currentPage", currentPage);


        request.getRequestDispatcher("/filteredProducts.jsp")
                .forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
