/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Payment;
import Model.Users;
import Model.paymentDAO;
import Model.paymentHistory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author PC
 */
@WebServlet(name = "RechargeServlet", urlPatterns = {"/RechargeServlet"})
public class RechargeServlet extends HttpServlet {

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
            out.println("<title>Servlet RechargeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RechargeServlet at " + request.getContextPath() + "</h1>");
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
         String command = request.getParameter("command");
        
       switch(command)
       {
           case "getRecharge" : 
               getRecharge(request, response);
             break;
           case "getPayment" :
               getHistoryPayment(request, response);
               break;  
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
        Recharge(request, response);
    }

    public void Recharge(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId_raw = request.getParameter("userID");
        String amount_raw = request.getParameter("amountRecharge");
        String method = request.getParameter("paymentMethod");
        paymentDAO pDAO = new paymentDAO();
        int userId, amount;
        try {
            userId = Integer.parseInt(userId_raw);
            amount = Integer.parseInt(amount_raw);
            pDAO.depositAmount(userId, amount, method);
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            
           if (user != null) {
           int currentBalance = user.getAccountBalance();
           user.setAccountBalance(currentBalance + amount);
           session.setAttribute("user", user);
            }
            
            response.sendRedirect("recharge.jsp?userId=" + userId);
        } catch (Exception e) {
        }

    }

    public void getRecharge(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId_raw = request.getParameter("userId");
        paymentDAO pDAO = new paymentDAO();
        int userId;
        try {
            userId = Integer.parseInt(userId_raw);
            List<Payment> payList = pDAO.getPaymentsByUserId(userId);
            request.setAttribute("payList", payList);
            request.getRequestDispatcher("rechargeHistory.jsp").forward(request, response);
        } catch (Exception e) {
        }
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

    public void getHistoryPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId_raw = request.getParameter("userId");
        paymentDAO pDAO = new paymentDAO();
        int userId;
        try {
            userId = Integer.parseInt(userId_raw);
            List<paymentHistory> payHis = pDAO.getPaymentHistoryByUserId(userId);
            request.setAttribute("payHis", payHis);
            request.getRequestDispatcher("paymentHistory.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
}
