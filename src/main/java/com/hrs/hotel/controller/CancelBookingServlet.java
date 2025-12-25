package com.hrs.hotel.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");

        // Database Credentials - Must match your BookingDAO exactly
        String dbUrl = "jdbc:mysql://localhost:3306/hotel_db";
        String dbUser = "root";
        String dbPass = "Joelget@4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                // Delete the specific booking by its ID
                PreparedStatement ps = conn.prepareStatement("DELETE FROM bookings WHERE id = ?");
                ps.setInt(1, Integer.parseInt(bookingId));
                
                ps.executeUpdate();
            }
            
            // Redirect back to dashboard to refresh the list and count
            response.sendRedirect("dashboard.jsp?status=cancelled");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=cancel_failed");
        }
    }
}