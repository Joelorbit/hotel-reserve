<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get data from the URL parameters
    String type = request.getParameter("type");
    String price = request.getParameter("price");
    
    // Safety check: If someone lands here without picking a room, send them back
    if (type == null || price == null) {
        response.sendRedirect("rooms.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">
    <title>Configure Your Stay | HRS</title>
</head>
<body class="bg-white font-['Inter'] flex items-center justify-center min-h-screen">

    <div class="max-w-md w-full p-10 bg-white border border-slate-100 rounded-[3rem] shadow-sm">
        <div class="mb-10 text-center">
            <div class="h-12 w-12 bg-black rounded-2xl flex items-center justify-center text-white font-bold italic mx-auto mb-6">H</div>
            <h1 class="text-4xl font-black tracking-tighter">Setting up your</h1>
            <h2 class="text-3xl font-black text-slate-300 uppercase"><%= type %></h2>
            <p class="text-slate-400 mt-2 font-bold italic">Rate: $<%= price %> per night</p>
        </div>

        <form action="BookRoomServlet" method="POST" class="space-y-8">
            <input type="hidden" name="roomType" value="<%= type %>">
            <input type="hidden" name="price" value="<%= price %>">

            <div>
                <label class="text-[10px] font-black uppercase tracking-widest text-slate-400 block mb-4">Choose Floor</label>
                <div class="grid grid-cols-4 gap-2">
                    <label class="cursor-pointer">
                        <input type="radio" name="floor" value="01" class="peer sr-only" checked>
                        <div class="py-3 border-2 border-slate-100 rounded-xl text-center font-black text-slate-300 peer-checked:border-black peer-checked:text-black transition-all">01</div>
                    </label>
                    <label class="cursor-pointer">
                        <input type="radio" name="floor" value="02" class="peer sr-only">
                        <div class="py-3 border-2 border-slate-100 rounded-xl text-center font-black text-slate-300 peer-checked:border-black peer-checked:text-black transition-all">02</div>
                    </label>
                    <label class="cursor-pointer">
                        <input type="radio" name="floor" value="03" class="peer sr-only">
                        <div class="py-3 border-2 border-slate-100 rounded-xl text-center font-black text-slate-300 peer-checked:border-black peer-checked:text-black transition-all">03</div>
                    </label>
                    <label class="cursor-pointer">
                        <input type="radio" name="floor" value="04" class="peer sr-only">
                        <div class="py-3 border-2 border-slate-100 rounded-xl text-center font-black text-slate-300 peer-checked:border-black peer-checked:text-black transition-all">04</div>
                    </label>
                </div>
            </div>

            <div>
                <label class="text-[10px] font-black uppercase tracking-widest text-slate-400 block mb-4">Select Room Number</label>
                <select name="roomNumber" class="w-full bg-slate-50 border-none p-5 rounded-2xl font-black focus:ring-2 ring-black outline-none transition-all appearance-none">
                    <option value="101">Room 101</option>
                    <option value="102">Room 102</option>
                    <option value="103">Room 103</option>
                    <option value="104">Room 104</option>
                </select>
            </div>

            <button type="submit" class="w-full bg-black text-white py-6 rounded-3xl font-black text-sm uppercase tracking-widest hover:scale-105 transition-transform shadow-xl">
                Confirm Booking
            </button>
        </form>
    </div>

</body>
</html>