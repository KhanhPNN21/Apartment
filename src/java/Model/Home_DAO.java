package Model;

import Dal.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class Home_DAO {

    DBContext dbContext = new DBContext();

    public List<Rooms> listAll() throws Exception {
        List<Rooms> roomList = new ArrayList<>();
        Connection con = null;

        try {
            con = dbContext.getConnection();
            String query = "SELECT Room_id, Price, Area, Room_number, Apartment_id, apartment_name, description, district, Ward, Img_url, Title, Post_date, Rank\n"
                    + "FROM (\n"
                    + "    SELECT r.Room_id, r.Price, r.Area, r.Room_number, r.Apartment_id,\n"
                    + "           a.apartment_name, p.description, l.district, l.Ward, ri.Img_url,\n"
                    + "           p.Title, p.Post_date, p.Rank,\n"
                    + "           ROW_NUMBER() OVER (PARTITION BY r.Room_id ORDER BY p.Rank DESC, p.Post_date DESC) AS row_num\n"
                    + "      FROM Rooms r\n"
                    + "      JOIN Apartment a ON r.Apartment_id = a.apartment_id\n"
                    + "      LEFT JOIN Post p ON r.Room_id = p.Room_id\n"
                    + "      JOIN Location l ON a.Location_id = l.Location_Id\n"
                    + "      LEFT JOIN Rooms_img ri ON r.Room_id = ri.Room_id\n"
                    + ") AS ranked\n"
                    + "WHERE row_num = 1\n"
                    + "ORDER BY Rank DESC, Post_date DESC";

            try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Rooms room = new Rooms(
                            rs.getInt(1),
                            rs.getInt(2),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8),
                            rs.getString(9),
                            rs.getString(10),
                            rs.getString(11),
                            rs.getString(12),
                            rs.getInt(13)
                    );
                    roomList.add(room);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return roomList;

    }

    public Users authenticate(String username, String password) {
        String query = "SELECT * FROM Users WHERE User_name = ? AND Password = ?";

        try (
                Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Users user = new Users(
                        rs.getInt("User_id"),
                        rs.getString("User_name"),
                        rs.getString("Full_name"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getInt("Account_balance")
                );
                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

        return null; // Trả về null nếu không tìm thấy người dùng
    }

    public String checkUsernameAndEmailExists(String username, String email) {
        String sql = "SELECT User_name, Email FROM Users WHERE User_name = ? OR Email = ?";

        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();

            // Kiểm tra sự tồn tại của username và email
            boolean usernameExists = false;
            boolean emailExists = false;

            while (rs.next()) {
                if (rs.getString("User_name").equals(username)) {
                    usernameExists = true;
                }
                if (rs.getString("Email").equals(email)) {
                    emailExists = true;
                }
            }

            // Trả về thông báo tùy theo trường hợp
            if (usernameExists && emailExists) {
                return "Username và Email đã tồn tại. Vui lòng chọn Username và Email khác.";
            } else if (usernameExists) {
                return "Username đã tồn tại. Vui lòng chọn Username khác.";
            } else if (emailExists) {
                return "Email đã tồn tại. Vui lòng chọn Email khác.";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không có lỗi xảy ra
    }

    public static void main(String[] args) {
        Home_DAO homeDao = new Home_DAO();
        try {
            List<Rooms> rooms = homeDao.listAll();
            if (rooms.isEmpty()) {
                System.out.println("No rooms available.");
            } else {
                for (Rooms room : rooms) {
                    System.out.println(room);
                }
            }
        } catch (Exception e) {
            System.out.println("An error occurred while connecting to the database.");
            e.printStackTrace();
        }
    }

}
