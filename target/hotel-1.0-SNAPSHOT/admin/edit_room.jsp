<%@page import="com.hrs.hotel.model.Room"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%
    // Security check
    com.hrs.hotel.model.User admin = (com.hrs.hotel.model.User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }

    // Get the room ID from the URL and fetch its data
    int roomId = Integer.parseInt(request.getParameter("id"));
    AdminDAO dao = new AdminDAO();
    Room r = dao.getRoomById(roomId);
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Edit Room | Admin</title>
</head>
<body class="bg-white font-['Inter'] p-10">
    <div class="max-w-2xl mx-auto">
        <h2 class="text-4xl font-black uppercase mb-10 tracking-tighter">Edit Room Specs</h2>

        <form action="../UpdateRoomServlet" method="POST" class="bg-slate-50 p-10 rounded-[3rem] border border-slate-100">
            <input type="hidden" name="roomId" value="<%= r.getId() %>">
            
            <div class="space-y-6">
                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Room Name</label>
                    <input type="text" name="roomName" value="<%= r.getName() %>" required
                           class="w-full p-4 rounded-2xl border-none shadow-sm font-bold">
                </div>

                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Price ($)</label>
                    <input type="number" name="price" value="<%= (int)r.getPrice() %>" required
                           class="w-full p-4 rounded-2xl border-none shadow-sm font-bold">
                </div>

                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Image URL</label>
                    <input type="text" name="imageUrl" value="<%= r.getImageUrl() %>" required
                           class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-sm">
                </div>

                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Description</label>
                    <textarea name="description" rows="3" class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-sm"><%= r.getDescription() %></textarea>
                </div>

                <button type="submit" class="w-full bg-black text-white py-6 rounded-2xl font-black uppercase tracking-widest hover:bg-blue-600 transition-colors">
                    Save Changes
                </button>
            </div>
        </form>
    </div>
</body>
</html>