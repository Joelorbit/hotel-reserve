package com.hrs.hotel.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Change 'root' and 'password' to your MySQL credentials
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&allowPublicKeyRetrieval=true", 
                "root", "Joelget@4");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}