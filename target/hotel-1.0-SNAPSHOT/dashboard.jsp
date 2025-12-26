<%@page import="com.hrs.hotel.model.User"%>
<%@page import="com.hrs.hotel.model.Booking"%>
<%@page import="com.hrs.hotel.dao.BookingDAO"%>
<%@page import="java.util.List"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) { 
        response.sendRedirect("login.html"); 
        return; 
    }
    BookingDAO dao = new BookingDAO();
    int totalBookings = dao.getBookingCount(user.getEmail());
    List<Booking> myReservations = dao.getUserBookings(user.getEmail());
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Dashboard | HRS</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; margin: 0;">

    <%-- Status message handling --%>
    <%-- Updated Notification Styling --%>
<% if(status != null) { 
    String msg = "";
    String bgColor = "";
    String icon = "";
    
    if("success".equals(status)) {
        msg = "Reservation Successful!";
        bgColor = "#22c55e"; // Green
        icon = "fa-check-circle";
    } else if("updated".equals(status)) {
        msg = "Booking Updated!";
        bgColor = "#000000"; // Black
        icon = "fa-sync";
    } else if("cancelled".equals(status)) {
        msg = "Booking Cancelled.";
        bgColor = "#ef4444"; // Red
        icon = "fa-trash-alt";
    }
    
    if(!msg.isEmpty()) { %>
        <div style="position: fixed; top: 20px; left: 50%; transform: translateX(-50%); 
                    background-color: <%= bgColor %>; color: white; padding: 12px 30px; 
                    border-radius: 50px; font-weight: 900; font-size: 14px; z-index: 1000; 
                    display: flex; align-items: center; gap: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.2);">
            <i class="fas <%= icon %>"></i> <%= msg %>
        </div>
    <% } 
} %>
    <nav style="padding: 2rem; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #f8fafc;">
        <div style="display: flex; align-items: center; gap: 0.75rem;">
            <div style="height: 2.5rem; width: 2.5rem; background-color: black; border-radius: 0.5rem; display: flex; align-items: center; justify-content: center; color: white; font-weight: 900; font-style: italic;">H</div>
            <span style="font-weight: 900; font-size: 1.25rem; letter-spacing: -0.05em; text-transform: uppercase;">Dashboard.</span>
        </div>
        <div style="display: flex; align-items: center; gap: 1.5rem; font-size: 0.875rem;">
            <span style="font-weight: 700; text-transform: uppercase; letter-spacing: -0.05em; color: #94a3b8; font-style: italic;">Active Member: <%= user.getFullname() %></span>
            <a href="LogoutServlet" style="background-color: black; color: white; padding: 0.5rem 2rem; border-radius: 9999px; font-weight: 900; font-size: 0.75rem; text-decoration: none;">LOGOUT</a>
        </div>
    </nav>

    <main style="max-width: 80rem; margin: 0 auto; padding: 2.5rem;">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 4rem;">
            <div style="grid-column: span 2; background-color: #020617; border-radius: 3.5rem; padding: 4rem; color: white; position: relative; overflow: hidden;">
                <h2 style="font-size: 3.75rem; font-weight: 900; line-height: 1; text-transform: uppercase; margin: 0;">Welcome home, <br><span style="color: #64748b;"><%= user.getFullname() %></span></h2>
                <p style="margin-top: 1.5rem; color: #94a3b8; font-size: 1.125rem;">Your next sanctuary is just one click away.</p>
                <a href="rooms.jsp" style="background-color: white; color: black; padding: 1.25rem 3rem; border-radius: 9999px; font-weight: 900; font-size: 0.875rem; margin-top: 2.5rem; display: inline-block; text-decoration: none;">New Reservation</a>
                <div style="position: absolute; right: -5rem; bottom: -5rem; font-size: 250px; font-weight: 900; color: rgba(255,255,255,0.05); font-style: italic; user-select: none;">HRS</div>
            </div>

            <div style="background-color: #f8fafc; border-radius: 3.5rem; padding: 3rem; border: 1px solid #f1f5f9; display: flex; flex-direction: column; justify-content: space-between;">
                <div style="height: 3.5rem; width: 3.5rem; background-color: black; border-radius: 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.25rem;">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div>
                    <p style="font-size: 10px; font-weight: 900; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.3em; margin: 0;">Total Bookings</p>
                    <h3 style="font-size: 4.5rem; font-weight: 900; margin-top: 0.5rem; letter-spacing: -0.05em; line-height: 1;"><%= totalBookings %></h3>
                </div>
            </div>
        </div>

        <h3 style="font-size: 1.875rem; font-weight: 900; margin-bottom: 2rem; letter-spacing: -0.05em;">My Active Reservations</h3>
        <div style="background-color: white; border: 1px solid #f1f5f9; border-radius: 2.5rem; overflow: hidden; box-shadow: 0 1px 2px 0 rgba(0,0,0,0.05);">
            <table style="width: 100%; border-collapse: collapse; text-align: left;">
                <thead style="background-color: #f8fafc; border-bottom: 1px solid #f1f5f9;">
                    <tr>
                        <th style="padding: 1.5rem 2.5rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.1em;">Suite & Room Number</th>
                        <th style="padding: 1.5rem 2.5rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.1em;">Rate</th>
                        <th style="padding: 1.5rem 2.5rem; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.1em; text-align: right;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(myReservations.isEmpty()) { %>
                        <tr><td colspan="3" style="padding: 5rem; text-align: center; color: #cbd5e1; font-weight: 700; font-style: italic;">No active reservations found.</td></tr>
                    <% } else { 
                        for(Booking b : myReservations) { %>
                        <tr style="border-bottom: 1px solid #f8fafc;">
                            <td style="padding: 2rem 2.5rem; font-weight: 900; font-size: 1.25rem; text-transform: uppercase;"><%= b.getRoomType() %></td>
                            <td style="padding: 2rem 2.5rem; color: #64748b; font-weight: 700;">$<%= b.getPrice() %></td>
                            <td style="padding: 2rem 2.5rem; text-align: right; display: flex; gap: 1.5rem; justify-content: flex-end; align-items: center;">
                                <a href="editdetails.jsp?id=<%= b.getId() %>" style="color: #94a3b8; font-weight: 900; font-size: 10px; text-transform: uppercase; text-decoration: none; letter-spacing: 0.1em;">Edit Details</a>
                                <form action="CancelBookingServlet" method="POST" onsubmit="return confirm('Cancel this stay?');" style="margin: 0;">
                                    <input type="hidden" name="bookingId" value="<%= b.getId() %>">
                                    <button type="submit" style="color: #ef4444; font-weight: 900; font-size: 10px; text-transform: uppercase; letter-spacing: 0.1em; background-color: #fef2f2; border: none; padding: 0.625rem 1.25rem; border-radius: 9999px; cursor: pointer;">Cancel Stay</button>
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