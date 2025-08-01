/* 2025-08-01 09:21:51 [1 ms] */ 
USE ecommerce;
/* 2025-08-01 09:22:12 [2 ms] */ 
SELECT id, name, email FROM users LIMIT 100;
/* 2025-08-01 09:23:49 [2 ms] */ 
SELECT DATABASE();
/* 2025-08-01 09:23:56 [2 ms] */ 
USE ecommerce;
/* 2025-08-01 09:26:31 [2 ms] */ 
SELECT * FROM users LIMIT 100;
/* 2025-08-01 09:26:42 [3 ms] */ 
SHOW CREATE TABLE orders;
/* 2025-08-01 09:29:01 [25 ms] */ 
DROP TABLE IF EXISTS order_items;
/* 2025-08-01 09:29:02 [8 ms] */ 
DROP TABLE IF EXISTS orders;
/* 2025-08-01 09:29:03 [8 ms] */ 
DROP TABLE IF EXISTS products;
/* 2025-08-01 09:29:05 [9 ms] */ 
DROP TABLE IF EXISTS users;
/* 2025-08-01 09:29:06 [9 ms] */ 
DROP TABLE IF EXISTS admins;
/* 2025-08-01 09:29:15 [18 ms] */ 
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
/* 2025-08-01 09:29:17 [18 ms] */ 
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
/* 2025-08-01 09:29:19 [18 ms] */ 
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category VARCHAR(100)
);
/* 2025-08-01 09:29:20 [19 ms] */ 
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id)
);
/* 2025-08-01 09:29:23 [22 ms] */ 
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
/* 2025-08-01 09:29:34 [4 ms] */ 
INSERT INTO users (name, email) VALUES
('Hari Ram', 'hari@example.com'),
('Ravi Kumar', 'ravi@example.com'),
('Anu Priya', 'anu@example.com');
/* 2025-08-01 09:29:35 [4 ms] */ 
INSERT INTO products (name, price, stock, category) VALUES
('Laptop', 999.99, 10, 'Electronics'),
('Phone', 399.00, 25, 'Electronics'),
('Pen', 5.00, 100, 'Stationery');
/* 2025-08-01 09:29:37 [5 ms] */ 
INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 1098.99, 'pending'),
(2, 399.00, 'shipped'),
(3, 45.00, 'delivered');
/* 2025-08-01 09:29:38 [6 ms] */ 
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(1, 3, 2, 10.00),
(2, 2, 1, 399.00),
(3, 3, 9, 45.00);
/* 2025-08-01 09:30:26 [2 ms] */ 
SHOW TABLES;
/* 2025-08-01 09:30:55 [2 ms] */ 
DESCRIBE users;
/* 2025-08-01 09:31:33 [2 ms] */ 
SELECT 
  table_name, 
  column_name, 
  referenced_table_name, 
  referenced_column_name
FROM information_schema.key_column_usage
WHERE referenced_table_name IS NOT NULL
  AND table_schema = 'ecommerce' LIMIT 100;
/* 2025-08-01 09:32:34 [1 ms] */ 
SELECT * FROM users LIMIT 100;
/* 2025-08-01 09:32:47 [4 ms] */ 
SELECT 
    o.id AS order_id,
    u.name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    oi.price,
    o.total_amount,
    o.status
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id LIMIT 100;
/* 2025-08-01 09:33:54 [2 ms] */ 
SELECT * FROM admins LIMIT 100;
/* 2025-08-01 09:35:25 [39 ms] */ 
INSERT INTO admins (email, password) VALUES
('admin1@example.com', 'admin123'),
('admin2@example.com', 'securepass'),
('superadmin@example.com', 'supersecure456');
