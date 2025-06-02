package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

<<<<<<< HEAD
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.OrderDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Orders;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;
=======
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
>>>>>>> origin/Long-Admin
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DeleteFromCart", value = "/DeleteFromCart")
=======

import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteFromCart")
>>>>>>> origin/Long-Admin
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
<<<<<<< HEAD
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("productId");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        // Xóa sản phẩm khỏi giỏ hàng nếu ID hợp lệ
        if (id != null) {
            try {
                int productId = Integer.parseInt(id);
                cart.delete(productId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        Map<Products, Integer> cartMap = cart.getProductQuantityMap();
        request.setAttribute("cartMap", cartMap);
        request.setAttribute("cartSize", cart.getSize());
        request.setAttribute("cartTotal", cart.getTotalPrice());

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

//        String des = "checkout.jsp";
//        ProductDAO dao = (ProductDAO) application.getAttribute("products");
//        ShoppingCart shoppingcart = (ShoppingCart) application.getAttribute("cart");
//        List<Products> cart = shoppingcart.getShoppingCart();
//        Products temp=null;
//        for (Products p : cart) {
//            if (p.getProductId()==pid)
//                temp=p;
//        }
//        shoppingcart.delete(temp);
//        System.out.println();
//        response.sendRedirect(des);



        /**
         */

        protected void doPost (HttpServletRequest request, HttpServletResponse response)throws
        ServletException, IOException {
            // TODO Auto-generated method stub
            doGet(request, response);


    }
=======
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

>>>>>>> origin/Long-Admin
}
