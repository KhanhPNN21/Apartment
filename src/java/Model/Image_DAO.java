/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.*;
import Dal.DBContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.Rooms;
/**
 *
 * @author acer
 */
public class Image_DAO {

    DBContext dbContext = new DBContext();

    public boolean addImage(int roomId, String imgUrl) {
    String sql = "INSERT INTO Rooms_img (Room_id, Img_url) VALUES (?, ?)";
    try (Connection con = dbContext.getConnection(); 
         PreparedStatement stmt = con.prepareStatement(sql)) {
        stmt.setInt(1, roomId);
        stmt.setString(2, imgUrl);
        stmt.executeUpdate();
        return true;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
    }
    
       public static void main(String[] args) {
        Image_DAO idao = new Image_DAO();

    }

}
