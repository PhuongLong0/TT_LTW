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
import java.util.Map;


import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet(name = "AddToCart", value = "/AddToCart")
public class AddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("productId");
       HttpSession session = request.getSession();

        ProductDAO dao = new ProductDAO();
  //     ServletContext application= getServletContext();
  //    dao= (ProductDAO) application.getAttribute("products");
        System.out.println("productId param: " + id);
       System.out.println("Product from DAO: " + dao.findById(id));
//
//        // Lấy giỏ hàng từ session, nếu chưa có thì tạo mới
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }
       // Thêm sản phẩm vào giỏ hàng
        if (id != null) {
            try {
                int productId = Integer.parseInt(id);
                cart.add(productId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }


//        response.sendRedirect("men.jsp");
//   }
//        if (id != null) {
//            int productId = Integer.parseInt(id);
//            HttpSession session = request.getSession();
//
//            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
//            if (cart == null) {
//                cart = new ShoppingCart();
//                session.setAttribute("cart", cart);
//            }
//
//            cart.add(productId);
//        }

//        HttpSession session = request.getSession();
//        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
//
//        if (cart == null) {
//            cart = new ShoppingCart();
//            session.setAttribute("cart", cart);
//        }

        Map<Products, Integer> cartMap = cart.getProductQuantityMap();
        System.out.println("cartMap: " + cartMap);
        request.setAttribute("cartMap", cartMap);
        request.setAttribute("cartSize", cart.getSize());
        request.setAttribute("cartTotal", cart.getTotalPrice());

        response.sendRedirect("men.jsp");
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
