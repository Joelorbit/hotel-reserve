package com.hrs.hotel.model;

public class Booking {
    private int id;
    private String userEmail;
    private String roomType;
    private double price;
    private String date;

    public Booking(int id, String userEmail, String roomType, double price, String date) {
        this.id = id;
        this.userEmail = userEmail;
        this.roomType = roomType;
        this.price = price;
        this.date = date;
    }

    public int getId() { return id; }
    public String getUserEmail() { return userEmail; }
    public String getRoomType() { return roomType; }
    public double getPrice() { return price; }
    public String getDate() { return date; }
}