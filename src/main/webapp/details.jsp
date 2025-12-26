<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type");
    String price = request.getParameter("price");
    if (type == null || price == null) {
        response.sendRedirect("rooms.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">
    <title>Configure Your Stay | HRS</title>
</head>
<body style="background-color: #ffffff; font-family: 'Inter', sans-serif; display: flex; align-items: center; justify-content: center; min-height: screen; margin: 0; padding: 40px 0;">

    <div style="max-width: 400px; width: 100%; padding: 40px; border: 1px solid #f1f5f9; border-radius: 48px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);">
        <div style="text-align: center; margin-bottom: 40px;">
            <div style="height: 48px; width: 48px; background-color: #000; border-radius: 16px; display: flex; align-items: center; justify-content: center; color: #fff; font-weight: bold; font-style: italic; margin: 0 auto 24px auto;">H</div>
            <h1 style="font-size: 36px; font-weight: 900; letter-spacing: -0.05em; margin: 0;">Setting up your</h1>
            <h2 style="font-size: 30px; font-weight: 900; color: #cbd5e1; text-transform: uppercase; margin: 0;"><%= type %></h2>
            <p style="color: #94a3b8; margin-top: 8px; font-weight: bold; font-style: italic;">Rate: $<%= price %> per night</p>
        </div>

        <form action="BookRoomServlet" method="POST">
            <input type="hidden" name="roomType" value="<%= type %>">
            <input type="hidden" name="price" value="<%= price %>">
            <input type="hidden" name="floor" id="selectedFloor" value="01">

            <div style="margin-bottom: 32px;">
                <label style="font-size: 10px; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em; color: #94a3b8; display: block; margin-bottom: 16px;">Choose Floor</label>
                <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 8px;">
                    <% for(int i=1; i<=4; i++) { 
                        String f = "0" + i;
                        String activeStyle = i == 1 ? "border: 2px solid #000; color: #000; background-color: #f8fafc;" : "border: 2px solid #f1f5f9; color: #cbd5e1;";
                    %>
                        <div id="floorBox<%= f %>" onclick="updateFloor('<%= f %>')" 
                             style="padding: 12px 0; border-radius: 12px; text-align: center; font-weight: 900; cursor: pointer; transition: all 0.2s; <%= activeStyle %>">
                            <%= f %>
                        </div>
                    <% } %>
                </div>
            </div>

            <div style="margin-bottom: 32px;">
                <label style="font-size: 10px; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em; color: #94a3b8; display: block; margin-bottom: 16px;">Select Room Number</label>
                <select name="roomNumber" style="width: 100%; background-color: #f8fafc; border: none; padding: 20px; border-radius: 16px; font-weight: 900; outline: none; appearance: none;">
                    <option value="101">Room 101</option>
                    <option value="102">Room 102</option>
                    <option value="103">Room 103</option>
                    <option value="104">Room 104</option>
                </select>
            </div>

            <button type="submit" style="width: 100%; background-color: #000; color: #fff; padding: 24px 0; border: none; border-radius: 24px; font-weight: 900; font-size: 14px; text-transform: uppercase; letter-spacing: 0.1em; cursor: pointer; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);">
                Confirm Booking
            </button>
        </form>
    </div>

    <script>
        function updateFloor(floorVal) {
            // 1. Update the hidden input value
            document.getElementById('selectedFloor').value = floorVal;

            // 2. Reset all boxes and highlight the selected one
            for(let i=1; i<=4; i++) {
                let id = "0" + i;
                let box = document.getElementById("floorBox" + id);
                if(id === floorVal) {
                    box.style.border = "2px solid #000";
                    box.style.color = "#000";
                    box.style.backgroundColor = "#f8fafc";
                } else {
                    box.style.border = "2px solid #f1f5f9";
                    box.style.color = "#cbd5e1";
                    box.style.backgroundColor = "transparent";
                }
            }
        }
    </script>
</body>
</html>