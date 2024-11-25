CREATE DATABASE `store_management` COLLATE utf8mb4_unicode_ci;

CREATE TABLE  Governorates(
      `id` INT(11) unsigned AUTO_INCREMENT,
    `Governorate_Name` VARCHAR(30) not null,
    PRIMARY KEY(`id`)
);

CREATE TABLE Stores(
`id` INT(11) unsigned AUTO_INCREMENT,
`name` VARCHAR(30) not null,
`address` VARCHAR(100)  not null,
     `Governorate_ID` INT(11) unsigned ,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`Governorate_ID`) REFERENCES  Governorates(`id`)  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE  Suppliers(
 `id` INT(11) unsigned AUTO_INCREMENT,
 `name` VARCHAR(30) not null,
 `phone` VARCHAR(30) not null,
`email` VARCHAR(30) not null UNIQUE,
`brief_data` VARCHAR(30) not null,
 PRIMARY KEY( `id`)
);

CREATE TABLE  Products(
`id` INT(11) unsigned AUTO_INCREMENT,
 `name` VARCHAR(30) not null,
`code` varchar(50) UNIQUE,
`description` VARCHAR(30) not null,
`product_price` VARCHAR(30) not null,
 `Supplier_ID` INT(11) unsigned ,
 	 PRIMARY KEY(`id`),
    FOREIGN KEY(`Supplier_ID`) REFERENCES  Suppliers( `id`)  on update cascade on delete cascade
    
);


CREATE TABLE  Store_Products( 
    `Store_Product_ID` INT PRIMARY KEY AUTO_INCREMENT,  
    `Store_ID` INT(11) unsigned ,
    `Product_ID` INT(11) unsigned ,
    FOREIGN KEY(`Store_ID`) REFERENCES  Stores( `id`)  on update cascade on delete cascade ,
    FOREIGN KEY(`Product_ID`) REFERENCES  Products( `id`)  on update cascade on delete cascade 
);


Query1:

SELECT DISTINCT orderNumber
FROM orderdetails
WHERE productCode LIKE 'S18%' 
  AND priceEach > 100;


Query2:
SELECT * FROM payments WHERE DAY(paymentDate) IN (5, 6); 


Query3:
SELECT credit_limit
FROM customers
WHERE country = 'USA' 
  AND phone LIKE '%5555%'
ORDER BY credit_limit DESC
LIMIT 1 OFFSET 4;

