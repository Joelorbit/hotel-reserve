package com.hrs.hotel.controller;

import com.hrs.hotel.model.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 1. Ensure user is logged in
        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        // 2. Extract parameters from details.jsp
        String roomType = request.getParameter("roomType");
        String floor = request.getParameter("floor");
        String roomNo = request.getParameter("roomNumber");
        String priceStr = request.getParameter("price");

        try {
            // 3. MySQL Connection (Double check your credentials!)
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "Joelget@4");
            
            // 4. Combine info for the database record
            String finalDescription = roomType + " (Floor " + floor + ", Room " + roomNo + ")";
            double finalPrice = Double.parseDouble(priceStr);

            // 5. Insert Query
            PreparedStatement ps = conn.prepareStatement("INSERT INTO bookings (user_email, room_type, price) VALUES (?, ?, ?)");
            ps.setString(1, user.getEmail());
            ps.setString(2, finalDescription);
            ps.setDouble(3, finalPrice);
            
            ps.executeUpdate();
            conn.close();
            
            // 6. SUCCESS: Redirect to Dashboard to see the +1 count
            response.sendRedirect("dashboard.jsp?status=success");
            
        } catch (Exception e) {
            // LOG THE ERROR: Check your NetBeans "Output" window for this!
            e.printStackTrace(); 
            // FAIL: If something breaks, it lands back on rooms.jsp
            response.sendRedirect("rooms.jsp?error=database");
        }
    }
}