/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Rooms;
import Model.SearchDAO;
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
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String price = request.getParameter("price");
        String area = request.getParameter("area");
        
        System.out.println(district + " " + ward);
        Integer priceMin = null, priceMax = null, areaMin = null, areaMax = null;

        if ("under1m".equals(price)) {
            priceMax = 1000000;
        } else if ("between1mand2m".equals(price)) {
            priceMin = 1000000;
            priceMax = 2000000;
        } else if ("between2mand5m".equals(price)) {
            priceMin = 2000000;
            priceMax = 5000000;
        } else if ("upper5m".equals(price)) {
            priceMin = 5000000;
        }

        if ("under20".equals(area)) {
            areaMax = 20;
        } else if ("between20and30".equals(area)) {
            areaMin = 20;
            areaMax = 30;
        } else if ("between30and50".equals(area)) {
            areaMin = 30;
            areaMax = 50;
        } else if ("upper50".equals(area)) {
            areaMin = 50;
        }

        SearchDAO searchDAO = new SearchDAO();
        List<Rooms> rooms = searchDAO.searchRoom(district, ward, priceMin, priceMax, areaMin, areaMax);

        request.setAttribute("district", district);
        request.setAttribute("ward", ward);
        request.setAttribute("price", price);
        request.setAttribute("area", area);
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        SearchDAO searchDAO = new SearchDAO();
        List<Rooms> foundRooms = searchDAO.searchRoomByApartmentName(name);

        // Đặt thuộc tính để gửi dữ liệu đến JSP
        request.setAttribute("roomList", foundRooms);
        request.setAttribute("searchQuery", name);
        
        // Chuyển hướng đến trang kết quả tìm kiếm (ví dụ: searchResult.jsp)
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
