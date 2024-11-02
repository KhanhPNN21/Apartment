package Model;

import Dal.DBContext;
import java.sql.Connection;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class Post_DAO {

    DBContext dbContext = new DBContext();

//    
//    public User getUserbyId(int id){
//        String sql = "INSERT INTO Location (Street, Ward, District) VALUES (?, ?, ?)";
//        Connection con = dbContext.getConnectionWithSqlJdbc(); // Lấy kết nối từ dbContext
//    }
    public void getPost(int user_id, int room_id, int rank, int amount,
            String description, String title, int timeLimit) throws Exception {

        String sql = "INSERT INTO Post (user_id,room_id,rank,amount,title,Description,time_limit) VALUES (?, ?, ?, ?, ?, ?,? )";
        String sqlUpdateBalance = "UPDATE Users SET Account_balance = Account_balance - ? WHERE User_id = ?";
        try (Connection con = dbContext.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, user_id);
            stmt.setInt(2, room_id);
            stmt.setInt(3, rank);
            stmt.setInt(4, amount);
            stmt.setString(5, title);
            stmt.setString(6, description);
            stmt.setInt(7, timeLimit);
            stmt.executeUpdate();

            PreparedStatement pstUpdateBalance = con.prepareStatement(sqlUpdateBalance);
            pstUpdateBalance.setInt(1, amount);
            pstUpdateBalance.setInt(2, user_id);
            pstUpdateBalance.executeUpdate();
            
        } catch (Exception e) {
        }
    }

    public int getAccountBalance(int userId) throws SQLException {
        Connection connection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            connection = dbContext.getConnection();
            String sql = "SELECT Account_balance FROM Users WHERE User_id = ?";
            pst = connection.prepareStatement(sql);
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("Account_balance");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return 0; // Trả về 0 nếu không tìm thấy user
    }

    public int getLocation(String district, String ward, String street) throws Exception {
        String sql = "INSERT INTO Location (Street, Ward, District) VALUES (?, ?, ?)";
        Connection con = dbContext.getConnection(); // Lấy kết nối từ dbContext

        try (PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Sử dụng `con` thay vì `dbContext`
            stmt.setString(1, street);
            stmt.setString(2, ward);
            stmt.setString(3, district);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted == 0) {
                throw new SQLException("Failed to insert location, no rows affected.");
            }

            // Lấy ID tự động sinh từ bảng Location
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Trả về `location_id` vừa tạo
                } else {
                    throw new SQLException("Failed to retrieve location_id, no ID obtained.");
                }
            }
        }
    }

    public int getApartment(String apartmentName, int location_id, int available_room) throws Exception {
        String sql = "INSERT INTO Apartment  (apartment_name,Location_id, available_room) VALUES (?, ?, ?)";
        Connection con = dbContext.getConnection(); // Lấy kết nối từ dbContext

        try (PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Sử dụng `con` thay vì `dbContext`
            stmt.setString(1, apartmentName);
            stmt.setInt(2, location_id);
            stmt.setInt(3, available_room);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted == 0) {
                throw new SQLException("Failed to insert Rooms, no rows affected.");
            }

            // Lấy ID tự động sinh từ bảng Location
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Trả về `Apartment_id` vừa tạo
                } else {
                    throw new SQLException("Failed to retrieve location_id, no ID obtained.");
                }
            }
        }
    }

    public int getRooms(int price, int area, int room_number, int apartment_id) throws Exception {
        String sql = "INSERT INTO Rooms  (price,area, Room_number,Apartment_id) VALUES (?, ?, ?,?)";
        Connection con = dbContext.getConnection(); // Lấy kết nối từ dbContext

        try (PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Sử dụng `con` thay vì `dbContext`
            stmt.setInt(1, price);
            stmt.setInt(2, area);
            stmt.setInt(3, room_number);
            stmt.setInt(4, apartment_id);
            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Trả về `Apartment_id` vừa tạo
                } else {
                    throw new SQLException("Failed to retrieve location_id, no ID obtained.");
                }
            }
        }
    }

    public List<Post> getPostsByUserId(int userId) {
        List<Post> posts = new ArrayList<>();

        try (Connection con = dbContext.getConnection(); PreparedStatement statement = con.prepareStatement("SELECT * FROM Post WHERE User_id = ?")) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Post post = new Post();
                post.setPostId(resultSet.getInt("Post_id"));
                post.setUserId(resultSet.getInt("User_id"));
                post.setPostDate(resultSet.getString("Post_date"));
                post.setRoomId(resultSet.getInt("Room_id"));
                post.setAmount(resultSet.getInt("Amount"));
                post.setRank(resultSet.getInt("Rank"));
                post.setTitle(resultSet.getString("Title"));
                post.setDescription(resultSet.getString("Description"));
                post.setTimeLimit(resultSet.getInt("Time_limit"));
                posts.add(post);
            }
        } catch (SQLException e) {
            // Handle exception
            e.printStackTrace();
        }

        return posts;
    }

    public void deletePost(int post_id, int room_id) throws SQLException {
        try (Connection con = dbContext.getConnection()) {
            PreparedStatement statement = con.prepareStatement("Delete FROM Post WHERE Post_id = ?");
            statement.setInt(1, post_id);
            statement.executeUpdate();

            PreparedStatement st = con.prepareStatement("Delete From rooms WHERE Room_id = ?");
            st.setInt(1, room_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }

    }

    public int updatePost(int post_id, String newDescription, String newTitle) {

        ResultSet rs = null;
        int roomId = -1;
        try (Connection con = dbContext.getConnection()) {
            // Câu lệnh SQL để cập nhật Description và Title
            String updateSQL = "UPDATE Post SET Description = ?, Title = ? WHERE Post_id = ?";
            PreparedStatement st = con.prepareStatement(updateSQL);
            st.setString(1, newDescription);
            st.setString(2, newTitle);
            st.setInt(3, post_id);
            st.executeUpdate();

            // Truy vấn để lấy room_id sau khi cập nhật
            String selectSQL = "SELECT Room_id FROM Post WHERE Post_id = ?";
            PreparedStatement statement = con.prepareStatement(selectSQL);
            statement.setInt(1, post_id);
            rs = statement.executeQuery();
            if (rs.next()) {
                roomId = rs.getInt("Room_id");
            }
        } catch (SQLException e) {

        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {

            }
        }

        return roomId;
    }

    public int updateRoom(int room_id, int price, int room_number, int area) {

        ResultSet rs = null;
        int apartmentId = -1;
        try (Connection con = dbContext.getConnection()) {
            // Câu lệnh SQL để cập nhật Description và Title
            String updateSQL = "UPDATE Rooms SET Price = ?, Room_number = ?, Area = ? WHERE Room_id = ?";
            PreparedStatement stmt = con.prepareStatement(updateSQL);
            stmt.setInt(1, price);
            stmt.setInt(2, room_number);
            stmt.setInt(3, area);
            stmt.setInt(4, room_id);
            stmt.executeUpdate();

            // Truy vấn để lấy room_id sau khi cập nhật
            String selectSQL = "SELECT Apartment_id FROM Rooms WHERE Room_id = ?";
            PreparedStatement statement = con.prepareStatement(selectSQL);
            statement.setInt(1, room_id);
            rs = statement.executeQuery();
            if (rs.next()) {
                apartmentId = rs.getInt("Apartment_id");
            }
        } catch (SQLException e) {
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
            }
        }

        return apartmentId;
    }

    public int updateApartment(int apartment_id, String apartmentName, int available_room) {

        ResultSet rs = null;
        int locationId = -1;
        try (Connection con = dbContext.getConnection()) {
            // Câu lệnh SQL để cập nhật Description và Title
            String updateSQL = "UPDATE Apartment SET apartment_name = ?, available_room = ? WHERE apartment_id = ?";
            PreparedStatement stmt = con.prepareStatement(updateSQL);
            stmt.setString(1, apartmentName);
            stmt.setInt(2, available_room);
            stmt.setInt(3, apartment_id);
            stmt.executeUpdate();

            // Truy vấn để lấy room_id sau khi cập nhật
            String selectSQL = "SELECT Location_id FROM Apartment WHERE apartment_id = ?";
            PreparedStatement statement = con.prepareStatement(selectSQL);
            statement.setInt(1, apartment_id);
            rs = statement.executeQuery();
            if (rs.next()) {
                locationId = rs.getInt("Location_id");
            }
        } catch (SQLException e) {
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
            }
        }

        return locationId;
    }

    public void updateLocation(int location_id, String street, String ward, String district) {
        String sql = "UPDATE Location SET Street = ?, Ward = ?, District = ? WHERE Location_id = ?";

        try (Connection con = dbContext.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, street);
            stmt.setString(2, ward);
            stmt.setString(3, district);
            stmt.setInt(4, location_id);
            stmt.executeUpdate();

        } catch (SQLException e) {

            throw new RuntimeException("Failed to update location.", e);
        }
    }

    public void checkAndExtendPost(int userId, int postId, String expiryDate, int duration, int price) throws SQLException {
        String updateSQL;
        LocalDate currentDate = LocalDate.now();
        LocalDate localDate = LocalDate.parse(expiryDate);
        String sqlUpdateBalance = "UPDATE Users SET Account_balance = Account_balance - ? WHERE User_id = ?";
        
        try (Connection con = dbContext.getConnection()) {
            // Nếu bài đăng đã hết hạn, cập nhật lại postDate và các trường khác
            if (currentDate.isAfter(localDate)) {
                updateSQL = "UPDATE post SET post_date = ?, time_limit = time_Limit + ?, amount = amount + ? WHERE post_id = ?";
                PreparedStatement updatePs = con.prepareStatement(updateSQL);
                updatePs.setDate(1, java.sql.Date.valueOf(currentDate));
                updatePs.setInt(2, duration);
                updatePs.setInt(3, price);
                updatePs.setInt(4, postId);
                updatePs.executeUpdate();
            } else { // Nếu bài đăng chưa hết hạn, chỉ cập nhật expiryDate, timeLimit, và amount
                updateSQL = "UPDATE post SET time_limit = ?, amount = ? WHERE post_id = ?";
                PreparedStatement updatePs = con.prepareStatement(updateSQL);
                updatePs.setInt(1, duration);
                updatePs.setInt(2, price);
                updatePs.setInt(3, postId);
                updatePs.executeUpdate();
            }
            PreparedStatement pstUpdateBalance = con.prepareStatement(sqlUpdateBalance);
            pstUpdateBalance.setInt(1, price);
            pstUpdateBalance.setInt(2, userId);
            pstUpdateBalance.executeUpdate();
        }       
    }
}
