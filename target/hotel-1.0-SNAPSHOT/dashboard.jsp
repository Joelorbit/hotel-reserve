<%@page import="com.hrs.hotel.model.User"%>
<%@page import="com.hrs.hotel.model.Booking"%>
<%@page import="com.hrs.hotel.dao.BookingDAO"%>
<%@page import="java.util.List"%>
<%
    // 1. Session Security Check
    User user = (User) session.getAttribute("user");
    if (user == null) { 
        response.sendRedirect("login.html"); 
        return; 
    }

    // 2. Fetch Data from SQL (CRUD: Read)
    BookingDAO dao = new BookingDAO();
    int totalBookings = dao.getBookingCount(user.getEmail());
    List<Booking> myReservations = dao.getUserBookings(user.getEmail());
    
    // Status message handling
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Dashboard | HRS</title>
</head>
<body class="bg-white font-['Inter']">

    <% if("success".equals(status)) { %>
        <div class="fixed top-5 left-1/2 -translate-x-1/2 bg-green-500 text-white px-8 py-3 rounded-full font-bold shadow-xl z-50 flex items-center gap-2">
            <i class="fas fa-check-circle"></i> Reservation Successful!
        </div>
    <% } else if("updated".equals(status)) { %>
        <div class="fixed top-5 left-1/2 -translate-x-1/2 bg-blue-600 text-white px-8 py-3 rounded-full font-bold shadow-xl z-50 flex items-center gap-2">
            <i class="fas fa-check-circle"></i> Booking Updated!
        </div>
    <% } else if("cancelled".equals(status)) { %>
        <div class="fixed top-5 left-1/2 -translate-x-1/2 bg-black text-white px-8 py-3 rounded-full font-bold shadow-xl z-50">
            Booking Cancelled.
        </div>
    <% } %>

    <nav class="p-8 flex justify-between items-center border-b border-slate-50">
        <div class="flex items-center gap-3">
            <div class="h-10 w-10 bg-black rounded-lg flex items-center justify-center text-white font-black italic">H</div>
            <span class="font-black text-xl tracking-tighter uppercase">Dashboard.</span>
        </div>
        <div class="flex items-center gap-6 text-sm">
            <span class="font-bold uppercase tracking-tighter text-slate-400 italic">Active Member: <%= user.getFullname() %></span>
            <a href="LogoutServlet" class="bg-black text-white px-8 py-2 rounded-full font-black text-xs hover:bg-slate-800 transition-all">LOGOUT</a>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto p-10">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
            
            <div class="md:col-span-2 bg-slate-950 rounded-[3.5rem] p-16 text-white relative overflow-hidden">
                <h2 class="text-6xl font-black leading-none uppercase">Welcome home, <br><span class="text-slate-500"><%= user.getFullname() %></span></h2>
                <p class="mt-6 text-slate-400 text-lg">Your next sanctuary is just one click away.</p>
                <a href="rooms.jsp" class="bg-white text-black px-12 py-5 rounded-full font-black text-sm mt-10 inline-block hover:scale-110 transition-transform">New Reservation</a>
                <div class="absolute -right-20 -bottom-20 text-[250px] font-black text-white/5 italic select-none">HRS</div>
            </div>

            <div class="bg-slate-50 rounded-[3.5rem] p-12 flex flex-col justify-between border border-slate-100 hover:bg-white transition-all group">
                <div class="h-14 w-14 bg-black rounded-2xl flex items-center justify-center text-white text-xl shadow-lg">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-[0.3em]">Total Bookings</p>
                    <h3 class="text-7xl font-black mt-2 tracking-tighter"><%= totalBookings %></h3>
                </div>
            </div>
        </div>

        <h3 class="text-3xl font-black mb-8 tracking-tighter">My Active Reservations</h3>
        <div class="bg-white border border-slate-100 rounded-[2.5rem] overflow-hidden shadow-sm">
            <table class="w-full text-left">
                <thead class="bg-slate-50/50 border-b border-slate-100">
                    <tr>
                        <th class="px-10 py-6 text-[10px] font-black uppercase text-slate-400 tracking-widest">Suite & Room Number</th>
                        <th class="px-10 py-6 text-[10px] font-black uppercase text-slate-400 tracking-widest">Rate</th>
                        <th class="px-10 py-6 text-[10px] font-black uppercase text-slate-400 tracking-widest text-right">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-50">
                    <% if(myReservations.isEmpty()) { %>
                        <tr><td colspan="3" class="p-20 text-center text-slate-300 font-bold italic">No active reservations found.</td></tr>
                    <% } else { 
                        for(Booking b : myReservations) { %>
                        <tr class="hover:bg-slate-50/30 transition-colors">
                            <td class="px-10 py-8 font-black text-xl tracking-tight uppercase">
                                <%= b.getRoomType() %>
                            </td>
                            <td class="px-10 py-8 text-slate-500 font-bold">$<%= b.getPrice() %></td>
                            <td class="px-10 py-8 text-right flex gap-6 justify-end items-center">
                                
                                <a href="editdetails.jsp?id=<%= b.getId() %>" class="text-slate-400 font-black text-[10px] hover:text-black uppercase tracking-widest">
                                    Edit Details
                                </a>

                                <form action="CancelBookingServlet" method="POST" onsubmit="return confirm('Cancel this stay?');">
                                    <input type="hidden" name="bookingId" value="<%= b.getId() %>">
                                    <button type="submit" class="text-red-500 font-black text-[10px] hover:underline uppercase tracking-widest bg-red-50 px-5 py-2.5 rounded-full transition-all hover:bg-red-500 hover:text-white">
                                        Cancel Stay
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>