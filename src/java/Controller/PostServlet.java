package Controller;

import Model.Detail;
import Model.Post;
import Model.Post_DAO;
import Model.RoomDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/PostServlet"})
public class PostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");

        switch (command) {
            case "history":
                getPostbyId(request, response);
                break;
            case "delete":
                deletePost(request, response);
                break;
            case "update":
                getInforPost(request, response);
                break;
            case "updatePost":
                updatePost(request, response);
                break;
            case "extend":
                extendTime(request, response);
                break;
        }
    }

    @Override
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
            int price = Integer.parseInt(request.getParameter("rentPrice"));
            int room_number = Integer.parseInt(request.getParameter("roomNumber"));
            int rank = Integer.parseInt(request.getParameter("level"));
            int daylimit = Integer.parseInt(request.getParameter("duration"));
            int amount = Integer.parseInt(request.getParameter("price"));

            // Gọi các phương thức từ Post_DAO
            int location_id_raw = pDao.getLocation(district, ward, street);
            int apartment_id_raw = pDao.getApartment(apartment_name, location_id_raw, available_room);
            int room_id_raw = pDao.getRooms(price, area, room_number, apartment_id_raw);

            // Lưu post
            int currentAcountBalance = pDao.getAccountBalance(userId);
            if (currentAcountBalance < amount) {
                request.setAttribute("error", "Số dư tài khoản hiện tại của bản không đủ");
                request.getRequestDispatcher("post.jsp").forward(request, response);
            }
            pDao.getPost(userId, room_id_raw, rank, amount, description, title, daylimit);
            response.sendRedirect("PostServlet?command=history&userId=" + userId);

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
        request.setAttribute("listPost", listPost);
        request.getRequestDispatcher("posthistory.jsp").forward(request, response);

    }

    public void deletePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomId_raw = request.getParameter("roomId");
        String postId_raw = request.getParameter("postId");
        String userId_raw = request.getParameter("userId");
        Post_DAO pDao = new Post_DAO();
        int roomId, userId, postId;
        try {
            userId = Integer.parseInt(userId_raw);
            roomId = Integer.parseInt(roomId_raw);
            postId = Integer.parseInt(postId_raw);
            pDao.deletePost(postId, roomId);
            response.sendRedirect("PostServlet?command=history&userId=" + userId);
        } catch (Exception e) {
        }
    }

    public void getInforPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomId_raw = request.getParameter("roomId");
        String postId_raw = request.getParameter("postId");

        int roomID, postId;
        RoomDAO rdao = new RoomDAO();
        try {
            roomID = Integer.parseInt(roomId_raw);
            postId = Integer.parseInt(postId_raw);
            Detail detail = rdao.getRoomById(roomID);
            request.setAttribute("detail", detail);
            request.setAttribute("postId", postId);
            request.getRequestDispatcher("editPost.jsp").forward(request, response);
        } catch (Exception e) {

        }
    }

    public void updatePost(HttpServletRequest request, HttpServletResponse response)
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
            int available_room = Integer.parseInt(request.getParameter("roomAvailable"));
            int area = Integer.parseInt(request.getParameter("area"));
            int price = Integer.parseInt(request.getParameter("rentPrice"));
            int room_number = Integer.parseInt(request.getParameter("roomNumber"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            int postId = Integer.parseInt(request.getParameter("postId"));

            // Gọi các phương thức từ Post_DAO
            int roomID = pDao.updatePost(postId, description, title);
            int apartmentId = pDao.updateRoom(roomID, price, room_number, area);
            int locationId = pDao.updateApartment(apartmentId, apartment_name, available_room);
            pDao.updateLocation(locationId, street, ward, district);
            response.sendRedirect("PostServlet?command=history&userId=" + userId);

        } catch (NumberFormatException e) {

            // Điều hướng đến trang lỗi nếu không thể parse int
            response.sendRedirect("errorPage.jsp?error=invalidNumber");
        } catch (IOException e) {

            // Điều hướng đến trang lỗi nếu có lỗi khác xảy ra
            response.sendRedirect("errorPage.jsp?error=generalError");
        }
    }

    public void extendTime(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            Post_DAO pDao = new Post_DAO();
            int userId = Integer.parseInt(request.getParameter("userId"));
            int postId = Integer.parseInt(request.getParameter("postId"));
            int timeLimit = Integer.parseInt(request.getParameter("duration"));
            String expiryDate = request.getParameter("expiryDate");
            int amount = Integer.parseInt(request.getParameter("price"));

            int currentAcountBalance = pDao.getAccountBalance(userId);
            if (currentAcountBalance < amount) {
                request.setAttribute("error", "Số dư tài khoản hiện tại của bạn không đủ");
                request.getRequestDispatcher("post.jsp").forward(request, response);
            } else {
                pDao.checkAndExtendPost(userId, postId, expiryDate, timeLimit, amount);
                response.sendRedirect("PostServlet?command=history&userId=" + userId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
