/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Rooms;
import Model.SearchDAO;
import java.io.IOException;
import java.io.PrintWriter;
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

        Integer priceMin = null, priceMax = null, areaMin = null, areaMax = null;

        if ("under1m".equals(price)) {
            priceMax = 1000000;
        } else if ("between1mand2m".equals(price)) {
            priceMin = 1000000;
            priceMax = 2000000;
        } else if ("more2m".equals(price)) {
            priceMin = 2000000;
        }

        if ("under_50".equals(area)) {
            areaMax = 50;
        } else if ("50_100".equals(area)) {
            areaMin = 50;
            areaMax = 100;
        } else if ("over_100".equals(area)) {
            areaMin = 100;
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
}
