package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteFromCart")
public class DeleteFromCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("productid");
        int pid= Integer.parseInt(id);
        ServletContext application = getServletContext();
        String des = "checkout.jsp";
        ProductDAO dao = (ProductDAO) application.getAttribute("products");
        ShoppingCart shoppingcart = (ShoppingCart) application.getAttribute("cart");
        List<Products> cart = shoppingcart.getShoppingCart();
        Products temp=null;
        for (Products p : cart) {
            if (p.getProductId()==pid)
                temp=p;
        }
        shoppingcart.delete(temp);
        System.out.println();
        response.sendRedirect(des);
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
