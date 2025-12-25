package com.hrs.hotel.dao;

import com.hrs.hotel.model.Room;
import com.hrs.hotel.model.User;
import com.hrs.hotel.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // --- USER MANAGEMENT ---
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY id DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // --- ROOM MANAGEMENT ---

    // Fetch all rooms for User and Admin views
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM room_catalog ORDER BY id DESC"; 
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("room_name"));
                r.setPrice(rs.getDouble("price"));
                r.setImageUrl(rs.getString("image_url"));
                r.setDescription(rs.getString("description"));
                rooms.add(r);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return rooms;
    }

    // NEW: Get a single room's details (Used for the Edit Form)
    public Room getRoomById(int id) {
        String sql = "SELECT * FROM room_catalog WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("room_name"));
                r.setPrice(rs.getDouble("price"));
                r.setImageUrl(rs.getString("image_url"));
                r.setDescription(rs.getString("description"));
                return r;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    // NEW: Delete a room from catalog
    public boolean deleteRoom(int roomId) {
        String sql = "DELETE FROM room_catalog WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, roomId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    // NEW: Update room information
    public boolean updateRoom(Room r) {
        String sql = "UPDATE room_catalog SET room_name=?, price=?, image_url=?, description=? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, r.getName());
            ps.setDouble(2, r.getPrice());
            ps.setString(3, r.getImageUrl());
            ps.setString(4, r.getDescription());
            ps.setInt(5, r.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}