<%@page import="com.hrs.hotel.model.Booking"%>
<%@page import="com.hrs.hotel.dao.BookingDAO"%>
<%
    String id = request.getParameter("id");
    BookingDAO dao = new BookingDAO();
    Booking b = dao.getBookingById(Integer.parseInt(id));
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Edit Booking | HRS</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; margin: 0;">
    <main style="max-width: 42rem; margin: 0 auto; padding: 5rem;">
        <h2 style="font-size: 2.25rem; font-weight: 900; margin-bottom: 0.5rem;">Update your <%= b.getRoomType() %></h2>
        <p style="color: #94a3b8; margin-bottom: 2.5rem; font-size: 0.875rem; font-style: italic;">Change your floor or room preference.</p>

        <form action="UpdateBookingServlet" method="POST">
            <input type="hidden" name="bookingId" value="<%= b.getId() %>">
            
            <div style="margin-bottom: 2rem;">
                <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 1rem;">Choose New Floor</label>
                <select name="floor" style="width: 100%; padding: 1rem; border-radius: 0.75rem; border: 1px solid #e2e8f0; font-weight: 700;">
                    <option value="01">Floor 01</option>
                    <option value="02">Floor 02</option>
                    <option value="03">Floor 03</option>
                    <option value="04">Floor 04</option>
                </select>
            </div>

            <div style="margin-bottom: 2.5rem;">
                <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 1rem;">New Room Number</label>
                <input type="text" name="roomNo" placeholder="e.g. 104" style="width: 100%; padding: 1rem; border-radius: 0.75rem; border: 1px solid #e2e8f0; font-weight: 700; box-sizing: border-box;">
            </div>

            <button type="submit" style="width: 100%; background-color: black; color: white; padding: 1.25rem 0; border-radius: 1rem; border: none; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em; cursor: pointer;">
                Save Changes
            </button>
        </form>
    </main>
</body>
</html>