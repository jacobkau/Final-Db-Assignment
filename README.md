# Inventory Tracking System

## Project Description
The **Inventory Tracking System** is a Node.js-based API designed to manage inventory data for warehouses, products, suppliers, employees, and stock movements. It provides endpoints to create, read, update, and delete inventory-related data, enabling efficient tracking of stock levels and movements across multiple warehouses.

The project uses a MySQL database to store inventory data and follows a relational database design. The database schema includes tables for warehouses, products, suppliers, employees, stock levels, and stock movements.

## Features
- Manage products, warehouses, suppliers, and employees.
- Track stock levels and movements (inflow and outflow).
- RESTful API endpoints for CRUD operations.
- Relational database design with foreign key constraints.

## How to Run/Setup the Project

### Prerequisites
1. Install [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/).
2. Install [MySQL](https://www.mysql.com/).

### Steps
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Final-Db-Assignment
   ```

2. Install dependencies:
   ```bash
   cd inventory-tracking-api
   npm install
   ```

3. Set up the database:
   - Open the `inventory_system.sql` file located in the root directory.
   - Import the SQL file into your MySQL server:
     ```bash
     mysql -u root -p < inventory_system.sql
     ```
   - Ensure the database is created and populated with sample data.

4. Configure the database connection:
   - Open db.js.
   - Update the `host`, `user`, `password`, and `database` fields with your MySQL credentials.

5. Start the server:
   ```bash
   node server.js
   ```
   The server will run on `http://localhost:3000` by default.

6. Test the API:
   - Use tools like [Postman](https://www.postman.com/) or [cURL](https://curl.se/) to test the API endpoints.

### API Endpoints
- **POST** `/api/products` - Create a new product.
- **GET** `/api/products` - Retrieve all products.
- **PUT** `/api/products/:id` - Update a product by ID.
- **DELETE** `/api/products/:id` - Delete a product by ID.

## Entity-Relationship Diagram (ERD)
Below is the ERD for the database schema:

![ERD](https://drive.google.com/file/d/19WTt-qN0NhRMiKMUfgGKgm0fHqmjAIzy/view?usp=sharing)

Alternatively, you can find the ERD in the project documentation or generate it using tools like MySQL Workbench.

## License
This project is open-source and available for use under the MIT License.
