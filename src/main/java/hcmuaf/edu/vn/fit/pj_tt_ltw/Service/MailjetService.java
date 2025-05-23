package hcmuaf.edu.vn.fit.pj_tt_ltw.Service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeUtility;

import java.util.Properties;

public class MailjetService {
    //cseo nmcg ojoy uxou
    private static final String USERNAME = "caccac7258@gmail.com"; // your Gmail
    private static final String APP_PASSWORD = "cseo nmcg ojoy uxou"; // your app password

    public static boolean sendOtpToEmail(String email, String otp) {
        try {
            // SMTP config
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            // Create session with authentication
            Session session = Session.getInstance(props,
                    new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(USERNAME, APP_PASSWORD);
                        }
                    });

            // Create email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(MimeUtility.encodeText("Mã OTP xác thực tài khoản", "UTF-8", "B"));
            message.setContent(
                    "<h3>Mã OTP của bạn là: <strong>" + otp + "</strong></h3>"
                            + "<p>Vui lòng không chia sẻ mã này với bất kỳ ai.</p>",
                    "text/html; charset=utf-8"
            );

            // Send message
            Transport.send(message);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
