/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author acer
 */
public class Apartment {
    private int apartmentId;
    private String apartmentName;
    private int location_Id;
    private int availableRoom;

    public Apartment() {
    }

    public Apartment(int apartmentId, String apartmentName, int location_Id, int availableRoom) {
        this.apartmentId = apartmentId;
        this.apartmentName = apartmentName;
        this.location_Id = location_Id;
        this.availableRoom = availableRoom;
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

    public int getLocation_Id() {
        return location_Id;
    }

    public void setLocation_Id(int location_Id) {
        this.location_Id = location_Id;
    }

    public int getAvailableRoom() {
        return availableRoom;
    }

    public void setAvailableRoom(int availableRoom) {
        this.availableRoom = availableRoom;
    }
    
    
}
