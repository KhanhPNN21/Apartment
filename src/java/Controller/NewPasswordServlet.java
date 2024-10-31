package Controller;

import Dal.DBContext;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class NewPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;

        // Kiểm tra tính hợp lệ của mật khẩu mới
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            DBContext dbContext = new DBContext();
            Connection con = null;

            try {
                con = dbContext.getConnection(); // Sử dụng DBContext để lấy Connection
                if (con != null) {
                    PreparedStatement pst = con.prepareStatement("UPDATE users SET Password = ? WHERE Email = ?");
                    pst.setString(1, newPassword);
                    pst.setString(2, (String) session.getAttribute("email"));

                    int rowCount = pst.executeUpdate();
                    if (rowCount > 0) {
                        request.setAttribute("status", "resetSuccess");
                        dispatcher = request.getRequestDispatcher("Login.jsp");
                    } else {
                        request.setAttribute("status", "resetFailed");
                        dispatcher = request.getRequestDispatcher("Login.jsp");
                    }
                    dispatcher.forward(request, response);
                } else {
                    // Xử lý khi không kết nối được đến database
                    request.setAttribute("status", "dbConnectionFailed");
                    dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (con != null) con.close(); // Đảm bảo đóng kết nối sau khi sử dụng
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        } else {
            // Xử lý nếu mật khẩu và xác nhận mật khẩu không khớp
            request.setAttribute("status", "passwordMismatch");
            dispatcher = request.getRequestDispatcher("resetPassword.jsp");
            dispatcher.forward(request, response);
        }
    }
}
