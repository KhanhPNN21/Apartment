/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.DBContext;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;

/**
 *
 * @author PC
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String message = "";

        try {
            DBContext dbContext = new DBContext();
            Connection con = null;
            con = dbContext.getConnection();
            
            if ("signup".equals(action)) {
                String username = request.getParameter("user");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String phone = request.getParameter("sdt");
                String pass = request.getParameter("pass");

                PreparedStatement stmt = con.prepareStatement("INSERT INTO Users (User_name, Full_name, Phone, Email, Password) VALUES (?, ?, ?, ?, ?)");
                stmt.setString(1, username);
                stmt.setString(2, fullName);
                stmt.setString(3, phone);
                stmt.setString(4, email);
                stmt.setString(5, pass);
                stmt.executeUpdate();
                message = "Đăng kí thành công!";
                
            } else if ("deleteStudent".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));

                // Bước 1: Xóa user với ID đã cho
                PreparedStatement stmt = con.prepareStatement("DELETE FROM Users WHERE Id=?");
                stmt.setInt(1, id);
                int rowsDeleted = stmt.executeUpdate();

                if (rowsDeleted > 0) {
                    message = "Xóa sinh viên thành công!";
                    // Không cần cập nhật ID để liên tục
                } else {
                    message = "Không tìm thấy người dùng với ID: " + id;
                }
            }
        } catch (Exception e) {
            message = "Lỗi: " + e.getMessage();
        }

        request.setAttribute("mess", message);
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
