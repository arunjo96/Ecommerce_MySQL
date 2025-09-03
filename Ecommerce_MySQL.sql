
-- 1. Create Database

CREATE DATABASE IF NOT EXISTS ecommerce;

-- Show all databases
SHOW DATABASES;

-- Select the ecommerce database
USE ecommerce;

-- Show all tables
SHOW TABLES;

-- 2. Create Customers Table

CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- Insert sample customers
INSERT INTO customers (name, email, address) VALUES
('Arun', 'arun@gmail.com', 'Salem, Tamil Nadu'),
('Gowthami Arun', 'gowthamiarun@gmail.com', 'Coimbatore, Tamil Nadu'),
('Karthik', 'karthik@gmail.com', 'Chennai, Tamil Nadu'),
('Priya Sharma', 'priya@gmail.com', 'Bangalore, Karnataka'),
('Ravi Kumar', 'ravi@gmail.com', 'Hyderabad, Telangana'),
('Meena', 'meena@gmail.com', 'Mumbai, Maharashtra');

-- View all customers
SELECT * FROM customers;

-- 3. Create Orders Table

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    orders_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert sample orders
INSERT INTO orders (customer_id, orders_date, total_amount) VALUES
(1, CURDATE() - INTERVAL 10 DAY, 2500.00), 
(2, CURDATE() - INTERVAL 15 DAY, 1500.00),
(3, CURDATE() - INTERVAL 35 DAY, 3200.00), 
(4, CURDATE() - INTERVAL 47 DAY, 1800.00),
(5, CURDATE() - INTERVAL 8 DAY, 4000.00), 
(6, CURDATE() - INTERVAL 14 DAY, 2200.00);

-- View all orders
SELECT * FROM orders;

-- 4. Create Products Table

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    description TEXT
);

-- Insert sample products
INSERT INTO products (name, price, description) VALUES
('Product A', 1000.00, 'Description A'),
('Product B', 2000.00, 'Description B'),
('Product C', 3000.00, 'Description C'),
('Product D', 4000.00, 'Description D'),
('Product E', 5000.00, 'Description E'),
('Product F', 6000.00, 'Description F');

-- View all products
SELECT * FROM products;

-- 5. Queries as per Requirements

-- Q1: Retrieve all customers who have placed an order in the last 30 days
SELECT DISTINCT c.id, c.name, c.email
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.orders_date >= CURDATE() - INTERVAL 30 DAY;


-- Q2: Get the total amount of all orders placed by each customer
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;


-- Q3: Update the price of Product C to 45.00
UPDATE products
SET price = 45.00
WHERE name = 'Product C';

-- Verify update
SELECT * FROM products WHERE name = 'Product C';


-- Q4: Add a new column discount to the products table
ALTER TABLE products ADD COLUMN discount DECIMAL(5,2) DEFAULT 0.00;

-- Verify column
SELECT * FROM products;


-- Q5: Retrieve the top 3 products with the highest price
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

-- Q6: Get the names of customers who have ordered Product A
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.name = 'Product A';


-- Q7: Join the orders and customers tables to retrieve the customer's name and order date
SELECT c.name, o.orders_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.id;


-- Q8: Retrieve the orders with a total amount greater than 150.00
SELECT * FROM orders
WHERE total_amount > 150.00;


-- Q9: Retrieve the average total of all orders
SELECT AVG(total_amount) AS avg_order_total
FROM orders;

-- Q10. Normalization: Order Items Table

CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),   
(1, 3, 1),  
(2, 2, 1),   
(3, 1, 1),   
(3, 4, 2),  
(4, 5, 1),   
(5, 6, 3),  
(6, 1, 1);   

-- View order items
SELECT * FROM order_items;
