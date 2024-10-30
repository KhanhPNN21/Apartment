/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author acer
 */

public class Rooms {
    private int roomId;
    private int price;
    private int area;
    private int roomNumber;
    private int apartmentId;
    private String apartmentName; 
    private String description;   
    private String district;
    private String ward;          
    private String imgUrl;        
    private String title;
    private String postdate;
    private int rank;

    public Rooms() {
    }

    public Rooms(int roomId, int price, int area, int roomNumber, int apartmentId, String apartmentName, String description, String district, String ward, String imgUrl, String title, String postdate, int rank) {
        this.roomId = roomId;
        this.price = price;
        this.area = area;
        this.roomNumber = roomNumber;
        this.apartmentId = apartmentId;
        this.apartmentName = apartmentName;
        this.description = description;
        this.district = district;
        this.ward = ward;
        this.imgUrl = imgUrl;
        this.title = title;
        this.postdate = postdate;
        this.rank = rank;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getApartmentId() {
        return apartmentId;
    }

    public void setApartmentId(int apartmentId) {
        this.apartmentId = apartmentId;
    }

    public String getApartmentName() {
        return apartmentName;
    }

    public void setApartmentName(String apartmentName) {
        this.apartmentName = apartmentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPostdate() {
        return postdate;
    }

    public void setPostdate(String postdate) {
        this.postdate = postdate;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }
   
    @Override
    public String toString() {
        return "Rooms{" + "roomId=" + roomId + ", price=" + price + ", area=" + area + ", roomNumber=" + roomNumber + ", apartmentId=" + apartmentId + ", apartmentName=" + apartmentName + ", description=" + description + ", ward=" + ward + ", imgUrl=" + imgUrl + ", title=" + title + '}';
    }   
}
