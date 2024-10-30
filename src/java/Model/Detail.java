package Model;

import java.util.Date;

/**
 *
 * @author Tai
 */
public class Detail {
    private int roomId;
    private String price;
    private int area;
    private int roomNumber;
    private int apartmentId;
    private String apartmentName;
    private Date postDate;
    private String title;
    private String description;
    private int locationId;
    private String district;
    private String ward;
    private String street;
    private String imgUrl;
    private String phone;
    private String email;

    public Detail(int roomId, String price, int area, int roomNumber, int apartmentId, String apartmentName, Date postDate, String title, String description, int locationId, String district, String ward, String street, String imgUrl) {
        this.roomId = roomId;
        this.price = price;
        this.area = area;
        this.roomNumber = roomNumber;
        this.apartmentId = apartmentId;
        this.apartmentName = apartmentName;
        this.postDate = postDate;
        this.title = title;
        this.description = description;
        this.locationId = locationId;
        this.district = district;
        this.ward = ward;
        this.street = street;
        this.imgUrl = imgUrl;
    }

    public Detail() {
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
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

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
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

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Override
    public String toString() {
        return "Room{" + "roomId=" + roomId + ", price=" + price + ", area=" + area + ", roomNumber=" + roomNumber + ", apartmentId=" + apartmentId + ", apartmentName=" + apartmentName + ", postDate=" + postDate + ", title=" + title + ", description=" + description + ", locationId=" + locationId + ", district=" + district + ", ward=" + ward + ", street=" + street + ", imgUrl=" + imgUrl + ", phone=" + phone + ", email=" + email + '}';
    }

    
}
