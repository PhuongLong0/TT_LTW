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
import database.ProductDao;

/**
 * Servlet implementation class FilterServlet
 */
@WebServlet("/FilterServlet")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FilterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryFilter = request.getParameter("category");
		String page = request.getParameter("page");
		String admin= request.getParameter("admin");
		String destination = "filteredProducts.jsp";
		ServletContext application = getServletContext();
		ProductDao dao = (ProductDao) application.getAttribute("products");
		List<Product> filterProduct = dao.filter(categoryFilter);
		if(page!= null) {
			int pagenum= Integer.parseInt(page)-1;
			filterProduct= dao.all().subList(pagenum*6, Math.min(pagenum*6+6, dao.all().size()));
		}
		if(admin!=null) {
			destination = "adminListProduct.jsp";
		}
		request.setAttribute("filter", filterProduct);
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
