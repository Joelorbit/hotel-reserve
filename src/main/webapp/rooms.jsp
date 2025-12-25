<%@page import="com.hrs.hotel.model.Room"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Choose Your Experience | HRS</title>
</head>
<body class="bg-white font-['Inter'] p-8 lg:p-20">
    <div class="max-w-7xl mx-auto">
        <header class="mb-16">
            <h1 class="text-7xl font-black tracking-tighter">Choose your <br><span class="text-slate-200">experience.</span></h1>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
            <% 
                // FETCHING DYNAMIC DATA FROM DATABASE
                AdminDAO dao = new AdminDAO();
                List<Room> roomList = dao.getAllRooms();
                
                for(Room r : roomList) { 
            %>
            <div class="group border border-slate-100 rounded-[2.5rem] p-6 hover:shadow-2xl transition-all bg-white">
                <img src="<%= r.getImageUrl() %>" class="h-48 w-full object-cover rounded-[1.8rem] mb-6">
                
                <div class="px-2">
                    <h3 class="font-black text-2xl tracking-tighter"><%= r.getName() %></h3>
                    <p class="text-slate-400 font-medium mb-6">$<%= r.getPrice() %> / Night</p>
                    
                    <a href="details.jsp?type=<%= r.getName() %>&price=<%= r.getPrice() %>" 
                       class="block w-full text-center bg-black text-white py-4 rounded-2xl font-black text-xs uppercase tracking-widest hover:scale-105 transition-transform">
                       Select
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>