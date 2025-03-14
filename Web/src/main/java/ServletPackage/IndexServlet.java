package ServletPackage;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


import bean.Product;
import bean.ShoppingCart;
import database.DAOFactory;
import database.IProductDao;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String destination = "/index.jsp";
//		them database vao application
		IProductDao productdao = DAOFactory.getInstance().getProductdao();
		ServletContext application = getServletContext();
		ShoppingCart cart= new ShoppingCart();
		application.setAttribute("cart", cart);
		application.setAttribute("products", productdao);
		List<Product> listProducts= productdao.all().subList(0, 6);
		application.setAttribute("listproducts", listProducts);
		
//		dieu huong sang trang index
		response.sendRedirect(request.getContextPath() + destination);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
