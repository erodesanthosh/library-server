-- ===================================================
-- TiDB / MySQL Database Creation & Initialization Schema
-- ===================================================

-- 1. Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS librarydb;
USE librarydb;

-- 2. Create the `users` table for authentication & permissions
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(191) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    permission VARCHAR(50) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the `books` table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    year INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- (Optional) Sample initial book entries
INSERT INTO books (title, author, genre, year) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960),
('1984', 'George Orwell', 'Dystopian', 1949)
ON DUPLICATE KEY UPDATE id=id;
