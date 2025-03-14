package ServletPackage;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

import bean.Product;
import database.ProductDao;

/**
 * Servlet implementation class AdminEdit
 */
@WebServlet("/AdminEdit")
public class AdminEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEdit() {
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
		String action = request.getParameter("action");
		String destination = "adminListProduct.jsp";
		String id = request.getParameter("productid");
		ServletContext application = getServletContext();
		ProductDao productdao = (ProductDao) application.getAttribute("products");
		Product product = productdao.findById(id);
		request.setAttribute("product", product);
		switch (action) {
		case "detail":
			destination = "AdminProductDetail.jsp";
			break;
		case "edit":
			destination = "AdminEdit.jsp";
			break;
		default:
			break;
		}
		request.getRequestDispatcher(destination).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
