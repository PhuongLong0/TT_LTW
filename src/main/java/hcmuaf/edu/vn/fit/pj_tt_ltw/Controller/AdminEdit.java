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

/**
 * Servlet implementation class AdminEdit
 */
@WebServlet("/AdminEdit")
public class AdminEdit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        String action = request.getParameter("action");
        String destination = "adminListProduct.jsp";
        String id = request.getParameter("productid");
        ServletContext application = getServletContext();
        ProductDAO productdao = (ProductDAO) application.getAttribute("products");
        Products products = productdao.findById(id);
        request.setAttribute("product", products);
        switch (action) {
            case "detail":
                destination = "adminProductDetail.jsp";
                break;
            case "edit":
                destination = "adminEdit.jsp";
                break;
            default:
                break;
        }
        request.getRequestDispatcher(destination).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

