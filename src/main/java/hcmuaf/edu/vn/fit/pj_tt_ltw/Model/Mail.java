package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Mail {
    public static void sendMail(String recipientEmail) throws MessagingException {
        final String senderEmail = "long59658@gmail.com";
        final String senderPassword = "rnwn qfgd vjuy ntqh";

        //Cấu hình cho mail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        //Tạo phiên
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Xác nhận đăng ký tài khoản");
        message.setText("Chào bạn,\n\nBạn đã đăng ký tài khoản thành công!\n\nCảm ơn bạn đã tham gia.");

        // Gửi email
        Transport.send(message);
    }
}
