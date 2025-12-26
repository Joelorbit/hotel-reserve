<%@page import="com.hrs.hotel.model.User"%>
<%
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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Admin Panel | HRS</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; margin: 0;">

    <nav style="padding: 2rem; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #f8fafc;">
        <div style="display: flex; align-items: center; gap: 0.75rem;">
            <div style="height: 2.5rem; width: 2.5rem; background-color: #dc2626; border-radius: 0.5rem; display: flex; align-items: center; justify-content: center; color: white; font-weight: 900; font-style: italic; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);">A</div>
            <span style="font-weight: 900; font-size: 1.25rem; letter-spacing: -0.05em; text-transform: uppercase;">Admin Panel.</span>
        </div>
        <div style="display: flex; align-items: center; gap: 1.5rem;">
            <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #94a3b8;">Master: <%= user.getFullname() %></span>
            <a href="../LogoutServlet" style="background-color: black; color: white; padding: 0.5rem 2rem; border-radius: 9999px; font-weight: 900; font-size: 0.75rem; text-decoration: none;">LOGOUT</a>
        </div>
    </nav>

    <main style="max-width: 80rem; margin: 0 auto; padding: 2.5rem;">
        <h2 style="font-size: 3rem; line-height: 1; font-weight: 900; margin-bottom: 3rem; letter-spacing: -0.05em; text-transform: uppercase;">Management Center</h2>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">
            <div style="background-color: #020617; border-radius: 3rem; padding: 3rem; color: white; transition: transform 0.2s;">
                <div style="height: 4rem; width: 4rem; background-color: rgba(255,255,255,0.1); border-radius: 1rem; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; margin-bottom: 1.5rem;">
                    <i class="fas fa-bed"></i>
                </div>
                <h3 style="font-size: 1.875rem; font-weight: 900; text-transform: uppercase; margin-bottom: 0.5rem;">Manage Rooms</h3>
                <p style="color: #94a3b8; margin-bottom: 2rem;">Add new luxury suites or update pricing for current rooms.</p>
                <a href="manage_rooms.jsp" style="display: inline-block; background-color: white; color: black; padding: 1rem 2.5rem; border-radius: 9999px; font-weight: 900; font-size: 0.75rem; text-transform: uppercase; text-decoration: none; transition: background-color 0.2s;">
                    Enter "Boom" Mode
                </a>
            </div>

            <div style="background-color: #f8fafc; border: 1px solid #f1f5f9; border-radius: 3rem; padding: 3rem; transition: all 0.2s;">
                <div style="height: 4rem; width: 4rem; background-color: black; border-radius: 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem; margin-bottom: 1.5rem;">
                    <i class="fas fa-users"></i>
                </div>
                <h3 style="font-size: 1.875rem; font-weight: 900; text-transform: uppercase; margin-bottom: 0.5rem;">User Control</h3>
                <p style="color: #64748b; margin-bottom: 2rem;">View registered customers and manage account permissions.</p>
                <a href="manage_users.jsp" style="display: inline-block; background-color: black; color: white; padding: 1rem 2.5rem; border-radius: 9999px; font-weight: 900; font-size: 0.75rem; text-transform: uppercase; text-decoration: none;">
                    View All Users
                </a>
            </div>
        </div>
    </main>
</body>
</html>