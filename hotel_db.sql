-- 1. Create and select the database
CREATE DATABASE
IF NOT EXISTS hotel_db;
USE hotel_db;

-- 2. Users Table: Handles both Customers and Admins
CREATE TABLE
IF NOT EXISTS users
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR
(100) NOT NULL,
    email VARCHAR
(100) NOT NULL UNIQUE,
    password VARCHAR
(100) NOT NULL,
    role VARCHAR
(20) DEFAULT 'customer' 
);

-- 3. Room Catalog Table: Where Admin "Booms" in new rooms
CREATE TABLE
IF NOT EXISTS room_catalog
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR
(100) NOT NULL,
    price DOUBLE NOT NULL,
    image_url TEXT NOT NULL,
    description TEXT
);

-- 4. Bookings Table: Tracks all reservations
CREATE TABLE
IF NOT EXISTS bookings
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR
(100) NOT NULL,
    room_type VARCHAR
(255) NOT NULL,
    price DOUBLE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY
(user_email) REFERENCES users
(email) ON
DELETE CASCADE
);

-- 5. INITIAL ADMIN SETUP
-- Run this line to make sure you can log in to the Management Center
INSERT INTO users
    (fullname, email, password, role)
VALUES
    ('System Admin', 'joeleyuel1@gmail.com', 'admin123', 'admin');

-- 6. DEFAULT ROOMS (Clean version without long URLs)
INSERT INTO room_catalog
    (room_name, price, image_url, description)
VALUES
    ('Luxury Suite', 450.0, 'img/luxury.jpg', 'High-end luxury with a city view.'),
    ('Presidential Suite', 1200.0, 'img/presidential.jpg', 'The finest room in the house.');