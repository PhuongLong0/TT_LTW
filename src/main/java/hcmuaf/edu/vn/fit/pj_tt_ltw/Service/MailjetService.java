package hcmuaf.edu.vn.fit.pj_tt_ltw.Service;

import okhttp3.*;
import java.io.IOException;
import org.json.JSONObject;
public class MailjetService {

    private static final String API_KEY = "YOUR_MAILJET_API_KEY";
    private static final String API_SECRET = "YOUR_MAILJET_API_SECRET";
    private static final String FROM_EMAIL = "your_verified_email@mail.com"; // phải verify
    private static final String FROM_NAME = "Hệ thống OTP";

    public static boolean sendOtpMail(String toEmail, String otp) {
        OkHttpClient client = new OkHttpClient();

        JSONObject message = new JSONObject();
        message.put("From", new JSONObject()
                .put("Email", FROM_EMAIL)
                .put("Name", FROM_NAME));
        message.put("To", new org.json.JSONArray().put(new JSONObject()
                .put("Email", toEmail)));
        message.put("Subject", "Mã xác nhận OTP");
        message.put("TextPart", "Mã OTP của bạn là: " + otp + ". Không chia sẻ cho người khác.");

        JSONObject body = new JSONObject().put("Messages", new org.json.JSONArray().put(message));

        Request request = new Request.Builder()
                .url("https://api.mailjet.com/v3.1/send")
                .post(RequestBody.create(body.toString(), MediaType.get("application/json")))
                .addHeader("Authorization", Credentials.basic(API_KEY, API_SECRET))
                .addHeader("Content-Type", "application/json")
                .build();

        try (Response response = client.newCall(request).execute()) {
            return response.isSuccessful();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
