<%@page import="com.hrs.hotel.model.User"%>
<%@page import="com.hrs.hotel.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<%
    User adminUserList = (User) session.getAttribute("user");
    if (adminUserList == null || !"admin".equals(adminUserList.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }

    AdminDAO dao = new AdminDAO();
    List<User> userList = dao.getAllUsers();
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Manage Users | Admin</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; padding: 2.5rem; margin: 0;">
    <div style="max-width: 72.5rem; margin: 0 auto;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2.5rem;">
            <h2 style="font-size: 2.25rem; font-weight: 900; text-transform: uppercase; margin: 0; letter-spacing: -0.05em;">Registered Users</h2>
            <a href="dashboard.jsp" style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; background-color: #f1f5f9; padding: 0.5rem 1.5rem; border-radius: 9999px; text-decoration: none; color: inherit;">Back to Panel</a>
        </div>

        <div style="background-color: white; border: 1px solid #f1f5f9; border-radius: 2rem; overflow: hidden; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);">
            <table style="width: 100%; border-collapse: collapse; text-align: left;">
                <thead style="background-color: #f8fafc; border-bottom: 1px solid #f1f5f9;">
                    <tr>
                        <th style="padding: 1.25rem 2rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8;">ID</th>
                        <th style="padding: 1.25rem 2rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8;">Full Name</th>
                        <th style="padding: 1.25rem 2rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8;">Email</th>
                        <th style="padding: 1.25rem 2rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; text-align: right;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(User u : userList) { %>
                    <tr style="border-bottom: 1px solid #f8fafc;">
                        <td style="padding: 1.5rem 2rem; font-weight: 700; color: #94a3b8; font-size: 0.875rem;">#<%= u.getId() %></td>
                        <td style="padding: 1.5rem 2rem; font-weight: 900; text-transform: uppercase; font-size: 0.875rem;"><%= u.getFullname() %></td>
                        <td style="padding: 1.5rem 2rem; color: #64748b; font-size: 0.875rem;"><%= u.getEmail() %></td>
                        <td style="padding: 1.5rem 2rem; text-align: right;">
                            <% if(!"admin".equals(u.getRole())) { %>
                            <form action="../DeleteUserServlet" method="POST" onsubmit="return confirm('Remove this user?')">
                                <input type="hidden" name="userId" value="<%= u.getId() %>">
                                <button type="submit" style="color: #ef4444; font-weight: 900; font-size: 10px; text-transform: uppercase; letter-spacing: 0.1em; background-color: #fef2f2; border: none; padding: 0.5rem 1rem; border-radius: 9999px; cursor: pointer;">
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