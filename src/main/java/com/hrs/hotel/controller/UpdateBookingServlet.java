package com.hrs.hotel.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("bookingId");
        String floor = request.getParameter("floor");
        String roomNo = request.getParameter("roomNo");
        
        // Match the format used in your original booking
        String newRoomDetail = "Suite (Floor " + floor + ", Room " + roomNo + ")";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "Joelget@4")) {
                String sql = "UPDATE bookings SET room_type = ? WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, newRoomDetail);
                ps.setInt(2, Integer.parseInt(id));
                
                ps.executeUpdate();
                response.sendRedirect("dashboard.jsp?status=updated"); // Redirect to updated dashboard
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=update_failed");
        }
    }
}