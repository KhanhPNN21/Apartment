package Model;

import Dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO {
    DBContext dbContext = new DBContext();
  
    public List<Rooms> searchRoom(String district, String ward, Integer priceMin, Integer priceMax, Integer areaMin, Integer areaMax) {
        List<Rooms> rooms = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT r.*, p.*, a.*, l.*, i.* "
                + "FROM Rooms r JOIN Post p ON r.room_id = p.room_id "
                + "JOIN Rooms_img i ON r.Room_id = i.Room_id "
                + "JOIN Apartment a ON r.Apartment_id = a.apartment_id "
                + "JOIN Location l ON l.location_id = a.location_id WHERE 1=1");

        // Add conditions based on non-null parameters
        if (district != null) query.append(" AND l.District = N?");
        if (ward != null) query.append(" AND l.ward = N?");
        if (priceMin != null) query.append(" AND price > ?");
        if (priceMax != null) query.append(" AND price < ?");
        if (areaMin != null) query.append(" AND area > ?");
        if (areaMax != null) query.append(" AND area < ?");

        try (Connection con = dbContext.getConnection(); 
             PreparedStatement stmt = con.prepareStatement(query.toString())) {
            
            int paramIndex = 1;
            if (district != null) stmt.setString(paramIndex++, district);
            if (ward != null) stmt.setString(paramIndex++, ward);
            if (priceMin != null) stmt.setInt(paramIndex++, priceMin);
            if (priceMax != null) stmt.setInt(paramIndex++, priceMax);
            if (areaMin != null) stmt.setInt(paramIndex++, areaMin);
            if (areaMax != null) stmt.setInt(paramIndex++, areaMax);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                rooms.add(new Rooms(
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
                    ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // Specific search methods calling the generic searchRoom with relevant parameters
    public List<Rooms> searchRoomByLocation(String district, String ward) {
        return searchRoom(district, ward, null, null, null, null);
    }

    public List<Rooms> searchRoomByPrice(int priceMin, int priceMax) {
        return searchRoom(null, null, priceMin, priceMax, null, null);
    }

    public List<Rooms> searchRoomByArea(int areaMin, int areaMax) {
        return searchRoom(null, null, null, null, areaMin, areaMax);
    }

    public List<Rooms> searchRoomByLocationAndArea(String district, String ward, int areaMin, int areaMax) {
        return searchRoom(district, ward, null, null, areaMin, areaMax);
    }

    public List<Rooms> searchRoomByLocationAndPrice(String district, String ward, int priceMin, int priceMax) {
        return searchRoom(district, ward, priceMin, priceMax, null, null);
    }

    public List<Rooms> searchRoomByPriceAndArea(int priceMin, int priceMax, int areaMin, int areaMax) {
        return searchRoom(null, null, priceMin, priceMax, areaMin, areaMax);
    }

    public List<Rooms> searchRoomByAll(String district, String ward, int priceMin, int priceMax, int areaMin, int areaMax) {
        return searchRoom(district, ward, priceMin, priceMax, areaMin, areaMax);
    }
}
