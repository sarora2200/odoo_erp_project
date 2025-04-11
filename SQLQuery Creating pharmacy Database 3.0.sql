
                                     -- Step 1: Create the Database --
CREATE DATABASE "Pharmacy Dataset 3.0";

USE "Pharmacy Dataset 3.0";

                                     -- Step 2: Create Tables --

                                     -- 1. Customers Table --
CREATE TABLE Customers 
	(
    cust_id INT PRIMARY KEY,
    cust_name NVARCHAR(255),
	cust_type VARCHAR (100)
    );

                                     -- 2. Employees Table --
CREATE TABLE Employees 
	(
    emp_id INT PRIMARY KEY,
    emp_name NVARCHAR(255) NOT NULL
    );


                                     -- 3. Branches Table --
CREATE TABLE Branches 
	(
    branch_id INT PRIMARY KEY,
    branch_name NVARCHAR(255) NOT NULL
    );

									 -- 4. Product Category Table --
CREATE TABLE Product_Category 
	(
    category_id INT PRIMARY KEY,
    category_name NVARCHAR(255),
    sub_category1 NVARCHAR(255),
    sub_category2 NVARCHAR(255),
    sub_category3 NVARCHAR(255),
    sub_category4 NVARCHAR(255),
    sub_category5 NVARCHAR(255),
    sub_category6 NVARCHAR(255)
	);



										 -- 5. Products Table --
	CREATE TABLE Products 
		(
		product_id INT PRIMARY KEY,
		product_name NVARCHAR(255) NOT NULL,
		category_id INT NOT NULL,
		product_cost DECIMAL(18,2) NOT NULL,
		product_price DECIMAL(18,2) NOT NULL,
		CONSTRAINT FK_Products_Category FOREIGN KEY (category_id) REFERENCES Product_Category(category_id)
		);

									-- 6. Orders Table --
CREATE TABLE Orders 
	(
    order_id INT,
    order_barcode NVARCHAR(255) PRIMARY KEY,
    order_date DATETIME NOT NULL,
    emp_id INT,
    cust_id INT,
    branch_id INT,
    total_bill DECIMAL(18,2) NOT NULL,
    return_status VARCHAR(50),
    CONSTRAINT FK_Orders_Employee3 FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
	CONSTRAINT FK_Orders_Customer3 FOREIGN KEY (cust_id) REFERENCES Customers(cust_id),
    CONSTRAINT FK_Orders_Branch3 FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
	);

									-- 7. Order Details Table --
CREATE TABLE Order_Details
(
    order_det_id INT PRIMARY KEY IDENTITY(1,1),
    order_barcode NVARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL(18,2) NOT NULL);
	CONSTRAINT FK_Order_Details_Orders3 FOREIGN KEY (order_barcode) REFERENCES Orders(order_barcode),
    CONSTRAINT FK_Order_Details_Products3 FOREIGN KEY (product_id) REFERENCES Products(product_id);	

									-- 8. Payments Table --
CREATE TABLE Payments
	(
    payment_id INT PRIMARY KEY,
    order_barcode NVARCHAR(255) NOT NULL,
    payment_amount DECIMAL(18,2),
    payment_method NVARCHAR(255),
    CONSTRAINT FK_Payments_Orders3 FOREIGN KEY (order_barcode) REFERENCES Orders(order_barcode)
	);

                                	-- 9. Inventory Table --
CREATE TABLE Inventory
	(
    inventory_product_id INT ,
    stock INT NOT NULL,
    CONSTRAINT FK_Inventory_Products FOREIGN KEY (inventory_product_id)
        REFERENCES Products(product_id)
	);
