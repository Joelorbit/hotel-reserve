<%@page import="com.hrs.hotel.model.User"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<%
    // Security check
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }

    // We will create this AdminDAO in the next part of this step
    AdminDAO dao = new AdminDAO();
    List<User> userList = dao.getAllUsers();
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Manage Users | Admin</title>
</head>
<body class="bg-white font-['Inter'] p-10">
    <div class="max-w-6xl mx-auto">
        <div class="flex justify-between items-center mb-10">
            <h2 class="text-4xl font-black uppercase tracking-tighter">Registered Users</h2>
            <a href="dashboard.jsp" class="text-xs font-bold uppercase bg-slate-100 px-6 py-2 rounded-full">Back to Panel</a>
        </div>

        <div class="bg-white border border-slate-100 rounded-[2rem] overflow-hidden shadow-sm">
            <table class="w-full text-left">
                <thead class="bg-slate-50 border-b border-slate-100">
                    <tr>
                        <th class="px-8 py-5 text-[10px] font-black uppercase text-slate-400">ID</th>
                        <th class="px-8 py-5 text-[10px] font-black uppercase text-slate-400">Full Name</th>
                        <th class="px-8 py-5 text-[10px] font-black uppercase text-slate-400">Email</th>
                        <th class="px-8 py-5 text-[10px] font-black uppercase text-slate-400 text-right">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-50">
                    <% for(User u : userList) { %>
                    <tr class="hover:bg-slate-50/50">
                        <td class="px-8 py-6 font-bold text-slate-400 text-sm">#<%= u.getId() %></td>
                        <td class="px-8 py-6 font-black uppercase text-sm"><%= u.getFullname() %></td>
                        <td class="px-8 py-6 text-slate-500 text-sm"><%= u.getEmail() %></td>
                        <td class="px-8 py-6 text-right">
                            <% if(!"admin".equals(u.getRole())) { %>
                            <form action="../DeleteUserServlet" method="POST" onsubmit="return confirm('Remove this user?')">
                                <input type="hidden" name="userId" value="<%= u.getId() %>">
                                <button type="submit" class="text-red-500 font-black text-[10px] uppercase tracking-widest bg-red-50 px-4 py-2 rounded-full hover:bg-red-500 hover:text-white transition-all">
                                    Delete
                                </button>
                            </form>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>