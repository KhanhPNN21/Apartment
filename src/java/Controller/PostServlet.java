package Controller;

import Model.Post;
import Model.Post_DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author acer
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/PostServlet"})
public class PostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getPostbyId(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Post_DAO pDao = new Post_DAO();
        
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String street = request.getParameter("houseNumber");
        String apartment_name = request.getParameter("apartmentName");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        
        // Parse các giá trị từ request
        int userId = Integer.parseInt(request.getParameter("userId"));
        int available_room = Integer.parseInt(request.getParameter("roomAvailable"));
        int area = Integer.parseInt(request.getParameter("area"));
        String price = request.getParameter("rentPrice");
        int room_number = Integer.parseInt(request.getParameter("roomNumber"));
        int rank = Integer.parseInt(request.getParameter("level"));
        int daylimit = Integer.parseInt(request.getParameter("duration"));
        int amount = Integer.parseInt(request.getParameter("price"));
        
        
        // Gọi các phương thức từ Post_DAO
        int location_id_raw = pDao.getLocation(district, ward, street);
        int apartment_id_raw = pDao.getApartment(apartment_name, location_id_raw, available_room);
        int room_id_raw = pDao.getRooms(price, area, room_number, apartment_id_raw);
        
        // Lưu post
        pDao.getPost(userId, room_id_raw, rank, amount, description, title, daylimit);
        
        // Điều hướng về trang chủ
        response.sendRedirect("HomeServlet");
        
    } catch (NumberFormatException e) {
        e.printStackTrace();
        // Điều hướng đến trang lỗi nếu không thể parse int
        response.sendRedirect("errorPage.jsp?error=invalidNumber");
    } catch (Exception e) {
        e.printStackTrace();
        // Điều hướng đến trang lỗi nếu có lỗi khác xảy ra
        response.sendRedirect("errorPage.jsp?error=generalError");
    }
}

    
    public void getPostbyId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Post_DAO pDao = new Post_DAO();
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<Post> listPost = pDao.getPostsByUserId(userId);
        request.setAttribute("listPost",listPost);
        request.getRequestDispatcher("posthistory.jsp").forward(request, response);
       
    }
    
   

}