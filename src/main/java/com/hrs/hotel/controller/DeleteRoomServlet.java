package com.hrs.hotel.controller;

import com.hrs.hotel.dao.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        AdminDAO dao = new AdminDAO();
        
        if (dao.deleteRoom(roomId)) {
            response.sendRedirect("admin/manage_rooms.jsp?status=deleted");
        } else {
            response.sendRedirect("admin/manage_rooms.jsp?error=1");
        }
    }
}