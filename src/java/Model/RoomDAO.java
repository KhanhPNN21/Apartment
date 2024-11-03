package Model;

import Dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tai
 */
public class RoomDAO {

    DBContext dbContext = new DBContext();

   public Detail getRoomById(int id) {
    Detail room = null;
    List<String> imgUrls = new ArrayList<>();

    try (Connection con = dbContext.getConnection();
         PreparedStatement ps = con.prepareStatement("SELECT r.*, p.*, a.*, l.*, u.*, img.img_url\n" +
"FROM Rooms r \n" +
"JOIN Post p ON r.room_id = p.room_id \n" +
"JOIN Apartment a ON r.apartment_id = a.apartment_id \n" +
"JOIN Location l ON l.location_id = a.location_id \n" +
"JOIN Users u ON u.user_id = p.user_id \n" +
"LEFT JOIN (\n" +
"    SELECT room_id, img_url,\n" +
"           ROW_NUMBER() OVER (PARTITION BY room_id ORDER BY img_url) AS rn\n" +
"    FROM Rooms_img\n" +
") AS img ON r.room_id = img.room_id AND img.rn = 1  -- Lấy img_url đầu tiên cho mỗi room_id\n" +
"WHERE r.room_id = ?")) {

        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            if (room == null) {
                // Chỉ khởi tạo room một lần duy nhất
                room = new Detail(
                        rs.getInt("room_id"),
                        rs.getInt("price"),
                        rs.getInt("area"),
                        rs.getInt("room_number"),
                        rs.getInt("apartment_id"),
                        rs.getString("apartment_name"),
                        rs.getDate("post_date"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("rank"),
                        rs.getString("district"),
                        rs.getString("ward"),
                        rs.getString("street"),
                        imgUrls, // Danh sách imgUrls sẽ được thêm vào sau
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("email")
                );
            }
            // Thêm từng img_url vào danh sách imgUrls
            imgUrls.add(rs.getString("img_url"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return room;
   }
}
