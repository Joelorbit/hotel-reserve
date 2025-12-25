<%@page import="com.hrs.hotel.model.Booking"%>
<%@page import="com.hrs.hotel.dao.BookingDAO"%>
<%
    String id = request.getParameter("id");
    BookingDAO dao = new BookingDAO();
    // You'll need a getBookingById method in your DAO
    Booking b = dao.getBookingById(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Edit Booking | HRS</title>
</head>
<body class="bg-white font-['Inter']">
    <main class="max-w-2xl mx-auto p-20">
        <h2 class="text-4xl font-black mb-2">Update your <%= b.getRoomType() %></h2>
        <p class="text-slate-400 mb-10 text-sm italic">Change your floor or room preference.</p>

        <form action="UpdateBookingServlet" method="POST">
            <input type="hidden" name="bookingId" value="<%= b.getId() %>">
            
            <div class="mb-8">
                <label class="block text-[10px] font-black uppercase text-slate-400 mb-4">Choose New Floor</label>
                <select name="floor" class="w-full p-4 rounded-xl border border-slate-200 font-bold">
                    <option value="01">Floor 01</option>
                    <option value="02">Floor 02</option>
                    <option value="03">Floor 03</option>
                    <option value="04">Floor 04</option>
                </select>
            </div>

            <div class="mb-10">
                <label class="block text-[10px] font-black uppercase text-slate-400 mb-4">New Room Number</label>
                <input type="text" name="roomNo" placeholder="e.g. 104" class="w-full p-4 rounded-xl border border-slate-200 font-bold">
            </div>

            <button type="submit" class="w-full bg-black text-white py-5 rounded-2xl font-black uppercase tracking-widest hover:scale-105 transition-transform">
                Save Changes
            </button>
        </form>
    </main>
</body>
</html>