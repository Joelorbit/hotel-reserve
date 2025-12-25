package com.hrs.hotel.dao;

import com.hrs.hotel.model.User;
import com.hrs.hotel.util.DatabaseConnection;
import java.sql.*;

public class UserDAO {
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (fullname, email, password) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, user.getFullname());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
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
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}