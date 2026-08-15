DROP DATABASE IF EXISTS wear_unique;
CREATE DATABASE wear_unique;
USE wear_unique;

CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	description VARCHAR(255)
);

CREATE TABLE variants (
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT,
	color VARCHAR(50) NOT NULL,
	image VARCHAR(255) NOT NULL,
	stock INT DEFAULT 10,
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	variant_id INT,
	quantity INT DEFAULT 1,
	total_price DECIMAL(10,2),
	order_date DATE,
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (variant_id) REFERENCES variants(id)
);

INSERT INTO products (title, price, description) VALUES
('Pique Cotton Polo', 45.00, 'Regular fit short sleeve polo made from cotton blend.');

INSERT INTO variants (product_id, color, image, stock) VALUES
(1, 'Navy', 'images/polo-navy.webp', 10),
(1, 'Marine Green', 'images/polo-marinegreen.webp', 10),
(1, 'Royal Blue', 'images/polo-royalblue.webp', 10),
(1, 'Oatmeal', 'images/polo-oatmeal.webp', 10);

INSERT INTO customers (full_name, email, password) VALUES
('Sarah', 'sarah@example.com', '12345');
