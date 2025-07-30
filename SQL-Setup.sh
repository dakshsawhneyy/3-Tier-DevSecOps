sudo apt install mysql-server -y    # Install my-sql server

sudo mysql  # go inside mysql

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Daksh';   # Set password as Daksh for mysql
FLUSH PRIVILEGES;
EXIT;

# Again Login
sudo mysql -u root -p   # It asks for password and provide Daksh there

# MYSQL Commands
-- Create the database if not already exists
CREATE DATABASE IF NOT EXISTS crud_app;

-- Switch to the database
USE crud_app;

-- Drop table if needed (optional safety cleanup)
-- DROP TABLE IF EXISTS users;

-- Create the `users` table with proper structure
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'viewer') NOT NULL DEFAULT 'viewer',
  is_active TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);