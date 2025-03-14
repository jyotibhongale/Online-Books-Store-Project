#create database
create database onlinebooks_store;
#create table
use onlinebooks_store;
create table Books (
    Book_ID int,
    Title varchar(100),
    Author varchar(100),
    Genre varchar(50),
    Published_Year int,
    Price numeric(10, 2),
    Stock int
);

describe Books;

create table Customers (
    Customer_ID int,
    Name varchar(100),
    Email varchar(100),
    Phone varchar(15),
    City varchar(50),
    Country varchar(150)
);
describe Customers;

CREATE TABLE Orders (
    Order_ID int,
    Customer_ID int references Customers(Customer_ID),
    Book_ID int references Books(Book_ID),
    Order_Date date,
    Quantity int,
    Total_Amount numeric(10,2)
    );
    
    describe Orders;
    
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;
##1)retrieve all books in fiction Genre----
SELECT * FROM Books 
WHERE Genre='Fiction';

##2) Find books published after the year 1950---
SELECT * FROM Books 
WHERE Published_year>1950;

##3) List all customers from the Zimbabwe---
SELECT * FROM Customers 
WHERE country='Zimbabwe';


###4) Show orders placed in November 2024---

SELECT * FROM Orders 
WHERE order_date BETWEEN '2024-11-01' AND '2024-11-30';


##5) Retrieve the total stock of books available---

SELECT sum(stock) as Total_Stock
From Books;

## 6) Find the details of the most expensive book---
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

##7) Show all customers who ordered more than 1 quantity of a book--
SELECT * FROM Orders 
WHERE quantity>1;


### 8) List all genres available in the Books table:
SELECT DISTINCT genre 
FROM Books;

###9)Retrieve all orders where the total amount exceeds $40:
SELECT * FROM Orders 
WHERE total_amount>40;


##-- 10) Find the book with the lowest stock:
SELECT * 
FROM Books 
ORDER BY stock 
LIMIT 1;


##12.11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) As Revenue 
FROM Orders;






