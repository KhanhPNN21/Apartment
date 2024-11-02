/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import jakarta.mail.Transport;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;

/**
 *
 * @author PC
 */
public class ForgotServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        // Kiểm tra xem email có hợp lệ hay không
        if (email != null && !email.isEmpty()) {
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email;
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session session = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("kiensinh20212022@gmail.com", "post cxmk rxxs sddg");
                }
            });

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("kiensinh20212022@gmail.com")); // Thay đổi thành email của bạn
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("OTP for Password Reset");
                message.setText("Hello");
                message.setText("Your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                e.printStackTrace(); // In ra lỗi nếu có
                // Đưa ra thông báo lỗi nếu gửi không thành công
                request.setAttribute("errorMessage", "Failed to send OTP. Please try again.");
                dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
                dispatcher.forward(request, response);
                return; // Ngăn không cho chuyển tiếp đến trang tiếp theo
            }

            // Lưu OTP vào phiên để sử dụng sau này
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            request.setAttribute("message", "OTP được gửi đến địa chỉ email của bạn");
            dispatcher = request.getRequestDispatcher("enterOTP.jsp");
            dispatcher.forward(request, response);
        } else {
            // Trường hợp email không hợp lệ
            request.setAttribute("errorMessage", "Invalid email address. Please try again.");
            dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
            dispatcher.forward(request, response);
        }
    }
}
