package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterServlet", value = "/filter")
public class FilterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterServlet() {
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
        String destination = "/filteredProducts.jsp";

        String categoryFilter = request.getParameter("categoryName");
        String page = request.getParameter("page");
        String admin= request.getParameter("admin");

        ProductDAO productdao = (ProductDAO) request.getAttribute("productdao");
        List<Products> filterProducts = productdao.filter(categoryFilter);
        if(page!= null) {
            int pagenum= Integer.parseInt(page)-1;
            filterProducts = productdao.all().subList(pagenum*6, Math.min(pagenum*6+6, productdao.all().size()));
        }
        if(admin!=null) {
            destination = "/adminListProduct.jsp";
        }
        request.setAttribute("filterProducts", filterProducts);
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
