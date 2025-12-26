<%@page import="com.hrs.hotel.model.Room"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<%
    com.hrs.hotel.model.User adminCheck = (com.hrs.hotel.model.User) session.getAttribute("user");
    if (adminCheck == null || !"admin".equals(adminCheck.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }

    AdminDAO dao = new AdminDAO();
    List<Room> rooms = dao.getAllRooms();
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Manage Rooms | Admin</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; padding: 2.5rem; margin: 0;">
    <div style="max-width: 72.5rem; margin: 0 auto;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2.5rem;">
            <div>
                <h2 style="font-size: 2.25rem; font-weight: 900; text-transform: uppercase; margin: 0; letter-spacing: -0.05em;">Inventory Control</h2>
                <p style="color: #94a3b8; font-weight: 700; text-transform: uppercase; font-size: 10px; margin: 0.25rem 0 0 0;">Total Active Rooms: <%= rooms.size() %></p>
            </div>
            <div style="display: flex; gap: 0.75rem;">
                <a href="add_room.jsp" style="font-size: 0.75rem; font-weight: 900; text-transform: uppercase; background-color: black; color: white; padding: 0.75rem 2rem; border-radius: 9999px; text-decoration: none;">
                    + Add New Room
                </a>
                <a href="dashboard.jsp" style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background-color: #f1f5f9; color: inherit; padding: 0.75rem 2rem; border-radius: 9999px; text-decoration: none;">
                    Back to Admin
                </a>
            </div>
        </div>

        <div style="display: flex; flex-direction: column; gap: 1rem;">
            <% if(rooms.isEmpty()) { %>
                <div style="text-align: center; padding: 5rem; background-color: #f8fafc; border-radius: 3rem; border: 1px dashed #e2e8f0;">
                    <p style="color: #94a3b8; font-weight: 700; text-transform: uppercase; margin: 0;">No rooms found in your catalog.</p>
                </div>
            <% } %>

            <% for(Room r : rooms) { %>
            <div style="display: flex; align-items: center; justify-content: space-between; background-color: white; padding: 1.5rem; border-radius: 2.5rem; border: 1px solid #f1f5f9; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);">
                <div style="display: flex; align-items: center; gap: 1.5rem;">
                    <img src="<%= r.getImageUrl() %>" style="height: 6rem; width: 9rem; object-fit: cover; border-radius: 1rem; box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06); background-color: #f1f5f9;">
                    <div>
                        <h3 style="font-weight: 900; text-transform: uppercase; font-size: 1.25rem; margin: 0; letter-spacing: -0.05em;"><%= r.getName() %></h3>
                        <p style="color: #94a3b8; font-weight: 700; margin: 0.25rem 0 0 0;">$<%= r.getPrice() %> <span style="font-size: 10px; text-transform: uppercase;">/ Night</span></p>
                    </div>
                </div>
                
                <div style="display: flex; gap: 0.75rem;">
                    <a href="edit_room.jsp?id=<%= r.getId() %>" 
                       style="background-color: #eff6ff; color: #2563eb; padding: 1rem 2rem; border-radius: 1rem; font-weight: 900; font-size: 10px; text-transform: uppercase; text-decoration: none;">
                       Edit Specs
                    </a>

                    <form action="../DeleteRoomServlet" method="POST" onsubmit="return confirm('Permanently remove this room?')">
                        <input type="hidden" name="roomId" value="<%= r.getId() %>">
                        <button type="submit" style="background-color: #fef2f2; color: #ef4444; padding: 1rem 2rem; border-radius: 1rem; font-weight: 900; font-size: 10px; text-transform: uppercase; border: none; cursor: pointer;">
                            Remove
                        </button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>