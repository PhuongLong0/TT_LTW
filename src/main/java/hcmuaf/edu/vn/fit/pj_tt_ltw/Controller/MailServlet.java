package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import javax.mail.Session;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import java.util.Properties;

@WebServlet("/MailServlet")
public class MailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy email từ form
        String input = request.getParameter("input");

        // Cấu hình email
        String smtpHost = "smtp.gmail.com";
        String smtpPort = "587";
        String username = "lduy12401@gmail.com";
        String password = "lambaoduy";

        // Thiết lập các thuộc tính của email
        Properties properties = new Properties();
        properties.put("mail.smtp.host", smtpHost);
        properties.put("mail.smtp.port", smtpPort);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Tạo session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("lduy12401@gmail.com", "HCMUAF Notification"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("lambaoduy2004@gmail.com"));
            message.setSubject("Thông Báo Mua Hàng");
            message.setText(input); // Nội dung email

            // Gửi email
            Transport.send(message);
            response.getWriter().write("Email đã được gửi thành công!");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().write("Gửi email thất bại: " + e.getMessage());
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
