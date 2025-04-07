
USE LamijaZuko_db;

-- Users tabela
CREATE TABLE Users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    Role ENUM('admin', 'user') DEFAULT 'user',
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products tabela (bez Category_ID)
CREATE TABLE Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Stock INT,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders tabela
CREATE TABLE Orders (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Total_price DECIMAL(10, 2),
    Status ENUM('pending', 'shipped', 'delivered') DEFAULT 'pending',
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES Users(ID)
);

-- Order_Items tabela
CREATE TABLE Order_Items (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(ID)
);

-- Cart tabela
CREATE TABLE Cart (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY (User_ID) REFERENCES Users(ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(ID)
);
