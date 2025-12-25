<%@page import="com.hrs.hotel.model.User"%>
<%
    // Security Gate
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Add New Room | Admin</title>
</head>
<body class="bg-white font-['Inter'] p-10">
    <div class="max-w-2xl mx-auto">
        <div class="flex items-center gap-4 mb-10">
            <a href="dashboard.jsp" class="h-10 w-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-black hover:text-white transition-all">
                ?
            </a>
            <h2 class="text-4xl font-black uppercase tracking-tighter">Publish New Room</h2>
        </div>

        <form action="../AddRoomServlet" method="POST" class="bg-slate-50 p-12 rounded-[3rem] border border-slate-100 shadow-xl">
            <div class="space-y-6">
                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Room Name</label>
                    <input type="text" name="roomName" placeholder="e.g. Presidency Suite" required
                           class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-lg focus:ring-2 focus:ring-black">
                </div>

                <div class="grid grid-cols-2 gap-6">
                    <div>
                        <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Price Per Night ($)</label>
                        <input type="number" name="price" placeholder="1500" required
                               class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-lg focus:ring-2 focus:ring-black">
                    </div>
                    <div>
                        <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Category</label>
                        <select class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-lg focus:ring-2 focus:ring-black">
                            <option>High Official</option>
                            <option>Luxury</option>
                            <option>Standard</option>
                        </select>
                    </div>
                </div>

                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Image URL</label>
                    <input type="text" name="imageUrl" placeholder="Paste image link here..." required
                           class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-sm focus:ring-2 focus:ring-black">
                </div>

                <div>
                    <label class="block text-[10px] font-black uppercase text-slate-400 mb-2">Description</label>
                    <textarea name="description" rows="3" placeholder="Describe the room features..."
                              class="w-full p-4 rounded-2xl border-none shadow-sm font-bold text-sm focus:ring-2 focus:ring-black"></textarea>
                </div>

                <button type="submit" class="w-full bg-black text-white py-6 rounded-2xl font-black uppercase tracking-widest hover:scale-[1.02] transition-all shadow-2xl">
                    Publish Room Now
                </button>
            </div>
        </form>
    </div>
</body>
</html>