package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.UserDao;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination = "/login.jsp";
        String errorMessage="";
//		tạo userdao
        UserDao users = DAOFactory.getInstance().getUserDao();
//		Lay thong tin tu request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String role = request.getParameter("role");
        if (email == null || email.equals("") || password == null || password.equals("")) {
            errorMessage = "vui lòng điền đầy đủ thông tin";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        Users user = users.checkPass(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        } else {
            errorMessage = "Email hoặc mật khẩu không chính xác";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
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
