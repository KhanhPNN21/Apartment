/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Home_DAO;
import Model.Rooms;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author acer
 */
public class HomeServlet extends HttpServlet {
 private Home_DAO home_DAO;

    public void init() {
        home_DAO = new Home_DAO();

    }
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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
          HttpSession session = request.getSession();
    int page = 1; // Trang mặc định
    int recordsPerPage = 5;

    // Lấy tham số trang hiện tại (nếu có)
    if (request.getParameter("page") != null) {
        page = Integer.parseInt(request.getParameter("page"));
    }

    try {
        Home_DAO home_DAO = new Home_DAO();
        List<Rooms> roomList = home_DAO.listAll();

        // Tính toán vị trí bắt đầu và kết thúc của danh sách trên trang hiện tại
        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, roomList.size());

        // Lấy danh sách phòng cho trang hiện tại
        List<Rooms> paginatedRooms = roomList.subList(start, end);
        request.setAttribute("roomList", paginatedRooms);

        // Xác định số trang tối đa
        int totalPages = (int) Math.ceil(roomList.size() * 1.0 / recordsPerPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        // Điều hướng tới trang hiển thị
        if (session.getAttribute("user") == null) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }    }

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
        processRequest(request, response);
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
