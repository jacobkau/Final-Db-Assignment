-- Create the database
CREATE DATABASE IF NOT EXISTS inventoryDB;

-- Use the newly created database
USE inventoryDB;

-- Create warehouses table (1-M relationship with employees)
CREATE TABLE warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Create products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Create suppliers table
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255) NOT NULL
);

-- Create employees table (M-1 relationship with warehouses)
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    warehouse_id INT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Create stock_levels table (M-M relationship between products and warehouses)
CREATE TABLE stock_levels (
    stock_level_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- Create stock_movements table (Tracking stock inflow and outflow)
CREATE TABLE stock_movements (
    movement_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_level_id INT,
    movement_date DATE NOT NULL,
    movement_type ENUM('IN', 'OUT') NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (stock_level_id) REFERENCES stock_levels(stock_level_id)
);

-- Sample data for warehouses
INSERT INTO warehouses (warehouse_name, location)
VALUES 
('Warehouse A', 'New York, USA'),
('Warehouse B', 'Los Angeles, USA');

-- Sample data for products
INSERT INTO products (product_name, product_description, price)
VALUES 
('Laptop', 'High-end gaming laptop', 1500.00),
('Mouse', 'Wireless mouse', 25.50);

-- Sample data for suppliers
INSERT INTO suppliers (supplier_name, contact_info)
VALUES 
('TechSupply Co.', 'techsupply@example.com'),
('Gadgets Inc.', 'contact@gadgetsinc.com');

-- Sample data for employees
INSERT INTO employees (first_name, last_name, job_title, warehouse_id)
VALUES 
('John', 'Doe', 'Manager', 1),
('Jane', 'Smith', 'Inventory Clerk', 2);

-- Sample data for stock_levels
INSERT INTO stock_levels (product_id, warehouse_id, quantity)
VALUES 
(1, 1, 100),
(2, 2, 200);

-- Sample data for stock_movements
INSERT INTO stock_movements (stock_level_id, movement_date, movement_type, quantity)
VALUES 
(1, '2025-04-01', 'IN', 50),
(2, '2025-04-02', 'OUT', 30);
