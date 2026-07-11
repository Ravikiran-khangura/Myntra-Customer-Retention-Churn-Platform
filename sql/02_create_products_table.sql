drop table if exists products;
CREATE TABLE products (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    img LONGTEXT,
    asin VARCHAR(50),
    price DECIMAL(10,2),
    mrp DECIMAL(10,2),
    rating DECIMAL(3,1),
    ratingTotal INT,
    discount INT,
    seller VARCHAR(255),
    purl TEXT
);

-- Example: Add a primary key after table creation
-- ALTER TABLE products
-- ADD PRIMARY KEY (id);

-- Example command to run after both tables already exist:
-- ALTER TABLE transactions
-- ADD CONSTRAINT fk_transactions_products
-- FOREIGN KEY (product_id)
-- REFERENCES products(id);

SELECT COUNT(*) FROM products;