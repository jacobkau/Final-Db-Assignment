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
