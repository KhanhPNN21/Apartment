package Controller;

import Model.Detail;
import Model.Post;
import Model.Post_DAO;
import Model.RoomDAO;
import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;


/**
 *
 * @author acer
 */
@MultipartConfig
@WebServlet(name = "PostServlet", urlPatterns = {"/PostServlet"})
public class PostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         System.out.println("Context Path: " + request.getServletContext().getRealPath("imgroom"));
         
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Context Path: " + request.getContextPath());
        try { 
            Post_DAO pDao = new Post_DAO();

            // Các tham số khác từ request
            String district = request.getParameter("district");
            String ward = request.getParameter("ward");
            String street = request.getParameter("houseNumber");
            String apartmentName = request.getParameter("apartmentName");
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            int userId = Integer.parseInt(request.getParameter("userId"));
            int availableRoom = Integer.parseInt(request.getParameter("roomAvailable"));
            int area = Integer.parseInt(request.getParameter("area"));
            int price = Integer.parseInt(request.getParameter("rentPrice"));
            int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
            int rank = Integer.parseInt(request.getParameter("level"));
            int dayLimit = Integer.parseInt(request.getParameter("duration"));
            int amount = Integer.parseInt(request.getParameter("price"));

            // Tạo đường dẫn lưu ảnh
            //"D:\Prj301project\WebprojectG2\web\imgroom"
            String uploadPath = request.getServletContext().getRealPath("imgroom");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Lấy danh sách các file ảnh từ request
            // Lưu thông tin bài đăng
            int locationIdRaw = pDao.getLocation(district, ward, street);
            int apartmentIdRaw = pDao.getApartment(apartmentName, locationIdRaw, availableRoom);
            int roomIdRaw = pDao.getRooms(price, area, roomNumber, apartmentIdRaw);
   

            // Kiểm tra số dư và lưu post
            // Lấy danh sách các file ảnh từ request
             // Kiểm tra xem có phần ảnh nào không
            List<Part> parts = new ArrayList<>();
            for (Part part : request.getParts()) {
                if (part.getName().equals("image")) {
                    parts.add(part);
                }
            }

            // Lưu các file ảnh
            for (Part filePart : parts) {
                if ("image".equals(filePart.getName()) && filePart.getSize() > 0) {
                    // Đặt tên file ảnh
                    String fileName = "img_" + System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath);

                    // Lưu URL của ảnh vào cơ sở dữ liệu
                    pDao.saveImgUrl(roomIdRaw, "imgroom/" + fileName); // Sửa roomIdRaw thay vì roomId
                }
            }

            int currentAccountBalance = pDao.getAccountBalance(userId);
            if (currentAccountBalance < amount) {
                request.setAttribute("error", "Số dư tài khoản hiện tại của bạn không đủ.");
                request.getRequestDispatcher("post.jsp").forward(request, response);
                return;
            }

         

            // Cập nhật số dư trong session
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
               pDao.getPost(userId, roomIdRaw, rank, amount, description, title, dayLimit);
            if (user != null) {
                int currentBalance = user.getAccountBalance();
                user.setAccountBalance(currentBalance - amount);
                session.setAttribute("user", user);
            }

            response.sendRedirect("PostServlet?command=history&userId=" + userId);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?error=invalidNumber");
        } catch (Exception e) {
            e.printStackTrace();
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
                HttpSession session = request.getSession();
                Users user = (Users) session.getAttribute("user");
                pDao.checkAndExtendPost(userId, postId, expiryDate, timeLimit, amount);

                if (user != null) {
                    int currentBalance = user.getAccountBalance();
                    user.setAccountBalance(currentBalance - amount);
                    session.setAttribute("user", user);
                }
                response.sendRedirect("PostServlet?command=history&userId=" + userId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
