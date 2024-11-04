package Controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class ValidateOtp extends HttpServlet {

    private static final int OTP_EXPIRY_TIME = 60000; // 60 giây

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String otpString = request.getParameter("otp"); // Lấy giá trị OTP từ request
        RequestDispatcher dispatcher;
        
        // Kiểm tra xem yêu cầu này có phải là yêu cầu gửi lại OTP không
        if ("true".equals(request.getParameter("resend"))) {
            sendNewOtp(session); // Gửi một OTP mới
            request.setAttribute("message", "Mã OTP mới đã được gửi.");
            dispatcher = request.getRequestDispatcher("enterOTP.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        // Kiểm tra nếu giá trị OTP trống
        if (otpString == null || otpString.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập OTP.");
            dispatcher = request.getRequestDispatcher("enterOTP.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            int userOtp = Integer.parseInt(otpString); // Chuyển OTP sang số nguyên
            Integer generatedOtp = (Integer) session.getAttribute("otp");
            Long otpGeneratedTime = (Long) session.getAttribute("otpGeneratedTime");

            if (generatedOtp != null && otpGeneratedTime != null) {
                long currentTime = System.currentTimeMillis();

                if (currentTime - otpGeneratedTime <= OTP_EXPIRY_TIME) {
                    if (userOtp == generatedOtp) {
                        request.setAttribute("message", "OTP xác thực thành công!");
                        dispatcher = request.getRequestDispatcher("newPassword.jsp");
                    } else {
                        request.setAttribute("message", "OTP không chính xác. Vui lòng thử lại.");
                        dispatcher = request.getRequestDispatcher("enterOTP.jsp");
                    }
                } else {
                    // OTP đã hết hạn, gửi OTP mới
                    request.setAttribute("message", "Mã OTP đã hết hạn. Mã mới đã được gửi.");
                    sendNewOtp(session);
                    dispatcher = request.getRequestDispatcher("enterOTP.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Phiên làm việc đã hết hạn. Vui lòng yêu cầu OTP mới.");
                dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
            }
        } catch (NumberFormatException e) {
            // Xử lý lỗi khi OTP không phải là số
            request.setAttribute("errorMessage", "OTP không hợp lệ. Vui lòng nhập lại.");
            dispatcher = request.getRequestDispatcher("enterOTP.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void sendNewOtp(HttpSession session) {
        int newOtp = new Random().nextInt(1255650); // Tạo mã OTP ngẫu nhiên mới
        long newOtpGeneratedTime = System.currentTimeMillis();
        String email = (String) session.getAttribute("email");

        // Lưu OTP mới và thời gian tạo vào session
        session.setAttribute("otp", newOtp);
        session.setAttribute("otpGeneratedTime", newOtpGeneratedTime);

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session mailSession = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("kiensinh20212022@gmail.com", "post cxmk rxxs sddg");
            }
        });

        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress("kiensinh20212022@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("New OTP for Password Reset");
            message.setText("Your new OTP is: " + newOtp);
            Transport.send(message);
            System.out.println("New OTP sent successfully");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
