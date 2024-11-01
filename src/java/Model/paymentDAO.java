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
     
     public List<Payment> getPaymentsByUserId(int userId) {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT Payment_id, Amount, Method, Pay_date FROM Payment WHERE User_id = ?";

        try (Connection con = dbContext.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int paymentId = resultSet.getInt("Payment_id");
                    int amount = resultSet.getInt("Amount");
                    String method = resultSet.getString("Method");
                    String payDate = resultSet.getString("Pay_date");

                    Payment payment = new Payment(paymentId,userId,payDate,amount, method);
                    payments.add(payment);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payments;
    }
     
     
     
   public List<paymentHistory> getPaymentHistoryByUserId(int userId) throws SQLException {
    List<paymentHistory> historyList = new ArrayList<>();
    ResultSet rs = null;
    try {
        Connection con = dbContext.getConnection();
        String sql = "SELECT Post_id, Amount, Post_date FROM Post WHERE User_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, userId);
        rs = pst.executeQuery();

        while (rs.next()) {
            int postId = rs.getInt("Post_id");
            int amount = rs.getInt("Amount");
            String postDate = rs.getString("Post_date");

            paymentHistory history = new paymentHistory(postId, amount, postDate);
            historyList.add(history);
        }
    } finally {
        if (rs != null) rs.close();
    }
    return historyList;
}  
     
}
