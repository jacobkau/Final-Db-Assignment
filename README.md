# Final-Db-Assignment
# Question 1: Build a Complete Database Management System
Use Case: Inventory Tracking System
In this use case, we will design a relational database for an Inventory Tracking System that tracks products, suppliers, stock levels, warehouses, and employees.

# Question 2: Create a Simple CRUD API Using MySQL + Programming
Use Case: Inventory Tracking CRUD API
For the second part of the assignment, we will create a Node.js and Express API that interfaces with the Inventory Tracking System database. The API will include endpoints for CRUD operations on products.

1. Backend Setup (Node.js + Express)
# Step 1: Install Dependencies
First, initialize the Node.js project and install the necessary dependencies:

npm init -y
npm install express mysql2 body-parser

# Step 2: Project Structure
inventory-tracking-api/
├── server.js             # Main server file
├── config/               # Configuration files
│   └── db.js             # MySQL database connection file
├── routes/               # Route files
│   └── productRoutes.js  # Routes for managing products
└── .gitignore            # Git ignore file

# Step 3: MySQL Database Connection (config/db.js)
const mysql = require('mysql2');

// Create a connection to the database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'yourpassword',
  database: 'inventoryDB'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err.stack);
    return;
  }
  console.log('Connected to the database');
});

module.exports = connection;

# Step 4: API Routes for Products (routes/productRoutes.js)

const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Create a new product
router.post('/products', (req, res) => {
  const { product_name, product_description, price } = req.body;
  const query = 'INSERT INTO products (product_name, product_description, price) VALUES (?, ?, ?)';
  db.query(query, [product_name, product_description, price], (err, result) => {
    if (err) throw err;
    res.send('Product created successfully');
  });
});

// Get all products
router.get('/products', (req, res) => {
  const query = 'SELECT * FROM products';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Update a product
router.put('/products/:id', (req, res) => {
  const { id } = req.params;
  const { product_name, product_description, price } = req.body;
  const query = 'UPDATE products SET product_name = ?, product_description = ?, price = ? WHERE product_id = ?';
  db.query(query, [product_name, product_description, price, id], (err, result) => {
    if (err) throw err;
    res.send('Product updated successfully');
  });
});

// Delete a product
router.delete('/products/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM products WHERE product_id = ?';
  db.query(query, [id], (err, result) => {
    if (err) throw err;
    res.send('Product deleted successfully');
  });
});

module.exports = router;


# Step 5: Main Server File (server.js)

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const productRoutes = require('./routes/productRoutes');

app.use(bodyParser.json()); // Parse JSON request bodies

// Use the product routes
app.use('/api', productRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});


# How to Run/Setup the API
Clone the repository and open it in your terminal.

Run npm install to install the necessary dependencies.

Ensure that MySQL is running, and the database inventoryDB is set up with the provided inventory_system.sql.

Start the server with the command: node server.js.

Use Postman or curl to interact with the API. The API has the following routes:

POST /api/products: Create a new product.

GET /api/products: Fetch all products.

PUT /api/products/:id: Update a product by ID.

DELETE /api/products/:id: Delete a product by ID.
