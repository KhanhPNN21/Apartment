package Model;
import Dal.DBContext;
import java.sql.Connection;
import java.sql.*;
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
        Connection con = null;
        String sql = "INSERT INTO Post (user_id,room_id,rank,amount,title,Description,time_limit) VALUES (?, ?, ?, ?, ?, ?,? )";
         con = dbContext.getConnection(); // Lấy kết nối từ dbContext
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, user_id);
            stmt.setInt(2, room_id);
            stmt.setInt(3, rank);
            stmt.setInt(4, amount);
            stmt.setString(5, title);
            stmt.setString(6, description);
            stmt.setInt(7, timeLimit);
            stmt.executeUpdate();

        } catch (Exception e) {
        }
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
    
    
    

    public int getRooms(String price, int area, int room_number, int apartment_id) throws Exception {
        String sql = "INSERT INTO Rooms  (price,area, Room_number,Apartment_id) VALUES (?, ?, ?,?)";
        Connection con = dbContext.getConnection(); // Lấy kết nối từ dbContext

        try (PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Sử dụng `con` thay vì `dbContext`
            stmt.setString(1, price);
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

        try (Connection con = dbContext.getConnection()
             ;PreparedStatement statement = con.prepareStatement("SELECT * FROM Post WHERE User_id = ?")) {
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
    
    public void deletePost(int post_id , int room_id ) throws SQLException{
         try (Connection con = dbContext.getConnection()){
            PreparedStatement statement = con.prepareStatement("Delete FROM Post WHERE Post_id = ?"); 
            statement.setInt(1, post_id);
            ResultSet resultSet = statement.executeQuery();
            
            PreparedStatement st = con.prepareStatement("Delete From room WHERE Room_id = ?");
    }

}
}