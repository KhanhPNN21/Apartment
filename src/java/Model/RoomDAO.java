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

    public Rooms getRoomById(int id) {

        try (Connection con = dbContext.getConnection(); 
                PreparedStatement ps = con.prepareStatement("SELECT r.*, a.*, p.*, l.*, ri.*\n"
                + "FROM Rooms r\n"
                + "JOIN Apartment a ON r.Apartment_id = a.apartment_id\n"
                + "LEFT JOIN Post p ON r.Room_id = p.Room_id\n"
                + "JOIN Location l ON a.Location_id = l.Location_Id\n"
                + "LEFT JOIN Rooms_img ri ON r.Room_id = ri.Room_id\n"
                + "where r.Room_id = ?")) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Rooms room = new Rooms(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)
                );
                return room;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
