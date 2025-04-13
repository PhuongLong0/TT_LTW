package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.UserDao;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Mail;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.mail.MessagingException;
import java.io.IOException;

@WebServlet(name = "register",value = "/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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

    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination = "/register.jsp";
        UserDao users = DAOFactory.getInstance().getUserDao();
//		Lay thong tin tu request
        boolean isvalid = true;
        //int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("passwordUser");
        String confirmPass = request.getParameter("confirmPassword");
        int role = 1;

        if (firstname == null || firstname.isEmpty()) {
            request.setAttribute("nameError", "First name must not be empty.");
            isvalid = false;
        }
        if (lastname == null || lastname.equals("")) {
            request.setAttribute("lastnameError", "Last name must not be empty.");
            isvalid = false;
        }
        if (email == null || email.equals("")) {
            request.setAttribute("emailError", "Email must not be empty.");
            isvalid = false;
        }
        if (users.existsEmail(email)) {
            request.setAttribute("emailError", "Email already exists.");
            isvalid = false;
        }
        if (password == null || password.equals("")) {
            request.setAttribute("passError", "Password must not be empty.");
            isvalid = false;
        }
        if (confirmPass == null || confirmPass.equals("")) {
            request.setAttribute("confirmPassError", "Confirm password must not be empty.");
            isvalid = false;
        } else if (!confirmPass.equals(password)) {
            request.setAttribute("passError", "Passwords do not match.");
            isvalid = false;
        }


        int insert = 0;
        if (isvalid) {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String hashedPassword = passwordEncoder.encode(password);
            insert = users.insert(new Users(0, username, firstname, lastname, hashedPassword, role, email));

            if (insert >= 1) {
                response.sendRedirect("login.jsp"); //dùng redirect khi thành công
                System.out.println("Tạo tài khoản thành công! - Username: " +username);
                try {
                    Mail.sendMail(email);
                } catch (MessagingException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("emailError", "Registration failed. Please try again.");
            }

        }
        // Nếu có lỗi hoặc insert thất bại, quay về trang đăng ký với thông báo lỗi
        request.getRequestDispatcher(destination).forward(request, response);
    }
}
