package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.IProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination = "/men.jsp";
        // Lấy input từ search bar
        String txtSearch = request.getParameter("query");

        // Trả về index nếu search null
        if (txtSearch == null || txtSearch.trim().isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }
        // lấy sản phẩm từ DB
        IProductDAO productDao = DAOFactory.getInstance().getProductdao();
        int index = Integer.parseInt(request.getParameter("index"));
        int count = productDao.count(txtSearch);
        int size = 6;
        int endPage = count / size;
        if (count % size != 0) {
            endPage++;
        }

        List<Products> searchResults = productDao.searchResult(txtSearch);

        request.setAttribute("endPage", endPage);
        request.setAttribute("searchResults", searchResults);
        request.setAttribute("searchQuery", txtSearch);

        // Forward jsp
        request.getRequestDispatcher(destination).forward(request, response);
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