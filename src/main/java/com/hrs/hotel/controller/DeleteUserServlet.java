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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String userId = request.getParameter("userId");

        try (Connection conn = DatabaseConnection.getConnection()) {
            // This deletes the user. Because of our SQL 'ON DELETE CASCADE', 
            // it will also delete all their bookings automatically.
            String sql = "DELETE FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(userId));
            
            ps.executeUpdate();
            // Redirect back to the user list with a status message
            response.sendRedirect("admin/manage_users.jsp?status=deleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/manage_users.jsp?error=1");
        }
    }
}