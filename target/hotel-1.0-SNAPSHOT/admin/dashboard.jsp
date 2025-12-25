<%@page import="com.hrs.hotel.model.User"%>
<%
    // SECURITY GATE: Only let Admins in
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) { 
        response.sendRedirect("../login.html"); 
        return; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Admin Panel | HRS</title>
</head>
<body class="bg-white font-['Inter']">

    <nav class="p-8 flex justify-between items-center border-b border-slate-50">
        <div class="flex items-center gap-3">
            <div class="h-10 w-10 bg-red-600 rounded-lg flex items-center justify-center text-white font-black italic shadow-lg">A</div>
            <span class="font-black text-xl tracking-tighter uppercase">Admin Panel.</span>
        </div>
        <div class="flex items-center gap-6">
            <span class="text-xs font-bold uppercase text-slate-400">Master: <%= user.getFullname() %></span>
            <a href="../LogoutServlet" class="bg-black text-white px-8 py-2 rounded-full font-black text-xs">LOGOUT</a>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto p-10">
        <h2 class="text-5xl font-black mb-12 tracking-tighter uppercase">Management Center</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div class="bg-slate-950 rounded-[3rem] p-12 text-white hover:scale-[1.01] transition-transform">
                <div class="h-16 w-16 bg-white/10 rounded-2xl flex items-center justify-center text-2xl mb-6">
                    <i class="fas fa-bed"></i>
                </div>
                <h3 class="text-3xl font-black uppercase mb-2">Manage Rooms</h3>
                <p class="text-slate-400 mb-8">Add new luxury suites or update pricing for current rooms.</p>
                <a href="manage_rooms.jsp" class="inline-block bg-white text-black px-10 py-4 rounded-full font-black text-xs uppercase hover:bg-red-600 hover:text-white transition-colors">
                    Enter "Boom" Mode
                </a>
            </div>

            <div class="bg-slate-50 border border-slate-100 rounded-[3rem] p-12 hover:bg-white hover:shadow-2xl transition-all">
                <div class="h-16 w-16 bg-black rounded-2xl flex items-center justify-center text-white text-2xl mb-6">
                    <i class="fas fa-users"></i>
                </div>
                <h3 class="text-3xl font-black uppercase mb-2">User Control</h3>
                <p class="text-slate-500 mb-8">View registered customers and manage account permissions.</p>
                <a href="manage_users.jsp" class="inline-block bg-black text-white px-10 py-4 rounded-full font-black text-xs uppercase">
                    View All Users
                </a>
            </div>
        </div>
    </main>
</body>
</html>