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
