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
<<<<<<< HEAD
import java.util.Map;
=======
>>>>>>> origin/Long-Admin


import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCart
 */
<<<<<<< HEAD
@WebServlet(name = "AddToCart", value = "/AddToCart")
=======
@WebServlet("/AddToCart")
>>>>>>> origin/Long-Admin
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
<<<<<<< HEAD

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



        Map<Products, Integer> cartMap = cart.getProductQuantityMap();
        System.out.println("cartMap: " + cartMap);
        request.setAttribute("cartMap", cartMap);
        request.setAttribute("cartSize", cart.getSize());
        request.setAttribute("cartTotal", cart.getTotalPrice());

        //response.sendRedirect("men.jsp");
        request.getRequestDispatcher("men.jsp").forward(request, response);

    }
=======
        // TODO Auto-generated method stub

        String id = request.getParameter("productId");
        HttpSession session = request.getSession();

        ServletContext application= getServletContext();
        ProductDAO dao= (ProductDAO) application.getAttribute("products");

        // Lấy giỏ hàng từ session, nếu chưa có thì tạo mới
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            session.setAttribute("cart", shoppingCart);
        }

        // Thêm sản phẩm vào giỏ hàng
        if (dao != null) {
            Products products = dao.findById(id);
            if (products != null) {
                shoppingCart.add(products);
            }
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }

>>>>>>> origin/Long-Admin
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
