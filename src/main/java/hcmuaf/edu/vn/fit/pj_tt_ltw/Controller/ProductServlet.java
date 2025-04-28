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

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination = "/single.jsp";
        String id = request.getParameter("productId");
        System.out.println(id);

        ServletContext application = getServletContext();
        ProductDAO productdao = (ProductDAO) application.getAttribute("productdao");

        if (productdao == null) {
            // Nếu chưa có thì tự tạo mới
            productdao = new ProductDAO();
            application.setAttribute("productdao", productdao);
        }

        Products products = productdao.findById(id);
        request.setAttribute("product", products);
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
