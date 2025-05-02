package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.OrderDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.UserDao;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


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
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        System.out.println(email);
        String des = "AdminLogin.jsp";
        UserDao dao = DAOFactory.getInstance().getUserDao();
        System.out.println(dao.checkAdmin(email, pass));
        if (dao.checkAdmin(email, pass)) {
            des = "adminListProduct.jsp";
            ServletContext application = getServletContext();
            OrderDAO orders = DAOFactory.getInstance().getDonHangDao();
            application.setAttribute("orders", orders);

            // session để lưu trạng thái admin đăng nhập
            request.getSession().setAttribute("adminEmail", email);
            System.out.println("checkAdmin thành công!");
        } else {
            System.out.println("Tài khoản không hợp lệ hoặc không phải admin.");
            request.setAttribute("error", "Email hoặc mật khẩu không đúng!");
            request.getRequestDispatcher(des).forward(request, response);
            return;
        }

        response.sendRedirect(des);
    }
}