package com.hrs.hotel.controller;

import com.hrs.hotel.dao.AdminDAO;
import com.hrs.hotel.model.Room;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Collect data from the edit form
        int id = Integer.parseInt(request.getParameter("roomId"));
        String name = request.getParameter("roomName");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");
        String desc = request.getParameter("description");

        // 2. Create Room object
        Room r = new Room();
        r.setId(id);
        r.setName(name);
        r.setPrice(price);
        r.setImageUrl(imageUrl);
        r.setDescription(desc);

        // 3. Update database via DAO
        AdminDAO dao = new AdminDAO();
        if (dao.updateRoom(r)) {
            response.sendRedirect("admin/manage_rooms.jsp?status=updated");
        } else {
            response.sendRedirect("admin/manage_rooms.jsp?error=update_failed");
        }
    }
}