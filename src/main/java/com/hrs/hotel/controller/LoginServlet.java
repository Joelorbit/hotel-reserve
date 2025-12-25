package com.hrs.hotel.controller;

import com.hrs.hotel.dao.UserDAO;
import com.hrs.hotel.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, pass);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // Store user object for security
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.html?error=1");
        }
    }
}