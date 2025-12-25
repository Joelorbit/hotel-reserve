package com.hrs.hotel.dao;

import com.hrs.hotel.model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private String dbUrl = "jdbc:mysql://localhost:3306/hotel_db"; 
    private String dbPass = "Joelget@4"; // Use your actual password
    private String dbUser = "root";

    // --- NEW: Method to find a specific booking for editing ---
    public Booking getBookingById(int id) {
        Booking b = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM bookings WHERE id = ?");
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    b = new Booking(
                        rs.getInt("id"), 
                        rs.getString("user_email"), 
                        rs.getString("room_type"), 
                        rs.getDouble("price"), 
                        rs.getString("booking_date")
                    );
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return b;
    }

    public int getBookingCount(String email) {
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM bookings WHERE user_email = ?");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) count = rs.getInt(1);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return count;
    }

    public List<Booking> getUserBookings(String email) {
        List<Booking> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM bookings WHERE user_email = ? ORDER BY id DESC");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Booking(
                        rs.getInt("id"), 
                        rs.getString("user_email"), 
                        rs.getString("room_type"), 
                        rs.getDouble("price"), 
                        rs.getString("booking_date")
                    ));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}