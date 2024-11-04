package Controller;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ForgotServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession session = request.getSession();

        // Kiểm tra xem email có hợp lệ không
        if (email != null && !email.isEmpty()) {
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650); // Tạo mã OTP ngẫu nhiên

            String to = email;
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
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("OTP for Password Reset");
                message.setText("Your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("OTP sent successfully");
            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to send OTP. Please try again.");
                dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
                dispatcher.forward(request, response);
                return;
            }

            session.setAttribute("otp", otpvalue);
            session.setAttribute("otpGeneratedTime", System.currentTimeMillis());
            session.setAttribute("email", email);
            request.setAttribute("message", "OTP đã được gửi đến địa chỉ email của bạn");
            dispatcher = request.getRequestDispatcher("enterOTP.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid email address. Please try again.");
            dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
            dispatcher.forward(request, response);
        }
    }
}
