CREATE DATABASE Product_Management3;
USE Product_Management3;

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Product_ID INT,
    Seller_ID INT,
    Quantity INT,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);

INSERT INTO Product VALUES
(1, 'Laptop', 45000),
(2, 'Mobile', 15000),
(3, 'Mouse', 500),
(4, 'Keyboard', 1200);

INSERT INTO Seller VALUES
(101, 'ABC Stores', 'Chennai'),
(102, 'XYZ Traders', 'Madurai');

INSERT INTO Inventory VALUES
(1, 1, 101, 10),
(2, 2, 101, 20),
(3, 3, 102, 30),
(4, 4, 102, 15);

SELECT * FROM Product;
SELECT * FROM Seller;
SELECT * FROM Inventory;

SELECT Seller.Seller_Name, Product.Product_Name, Inventory.Quantity
FROM Inventory
JOIN Seller ON Inventory.Seller_ID = Seller.Seller_ID
JOIN Product ON Inventory.Product_ID = Product.Product_ID;

SELECT Seller_ID, SUM(Quantity) AS Total_Stock
FROM Inventory
GROUP BY Seller_ID;

UPDATE Product
SET Price = 16000
WHERE Product_ID = 2;

UPDATE Inventory
SET Quantity = 25
WHERE Inventory_ID = 1;

DELETE FROM Inventory
WHERE Product_ID = 3;

DELETE FROM Product
WHERE Product_ID = 3;

SELECT * FROM Product;
SELECT * FROM Inventory;