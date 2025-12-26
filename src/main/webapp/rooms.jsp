<%@page import="com.hrs.hotel.model.Room"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Choose Your Experience | HRS</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; padding: 5rem; margin: 0;">
    <div style="max-width: 80rem; margin: 0 auto;">
        <header style="margin-bottom: 4rem;">
            <h1 style="font-size: 4.5rem; font-weight: 900; letter-spacing: -0.05em; line-height: 1; margin: 0;">Choose your <br><span style="color: #e2e8f0;">experience.</span></h1>
        </header>

        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1.5rem;">
            <% 
                AdminDAO dao = new AdminDAO();
                List<Room> roomList = dao.getAllRooms();
                for(Room r : roomList) { 
            %>
            <div style="border: 1px solid #f1f5f9; border-radius: 2.5rem; padding: 1.5rem; background-color: white; transition: all 0.2s;">
                <img src="<%= r.getImageUrl() %>" style="height: 12rem; width: 100%; object-fit: cover; border-radius: 1.8rem; margin-bottom: 1.5rem;">
                
                <div style="padding: 0 0.5rem;">
                    <h3 style="font-weight: 900; font-size: 1.5rem; letter-spacing: -0.05em; margin: 0;"><%= r.getName() %></h3>
                    <p style="color: #94a3b8; font-weight: 500; margin: 0.5rem 0 1.5rem 0;">$<%= r.getPrice() %> / Night</p>
                    
                    <a href="details.jsp?type=<%= r.getName() %>&price=<%= r.getPrice() %>" 
                       style="display: block; width: 100%; text-align: center; background-color: black; color: white; padding: 1rem 0; border-radius: 1rem; font-weight: 900; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.1em; text-decoration: none;">
                       Select
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>