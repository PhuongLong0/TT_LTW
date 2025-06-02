package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/UpdateCartServlet")
    public class UpdateCartServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String action = request.getParameter("action");

            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }

            int currentQty = cart.getCart().getOrDefault(productId, 0);
            if ("increase".equals(action)) {
                cart.getCart().put(productId, currentQty + 1);
            } else if ("decrease".equals(action)) {
                if (currentQty > 1) {
                    cart.getCart().put(productId, currentQty - 1);
                }
            }

            // Gửi lại JSON về client
            int newQuantity = cart.getCart().get(productId);
            double cartTotal = cart.getPrice();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"newQuantity\": " + newQuantity + ", \"cartTotal\": \"" + cartTotal + " đ\"}");

    }

}
