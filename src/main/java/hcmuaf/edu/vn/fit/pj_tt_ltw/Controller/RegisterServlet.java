package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.UserDao;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
        String destination = "/register.jsp";
        UserDao users = DAOFactory.getInstance().getUserDao();
//		Lay thong tin tu request
        boolean isvalid = true;
        int userId = Integer.parseInt(request.getParameter("userid"));
        String userName = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPass= request.getParameter("confirmPassword");
        String role = "user";

        if (firstname == null || firstname.isEmpty()) {
            request.setAttribute("nameError", "first name khong duoc de trong");
            isvalid = false;
        }
        if (lastname == null || lastname.equals("")) {
            request.setAttribute("lastnameError", "last name khong duoc de trong");
            isvalid = false;
        }
        if (email == null || email.equals("")) {
            request.setAttribute("emailError", "email khong duoc de trong");
            isvalid = false;
        }

        if (password == null || password.equals("")) {
            request.setAttribute("passError", "pass khong duoc de trong");
            isvalid = false;
        }
        if (confirmPass == null || confirmPass.equals("")) {
            request.setAttribute("passError", "pass khong duoc de trong");
            isvalid = false;
        }
        if (!confirmPass.equals(password)) {
            request.setAttribute("passError", "mat khau khong khop");
            isvalid = false;
        }
        int insert = 0;
        if (isvalid) {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String hashedPassword = passwordEncoder.encode(password);
            insert = users.insert(new Users(userId,userName,firstname, lastname,password, role, email));
        }
        if (insert >= 1) {
            destination = "login.jsp";
        }
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
