package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.OrderDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Orders;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        Users user=(Users) session.getAttribute("user");
        OrderDAO donhangDao= DAOFactory.getInstance().getDonHangDao();
        if(user==null) {
            response.sendRedirect("login.jsp");
        }else {
            ServletContext application = getServletContext();
            ShoppingCart cart= (ShoppingCart) application.getAttribute("cart");
            donhangDao.insert(new Orders(cart.getShoppingCart()));
            cart.getShoppingCart().clear();
            application.setAttribute("cart",cart);
            response.sendRedirect("checkout.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
