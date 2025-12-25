<%@page import="com.hrs.hotel.model.Room"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<%
    // Security check
    com.hrs.hotel.model.User admin = (com.hrs.hotel.model.User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }

    AdminDAO dao = new AdminDAO();
    List<Room> rooms = dao.getAllRooms();
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Manage Rooms | Admin</title>
</head>
<body class="bg-white font-['Inter'] p-10">
    <div class="max-w-6xl mx-auto">
        <div class="flex justify-between items-center mb-10">
            <div>
                <h2 class="text-4xl font-black uppercase tracking-tighter">Inventory Control</h2>
                <p class="text-slate-400 font-bold uppercase text-[10px]">Total Active Rooms: <%= rooms.size() %></p>
            </div>
            <div class="flex gap-3">
                <a href="add_room.jsp" class="text-xs font-black uppercase bg-black text-white px-8 py-3 rounded-full hover:bg-red-600 transition-colors">
                    + Add New Room
                </a>
                <a href="dashboard_admin.jsp" class="text-xs font-bold uppercase bg-slate-100 px-8 py-3 rounded-full hover:bg-slate-200">
                    Back to Admin
                </a>
            </div>
        </div>

        <div class="grid grid-cols-1 gap-4">
            <% if(rooms.isEmpty()) { %>
                <div class="text-center p-20 bg-slate-50 rounded-[3rem] border border-dashed border-slate-200">
                    <p class="text-slate-400 font-bold uppercase">No rooms found in your catalog.</p>
                </div>
            <% } %>

            <% for(Room r : rooms) { %>
            <div class="flex items-center justify-between bg-white p-6 rounded-[2.5rem] border border-slate-100 shadow-sm hover:shadow-md transition-all">
                <div class="flex items-center gap-6">
                    <img src="<%= r.getImageUrl() %>" class="h-24 w-36 object-cover rounded-2xl shadow-inner bg-slate-100">
                    <div>
                        <h3 class="font-black uppercase text-xl tracking-tighter"><%= r.getName() %></h3>
                        <p class="text-slate-400 font-bold">$<%= r.getPrice() %> <span class="text-[10px] uppercase">/ Night</span></p>
                    </div>
                </div>
                
                <div class="flex gap-3">
                    <a href="edit_room.jsp?id=<%= r.getId() %>" 
                       class="bg-blue-50 text-blue-600 px-8 py-4 rounded-2xl font-black text-[10px] uppercase hover:bg-blue-600 hover:text-white transition-all">
                       Edit Specs
                    </a>

                    <form action="../DeleteRoomServlet" method="POST" onsubmit="return confirm('Permanently remove this room from your catalog?')">
                        <input type="hidden" name="roomId" value="<%= r.getId() %>">
                        <button type="submit" class="bg-red-50 text-red-500 px-8 py-4 rounded-2xl font-black text-[10px] uppercase hover:bg-red-500 hover:text-white transition-all">
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