<%@page import="com.hrs.hotel.model.Room"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%
    com.hrs.hotel.model.User adminUser = (com.hrs.hotel.model.User) session.getAttribute("user");
    if (adminUser == null || !"admin".equals(adminUser.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }

    int roomId = Integer.parseInt(request.getParameter("id"));
    AdminDAO dao = new AdminDAO();
    Room r = dao.getRoomById(roomId);
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Edit Room | Admin</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; padding: 2.5rem;">
    <div style="max-width: 42rem; margin: 0 auto;">
        <h2 style="font-size: 2.25rem; font-weight: 900; text-transform: uppercase; margin-bottom: 2.5rem; letter-spacing: -0.05em;">Edit Room Specs</h2>

        <form action="../UpdateRoomServlet" method="POST" style="background-color: #f8fafc; padding: 2.5rem; border-radius: 3rem; border: 1px solid #f1f5f9;">
            <input type="hidden" name="roomId" value="<%= r.getId() %>">
            
            <div style="display: flex; flex-direction: column; gap: 1.5rem;">
                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Room Name</label>
                    <input type="text" name="roomName" value="<%= r.getName() %>" required
                           style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; box-sizing: border-box;">
                </div>

                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Price ($)</label>
                    <input type="number" name="price" value="<%= (int)r.getPrice() %>" required
                           style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; box-sizing: border-box;">
                </div>

                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Image URL</label>
                    <input type="text" name="imageUrl" value="<%= r.getImageUrl() %>" required
                           style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 0.875rem; box-sizing: border-box;">
                </div>

                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Description</label>
                    <textarea name="description" rows="3" style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 0.875rem; box-sizing: border-box;"><%= r.getDescription() %></textarea>
                </div>

                <button type="submit" style="width: 100%; background-color: black; color: white; padding: 1.5rem 0; border-radius: 1rem; border: none; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em; cursor: pointer; transition: background-color 0.2s;">
                    Save Changes
                </button>
            </div>
        </form>
    </div>
</body>
</html>