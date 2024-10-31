/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dal.DBContext;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class paymentDAO {
    DBContext dbContext = new DBContext();
    
     public void depositAmount(int userId, int amount , String method) {
        String userSql = "UPDATE users SET Account_balance = Account_balance + ? WHERE user_id = ?";
        String paymentSql = "INSERT INTO Payment (User_id, Pay_date, Amount, Method) VALUES (?, GETDATE(),?, ?)";
        try (Connection con = dbContext.getConnection()){
            PreparedStatement preparedStatement = con.prepareStatement(userSql);
            preparedStatement.setInt(1, amount);
            preparedStatement.setInt(2, userId);
            preparedStatement.executeUpdate();
            
            PreparedStatement st = con.prepareStatement(paymentSql);
            st.setInt(1, userId);
            st.setInt(2, amount);
            st.setString(3, method);
            st.executeUpdate();
                  } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
     
     
     
     
     
}
