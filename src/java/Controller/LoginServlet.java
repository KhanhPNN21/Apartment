/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Home_DAO;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
public class LoginServlet extends HttpServlet {

    Home_DAO homeDao = new Home_DAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra session trước khi xử lý các yêu cầu
        HttpSession session = request.getSession(false); // Không tạo session mới nếu không có
        if (session == null || session.getAttribute("user") == null) {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect("Login.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) { // Kiểm tra xem có phải là đăng nhập không
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Xác thực người dùng
            Users user = homeDao.authenticate(username, password); // Giả định có phương thức này trong Book_JDBC

            if (user != null) { // Đăng nhập thành công
                // Tạo session cho người dùng
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("id", user.getUserId());
                session.setAttribute("amount", user.getAccountBalance());
                // Tạo cookie để lưu thông tin người dùng
                Cookie userCookie = new Cookie("username", username);
                userCookie.setMaxAge(60 * 60 * 24); // Cookie tồn tại trong 1 ngày
                response.addCookie(userCookie);
                // Ghi log trước khi chuyển hướng
                System.out.println("Đăng nhập thành công cho người dùng: " + username);

                // Chuyển hướng đến danh sách sách
                response.sendRedirect("HomeServlet");
            } else {
                // Nếu sai tên đăng nhập hoặc mật khẩu
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } else if ("logout".equals(action)) {
            // Xử lý đăng xuất
            logout(request, response); // Gọi phương thức logout để xử lý
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Hủy session
        }

        // Xóa cookie tên người dùng
        Cookie userCookie = new Cookie("username", null);
        userCookie.setMaxAge(0); // Thiết lập thời gian sống của cookie về 0 để xóa
        response.addCookie(userCookie);

        // Chuyển hướng về trang đăng nhập
        response.sendRedirect("HomeServlet");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
