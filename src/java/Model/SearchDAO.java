package Model;

import Dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchDAO {

    DBContext dbContext = new DBContext();
    
    private static final Map<String, String> districtMap = new HashMap<>();

    static {
        districtMap.put("lien_chieu", "Quận Liên Chiểu");
        districtMap.put("hai_chau", "Quận Hải Châu");
        districtMap.put("ngu_hanh_son", "Quận Ngũ Hành Sơn");
        districtMap.put("son_tra", "Quận Sơn Trà");
        districtMap.put("cam_le", "Quận Cẩm Lệ");
        districtMap.put("thanh_khe", "Quận Thanh Khê");
        districtMap.put("hoa_vang", "Huyện Hòa Vang");
        districtMap.put("hoang_sa", "Huyện Hoàng Sa");
    }

//    public List<Rooms> searchRoomByApartmentName(String name) {
//        List<Rooms> rooms = new ArrayList<>();
//        String sql = "SELECT * FROM Rooms WHERE apartment_name LIKE ?";
//
//        try (Connection con = dbContext.getConnection(); 
//                PreparedStatement stmt = con.prepareStatement(sql)) {
//
//            stmt.setString(1, "%" + name + "%");
//            ResultSet rs = stmt.executeQuery();
//
//            while (rs.next()) {
//                Rooms room = new Rooms(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getInt(3),
//                        rs.getInt(4),
//                        rs.getInt(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        rs.getString(10),
//                        rs.getString(11),
//                        rs.getInt(12)
//                );
//                rooms.add(room);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return rooms;
//    }
    public List<Rooms> searchRoom(String district, String ward, Integer priceMin, Integer priceMax, Integer areaMin, Integer areaMax) {
        List<Rooms> rooms = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT r.Room_id, r.Price, r.Area, r.Room_number, r.Apartment_id,\n"
                + "       a.apartment_name, p.description, l.district, l.Ward, ri.Img_url,\n"
                + "       p.Title, p.Post_date, p.Rank\n"
                + "FROM Rooms r\n"
                + "JOIN Apartment a ON r.Apartment_id = a.apartment_id\n"
                + "LEFT JOIN Post p ON r.Room_id = p.Room_id\n"
                + "JOIN Location l ON a.Location_id = l.Location_Id\n"
                + "LEFT JOIN Rooms_img ri ON r.Room_id = ri.Room_id\n"
                + "where 1=1");
        
        if (district != null) {
            district = districtMap.get(district);
            query.append(" AND l.District = ?");
        }
        if (ward != null && !ward.trim().isEmpty()) {
            query.append(" AND l.ward = ?");
        }
        System.out.println(district+" "+ward);
        if (priceMin != null) {
            query.append(" AND price >= ?");
        }
        if (priceMax != null) {
            query.append(" AND price <= ?");
        }
        if (areaMin != null) {
            query.append(" AND area >= ?");
        }
        if (areaMax != null) {
            query.append(" AND area <= ?");
        }

        try (Connection con = dbContext.getConnection(); 
                PreparedStatement stmt = con.prepareStatement(query.append(" ORDER BY p.Rank DESC").toString())) {
            System.out.println("Final Query: " + query.toString());
            int paramIndex = 1;
            if (district != null) {
                stmt.setString(paramIndex++, district);
            }
            if (ward != null && !ward.trim().isEmpty()) {
                stmt.setString(paramIndex++, ward);
            }
            if (priceMin != null) {
                stmt.setInt(paramIndex++, priceMin);
            }
            if (priceMax != null) {
                stmt.setInt(paramIndex++, priceMax);
            }
            if (areaMin != null) {
                stmt.setInt(paramIndex++, areaMin);
            }
            if (areaMax != null) {
                stmt.setInt(paramIndex++, areaMax);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                rooms.add(new Rooms(
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
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }
}
