package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ForgetPassword", value = "/forgetPassword")
public class ForgetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getParameter("action");
    HttpSession session = req.getSession();
    UserDao users = DAOFactory.getInstance().getUserDao();
    switch (action) {
        case "verifyEmailCaptcha":
            String email = req.getParameter("email");
            String captcha = req.getParameter("captcha");
            String realCaptcha = (String) session.getAttribute("captcha");

            if(!users.existsEmail(email)){
                req.setAttribute("error", "Email not exist!");
                req.setAttribute("step", 1);
                break;
            }
            if (captcha != null && captcha.equalsIgnoreCase(realCaptcha)) {
                String otp = generateOtp(); // tạo OTP
                session.setAttribute("otp", otp);
                session.setAttribute("emailToReset", email);
                boolean sent= users.sendOtpToEmail(email, otp);
                System.out.println("Gửi email OTP thành công? " + sent);
                if (sent) {
                    System.out.println("OTP đã được gửi tới email: " + email);
                } else {
                    System.out.println("Lỗi khi gửi OTP!");
                    req.setAttribute("error", "Không thể gửi email xác nhận. Vui lòng thử lại sau.");
                    req.setAttribute("step", 1); // Quay về bước đầu nếu gửi thất bại
                    break;
                }
                req.setAttribute("step", 2);
                System.out.println("Đang gửi mã OTP...");
            } else {
                req.setAttribute("error", "Captcha không đúng");
                System.out.println("Captchar không đúng!");
                req.setAttribute("step", 1);
            }
            break;
        case "verifyOtp":
            System.out.print("Nhập OTP đã nhận");
            String inputOtp = req.getParameter("otp");
            String realOtp = (String) session.getAttribute("otp");
            if (inputOtp != null && inputOtp.equals(realOtp)) {
                req.setAttribute("step", 3);
            } else {
                req.setAttribute("error", "OTP không đúng");
                System.out.println("OTP không đúng!");
                req.setAttribute("step", 2);
            }
            break;
        case "resetPassword":
            String pass1 = req.getParameter("password1");
            String pass2 = req.getParameter("password2");
            if (pass1.equals(pass2)) {
                String emailToReset = (String) session.getAttribute("emailToReset");
                users.updatePassword(emailToReset, pass1); // cập nhật DB
                req.setAttribute("message", "Đổi mật khẩu thành công!");
               // req.setAttribute("step", 1); // quay về bước đầu
                System.out.println("Đổi mật khẩu thành công!");
            } else {
                req.setAttribute("error", "Mật khẩu không khớp");
                req.setAttribute("step", 3);
            }
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
    }
    req.getRequestDispatcher("ForgetPassword.jsp").forward(req, resp);
}

    // Sinh OTP ngẫu nhiên 6 chữ số
    private String generateOtp() {
        Random rand = new Random();
        int otp = 100000 + rand.nextInt(900000); // từ 100000 đến 999999
        return String.valueOf(otp);
    }


}
