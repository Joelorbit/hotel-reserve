-- 1. Create the Database
CREATE DATABASE
IF NOT EXISTS hotel_db;
USE hotel_db;

-- 2. Create the Users Table (for Login/Registration)
CREATE TABLE
IF NOT EXISTS users
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR
(100) NOT NULL,
    email VARCHAR
(100) NOT NULL UNIQUE,
    password VARCHAR
(100) NOT NULL
);

-- 3. Create the Bookings Table (The core of your Dashboard)
-- This table handles the "Total Bookings" count and the Reservation list
CREATE TABLE
IF NOT EXISTS bookings
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR
(100) NOT NULL,
    room_type VARCHAR
(255) NOT NULL, -- Stores strings like 'Penthouse (Floor 03, Room 104)'
    price DOUBLE NOT NULL,           -- Stores the rate like 550.0 or 85.0
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY
(user_email) REFERENCES users
(email) ON
DELETE CASCADE
);

-- 4. Sample Data (Optional: to test your Dashboard Read functionality)
-- This will show up as "1" in your Total Bookings card
-- INSERT INTO bookings (user_email, room_type, price) 
-- VALUES ('eyuel@example.com', 'Suite (Floor 03, Room 104)', 85.0);