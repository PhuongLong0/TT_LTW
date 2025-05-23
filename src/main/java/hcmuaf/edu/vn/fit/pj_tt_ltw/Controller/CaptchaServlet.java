package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import static java.lang.System.out;

@WebServlet(name ="captchaServlet", value = "/captchaServlet")
public class CaptchaServlet extends HttpServlet {
    private static final int WIDTH = 150;
    private static final int HEIGHT = 50;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Sinh chuỗi captcha
        String captchaText = generateCaptchaText(6);

        // Lưu captcha vào session để kiểm tra sau
        HttpSession session = request.getSession();
        session.setAttribute("captcha", captchaText);

        // Tạo ảnh captcha
        BufferedImage captchaImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = captchaImage.createGraphics();

        // Vẽ background
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, WIDTH, HEIGHT);

        // Vẽ chữ
        g.setFont(new Font("Arial", Font.BOLD, 30));
        g.setColor(Color.BLUE);
        g.drawString(captchaText, 20, 35);

        // Nhiễu nhẹ
        Random rand = new Random();
        g.setColor(Color.GRAY);
        for (int i = 0; i < 20; i++) {
            int x = rand.nextInt(WIDTH);
            int y = rand.nextInt(HEIGHT);
            int size = rand.nextInt(5);
            g.fillOval(x, y, size, size);
        }

        g.dispose();

        // Thiết lập kiểu dữ liệu ảnh
        response.setContentType("image/png");
        ImageIO.write(captchaImage, "png", response.getOutputStream());
        out.flush();
        out.close();
    }

    private String generateCaptchaText(int length) {
        String chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789"; // tránh chữ dễ nhầm
        Random rand = new Random();
        StringBuilder captchaStr = new StringBuilder();
        for (int i = 0; i < length; i++) {
            captchaStr.append(chars.charAt(rand.nextInt(chars.length())));
        }
        return captchaStr.toString();
    }


}
