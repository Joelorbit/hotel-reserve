package com.hrs.hotel.model;

public class User {
    private int id;
    private String fullname;
    private String email;
    private String password;
    private String role; // New field to store 'admin' or 'customer'

    public User() {}
    
    // Updated Constructor
    public User(int id, String fullname, String email, String password, String role) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    // New Role Getter and Setter
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}