package com.hrs.hotel.dao;

import com.hrs.hotel.model.User;
import com.hrs.hotel.util.DatabaseConnection;
import java.sql.*;

public class UserDAO {
    
    // Updated to handle the new role column
    public boolean registerUser(User user) {
        // We include 'role' here, though the DB default is 'customer'
        String sql = "INSERT INTO users (fullname, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, user.getFullname());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            // Set default role if not provided
            pst.setString(4, user.getRole() != null ? user.getRole() : "customer");
            
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                User user = new User();
                // Fetching all necessary data including ID and Role
                user.setId(rs.getInt("id")); 
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role")); // <--- This allows Admin access
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}