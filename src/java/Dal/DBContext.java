/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;
/**
 *
 * @author acer
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    
    public Connection getConnection() {
        String dbUser = "sa"; 
        String dbPassword = "123";
        String ServerName = "DESKTOP-UJM6TJ3";
        String DBName = "Room_searching";
        String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String dbURL = "jdbc:sqlserver://" + ServerName + ";databaseName=" + DBName + ";encrypt=false;loginTimeout=30"; 

        try {
            // Tải driver
            Class.forName(driverClass); 
            // Trả về kết nối mới
            return DriverManager.getConnection(dbURL, dbUser, dbPassword);    
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
