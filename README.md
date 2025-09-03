📌 E-Commerce Database (MySQL)

This project implements a simple e-commerce database in MySQL. It includes tables for customers, orders, products, and order items. The schema supports basic operations like tracking orders, customers, products, and queries for reporting.

## 🚀 Features

 1.Customers: Stores customer details (name, email, address).

Orders: Stores order details with date and total amount.

Products: Stores product information with price and description.

Order Items: Normalized table mapping products to orders with quantities.

## Database Schema

 ## Tables Created:

## customers - Stores customer information

id (Primary Key)

name

email

address

## orders - Tracks customer orders

id (Primary Key)

customer_id (Foreign Key to customers)

orders_date

total_amount

## products - Contains product information

id (Primary Key)

name

price

description

discount (Added via ALTER TABLE)

## order_items - Junction table for orders and products (Normalization)

id (Primary Key)

order_id (Foreign Key to orders)

product_id (Foreign Key to products)

quantity  

## Installation and Setup
 1. Ensure MySQL is installed and running on your system

 2. Execute the provided SQL script to:

 3. Create the database

 4. Create all tables

 5. Insert sample data

 6. Run all queries


## ⚙️ GitHub Repository

 Clone the repo
   ```bash
   git clone https://github.com/arunjo96/Ecommerce_MySQL.git