use e_commerce_project;
CREATE TABLE users (
    userId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(100),
    email  VARCHAR(100) UNIQUE
);

CREATE TABLE products (
    productId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name      VARCHAR(100),
    category  VARCHAR(100)
);

CREATE TABLE orders (
    orderId    BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    orderDate  DATE,
    user_Id    BIGINT UNSIGNED,
    product_Id BIGINT UNSIGNED,
    FOREIGN KEY (user_Id)    REFERENCES users(userId),
    FOREIGN KEY (product_Id) REFERENCES products(productId),
    UNIQUE KEY user_product_unique (user_Id, product_Id)
);