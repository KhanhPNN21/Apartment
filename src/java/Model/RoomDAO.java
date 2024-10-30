package Model;

import Dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Tai
 */
public class RoomDAO {

    DBContext dbContext = new DBContext();

    public Detail getRoomById(int id) {

        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT r.*, p.*, a.*, l.*, i.*, u.*\n"
                + "                FROM Rooms r join Post p on r.room_id = p.room_id\n"
                + "                join Rooms_img i on r.Room_id = i.Room_id\n"
                + "                join Apartment a on r.Apartment_id = a.apartment_id\n"
                + "                join Location l on l.location_id = a.location_id\n"
                + "				join Users u on u.User_id = p.User_id\n"
                + "                where r.Room_id = ?")) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Detail room = new Detail(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(16),
                        rs.getDate(8),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getInt(10),
                        rs.getString(22),
                        rs.getString(21),
                        rs.getString(20),
                        rs.getString(25),
                        rs.getString(28),
                        rs.getString(29),
                        rs.getString(30)
                );
                return room;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
