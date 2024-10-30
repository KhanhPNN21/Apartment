/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author acer
 */
public class Post {
    private int postId;
    private int userId;
    private String postDate;
    private int roomId;
    private int rank;
    private int amount;
    private String title;
    private String description;
    private int timeLimit;

    public Post() {
    }

    public Post(int postId, int userId, String postDate, int roomId, int rank, int amount, String title, String description, int timeLimit) {
        this.postId = postId;
        this.userId = userId;
        this.postDate = postDate;
        this.roomId = roomId;
        this.rank = rank;
        this.amount = amount;
        this.title = title;
        this.description = description;
        this.timeLimit = timeLimit;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }
public String getExpiryDate() {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate startDate = LocalDate.parse(this.postDate, formatter);
            LocalDate expiryDate = startDate.plusDays(this.timeLimit);
            return expiryDate.format(formatter);
        } catch (Exception e) {
            // Xử lý lỗi nếu định dạng ngày không hợp lệ
            e.printStackTrace();
            return null;
        }
    }
   
}
