package com.hrs.hotel.controller;

import com.hrs.hotel.dao.UserDAO;
import com.hrs.hotel.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setFullname(request.getParameter("fullname"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));

        UserDAO dao = new UserDAO();
        if(dao.registerUser(user)) {
            response.sendRedirect("login.html?msg=success");
        } else {
            response.sendRedirect("register.html?msg=error");
        }
    }
}