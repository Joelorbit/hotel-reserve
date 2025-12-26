<%@page import="com.hrs.hotel.model.User"%>
<%
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("../login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap" rel="stylesheet">
    <title>Add New Room | Admin</title>
</head>
<body style="background-color: white; font-family: 'Inter', sans-serif; padding: 2.5rem;">
    <div style="max-width: 42rem; margin-left: auto; margin-right: auto;">
        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2.5rem;">
            <a href="dashboard.jsp" style="height: 2.5rem; width: 2.5rem; background-color: #f1f5f9; border-radius: 9999px; display: flex; align-items: center; justify-content: center; text-decoration: none; color: inherit; transition: all 0.2s;">
                ?
            </a>
            <h2 style="font-size: 2.25rem; line-height: 2.5rem; font-weight: 900; text-transform: uppercase; letter-spacing: -0.05em; margin: 0;">Publish New Room</h2>
        </div>

        <form action="../AddRoomServlet" method="POST" style="background-color: #f8fafc; padding: 3rem; border-radius: 3rem; border: 1px solid #f1f5f9; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);">
            <div style="display: flex; flex-direction: column; gap: 1.5rem;">
                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Room Name</label>
                    <input type="text" name="roomName" placeholder="e.g. Presidency Suite" required
                           style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 1.125rem; box-sizing: border-box;">
                </div>

                <div style="display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 1.5rem;">
                    <div>
                        <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Price Per Night ($)</label>
                        <input type="number" name="price" placeholder="1500" required
                               style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 1.125rem; box-sizing: border-box;">
                    </div>
                    <div>
                        <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Category</label>
                        <select style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 1.125rem;">
                            <option>High Official</option>
                            <option>Luxury</option>
                            <option>Standard</option>
                        </select>
                    </div>
                </div>

                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Image URL</label>
                    <input type="text" name="imageUrl" placeholder="Paste image link here..." required
                           style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 0.875rem; box-sizing: border-box;">
                </div>

                <div>
                    <label style="display: block; font-size: 10px; font-weight: 900; text-transform: uppercase; color: #94a3b8; margin-bottom: 0.5rem;">Description</label>
                    <textarea name="description" rows="3" placeholder="Describe the room features..."
                              style="width: 100%; padding: 1rem; border-radius: 1rem; border: none; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); font-weight: 700; font-size: 0.875rem; box-sizing: border-box;"></textarea>
                </div>

                <button type="submit" style="width: 100%; background-color: black; color: white; padding: 1.5rem 0; border-radius: 1rem; border: none; font-weight: 900; text-transform: uppercase; letter-spacing: 0.1em; cursor: pointer; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25); transition: transform 0.2s;">
                    Publish Room Now
                </button>
            </div>
        </form>
    </div>
</body>
</html>