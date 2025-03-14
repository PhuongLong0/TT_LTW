package ServletPackage;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import database.DAOFactory;
import database.DonHangDao;
import database.UserDao;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String email= request.getParameter("email");
	String pass= request.getParameter("password");
	System.out.println(email);
	String des= "AdminLogin.jsp";
	UserDao dao= DAOFactory.getInstance().getUserDao();
	System.out.println(dao.checkAdmin(email, pass));
	if(dao.checkAdmin(email, pass)) {
		des="adminListProduct.jsp";
		ServletContext application = getServletContext();
		DonHangDao orders= DAOFactory.getInstance().getDonHangDao();
		application.setAttribute("orders", orders);
	}
	response.sendRedirect(des);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
