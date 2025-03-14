package ServletPackage;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import bean.DonHang;
import bean.ShoppingCart;
import bean.User;
import database.DAOFactory;
import database.DonHangDao;

/**
 * Servlet implementation class OrderServlet
 */
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
		User user=(User) session.getAttribute("user");
		DonHangDao donhangDao= DAOFactory.getInstance().getDonHangDao();
		if(user==null) {
			response.sendRedirect("login.jsp");
		}else {
			ServletContext application = getServletContext();
			ShoppingCart cart= (ShoppingCart) application.getAttribute("cart");
			donhangDao.insert(new DonHang(cart.getShoppingCart()));
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
