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
<<<<<<< HEAD
import java.sql.Date;
import java.sql.Timestamp;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public OrderServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//    /**
//     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        HttpSession session = request.getSession();
//        Users user=(Users) session.getAttribute("user");
//        OrderDAO donhangDao= DAOFactory.getInstance().getDonHangDao();
//        if(user==null) {
//            response.sendRedirect("login.jsp");
//        }else {
//            ServletContext application = getServletContext();
//            ShoppingCart cart= (ShoppingCart) application.getAttribute("cart");
//            donhangDao.insert(new Orders(cart.getShoppingCart()));
//            cart.getShoppingCart().clear();
//
//
//            if (cart != null && !cart.getCart().isEmpty()) {
//                OrderDAO donhangDao = DAOFactory.getInstance().getDonHangDao();
//                donhangDao.insert(new Orders(cart.getCart())); // Tùy cách bạn định nghĩa class Orders
//                cart.getCart().clear(); // Xóa toàn bộ giỏ hàng sau khi đặt hàng
//            }
//
//            application.setAttribute("cart",cart);
//            response.sendRedirect("checkout.jsp");
//        }
//    }
//
//    /**
//     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        doGet(request, response);
//    }
private static final long serialVersionUID = 1L;

    public OrderServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

       /* Users user = (Users) session.getAttribute("user");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (cart == null || cart.getCart().isEmpty()) {
            response.sendRedirect("checkout.jsp?error=CartEmpty");
            return;
        }

        OrderDAO orderDAO = DAOFactory.getInstance().getDonHangDao();

        // Tạo đơn hàng
        Orders order = new Orders();
        order.setOrderDate(new Date());
        order.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        order.setStatusOrder(Orders.statusOrder.CONFIRMATIONING); // Enum trạng thái
        order.setUserId(user.getUserId());
        order.setTotalAmount(cart.getPrice());
        order.setItems(cart.getCart());

        boolean success = orderDAO.insert(order); // Xử lý lưu vào DB

        if (success) {
            cart.getCart().clear(); // Xóa giỏ hàng sau khi đặt
            session.setAttribute("cart", cart);
            response.sendRedirect("orderSuccess.jsp");
        } else {
            response.sendRedirect("checkout.jsp?error=OrderFailed");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }*/
=======

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
>>>>>>> origin/Long-Admin
    }

}
