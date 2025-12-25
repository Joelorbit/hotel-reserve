package com.hrs.hotel.controller;

import com.hrs.hotel.util.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("roomName");
        String price = request.getParameter("price");
        String image = request.getParameter("imageUrl");
        String desc = request.getParameter("description");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO room_catalog (room_name, price, image_url, description) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, Double.parseDouble(price));
            ps.setString(3, image);
            ps.setString(4, desc);
            
            ps.executeUpdate();
            // Go back to admin dashboard with success status
            response.sendRedirect("admin/dashboard.jsp?status=room_added");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/add_room.jsp?error=failed");
        }
    }
}