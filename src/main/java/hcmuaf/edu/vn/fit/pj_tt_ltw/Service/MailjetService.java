package hcmuaf.edu.vn.fit.pj_tt_ltw.Service;

import okhttp3.*;
import java.io.IOException;
import org.json.JSONObject;
public class MailjetService {

    private static final String API_KEY = "cb254a69206973a2fafb0e307c52133c";
    private static final String API_SECRET = "f7333b8823ee6146bac2c2257cb20235";
    private static final String FROM_EMAIL = "caccac7258@mail.com"; //mail gui
    private static final String FROM_NAME = "Các CACA";

    public static boolean sendOtpMail(String toEmail, String otp) {
        OkHttpClient client = new OkHttpClient();

        JSONObject message = new JSONObject();
        message.put("From", new JSONObject()
                .put("Email", FROM_EMAIL)
                .put("Name", FROM_NAME));
        message.put("To", new org.json.JSONArray().put(new JSONObject()
                .put("Email", toEmail)
                .put("Name", "username")));
        message.put("Subject", "MÃ XÁC THỰC OTP CHO QUÊN MẬT KHẨU");
        message.put("TextPart", "Mã OTP của bạn là: " + otp + ". Vui lòng không chia sẻ cho người khác.");

        JSONObject body = new JSONObject().put("Messages", new org.json.JSONArray().put(message));

        Request request = new Request.Builder()
                .url("https://api.mailjet.com/v3.1/send")
                .post(RequestBody.create(body.toString(), MediaType.get("application/json")))
                .addHeader("Authorization", Credentials.basic(API_KEY, API_SECRET))
                .addHeader("Content-Type", "application/json")
                .build();

        try (Response response = client.newCall(request).execute()) {
            String responseBody = response.body().string();
            System.out.println("Mailjet Response: " + responseBody);

            return response.isSuccessful();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }
}
