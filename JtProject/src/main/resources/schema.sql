SET REFERENTIAL_INTEGRITY FALSE;

DROP ALL OBJECTS;

SET REFERENTIAL_INTEGRITY TRUE;


-- Create the customer table
CREATE TABLE IF NOT EXISTS CUSTOMER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(255),
    username VARCHAR(255) UNIQUE
);

-- Insert default customers
INSERT INTO CUSTOMER(address, email, password, role, username) VALUES 
    ('123, Albany Street', 'admin@nyan.cat', '123', 'ROLE_ADMIN', 'admin'),
    ('765, 5th Avenue', 'lisa@gmail.com', '765', 'ROLE_NORMAL', 'lisa');


-- Create the category table
CREATE TABLE IF NOT EXISTS CATEGORY (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

-- Insert default categories
INSERT INTO CATEGORY(name) VALUES 
    ('Fruits'),
    ('Vegetables'),
    ('Meat'),
    ('Fish'),
    ('Dairy'),
    ('Bakery'),
    ('Drinks'),
    ('Sweets'),
    ('Other');


-- Create the product table
CREATE TABLE IF NOT EXISTS PRODUCT (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255),
    image VARCHAR(255),
    name VARCHAR(255),
    price INT,
    quantity INT,
    weight INT,
    category_id INT,
    customer_id INT,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id) ON DELETE SET NULL,
    CONSTRAINT fk_product_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id) ON DELETE SET NULL
);

-- Insert default products
INSERT INTO PRODUCT(description, image, name, price, quantity, weight, category_id) VALUES 
    ('Fresh and juicy', 'https://freepngimg.com/save/9557-apple-fruit-transparent/744x744', 'Apple', 3, 40, 76, 1),
    ('Woops! There goes the eggs...', 'https://www.nicepng.com/png/full/813-8132637_poiata-bunicii-cracked-egg.png', 'Cracked Eggs', 1, 90, 43, 9);

-- Create indexes
CREATE INDEX idx_product_category ON PRODUCT (category_id);
CREATE INDEX idx_product_customer ON PRODUCT (customer_id);
