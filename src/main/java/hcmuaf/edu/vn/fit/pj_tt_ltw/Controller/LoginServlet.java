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

@WebServlet(name = "LoginServlet", value = "/Login")
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
        String password = request.getParameter("passwordUser");

        //int role = request.getParameter("role");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            errorMessage = "Please fill in all required fields.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher(destination).forward(request, response);
            return;
        }

        Users user = users.checkPass(email, password);
        request.getSession().setAttribute("user", user);
        System.out.println("Check đúng thông tin login");
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            //response.sendRedirect("index.jsp");

            int role= user.getRole();
            session.setAttribute("role", role);
            if (role == 1) {
                // Điều hướng đến giao diện người dùng
                System.out.println("Vào trang chủ");
                destination = "/index.jsp";

            } else if (role == 2) {
                // Điều hướng đến giao diện admin
                System.out.println("Vào trang admin");
                destination = "/adminOrder.jsp";

            }
            request.getRequestDispatcher(destination).forward(request, response);
        } else {
            errorMessage = "Incorrect email or password.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher(destination).forward(request, response);
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
