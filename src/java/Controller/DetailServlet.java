/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.RoomDAO;
import Model.Detail;
import Model.Rooms;
import Model.SearchDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Tai
 */
public class DetailServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        RoomDAO roomDAO = new RoomDAO();
        Detail room = roomDAO.getRoomById(roomId);
        SearchDAO searchDAO = new SearchDAO();
        List<Rooms> rooms = searchDAO.listRoomExceptRoomId(roomId);
        if (room != null) {
            request.setAttribute("room", room);
            request.setAttribute("rooms", rooms);
            RequestDispatcher dispatcher = request.getRequestDispatcher("roomDetail.jsp");
            dispatcher.forward(request, response);
        } else {
            // Xử lý trường hợp không tìm thấy phòng
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Room not found");
        }
    }
}
