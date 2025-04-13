CREATE TABLE BOOKS (
  book_index INT PRIMARY KEY,
  book_title VARCHAR(255),
  edition VARCHAR(100),
  year_published YEAR
);

INSERT INTO BOOKS (book_index, book_title, edition, year_published) VALUES
(101, 'Introduction to Electrical Engineering', '4th Edition', 2018),
(102, 'Digital Signal Processing', '3rd Edition', 2015),
(103, 'Engineering Mechanics: Dynamics', '14th Edition', 2020),
(104, 'Computer Networks', '5th Edition', 2011),
(105, 'Database System Concepts', '7th Edition', 2020),
(106, 'Information Retrieval', '2nd Edition', 2016),
(107, 'Artificial Intelligence: A Modern Approach', '4th Edition', 2021),
(108, 'Software Engineering', '10th Edition', 2015);


CREATE TABLE AUTHOR (
  authorid INT PRIMARY KEY,
  author_first_name VARCHAR(100),
  author_last_name VARCHAR(100),
  year_published YEAR
);

INSERT INTO AUTHOR (authorid, author_first_name, author_last_name, year_published) VALUES
(201, 'John', 'Smith', 2018),
(202, 'Alan', 'Oppenheim', 2015),
(203, 'J.L.', 'Meriam', 2020),
(204, 'Andrew', 'Tanenbaum', 2011),
(205, 'Abraham', 'Silberschatz', 2020),
(206, 'Stefan', 'Büttcher', 2016),
(207, 'Stuart', 'Russell', 2021),
(208, 'Ian', 'Sommerville', 2015);


CREATE TABLE BOOK_AUTHOR (
  book_index INT,
  authorid INT,
  PRIMARY KEY (book_index, authorid),
  FOREIGN KEY (book_index) REFERENCES BOOKS(book_index),
  FOREIGN KEY (authorid) REFERENCES AUTHOR(authorid)
);

INSERT INTO BOOK_AUTHOR (book_index, authorid) VALUES
(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205),
(106, 206),
(107, 207),
(108, 208);


CREATE TABLE PUBLISHER (
  bookindex_FK INT PRIMARY KEY,
  book_name_FK VARCHAR(255),
  author_FK INT,
  publisher VARCHAR(255),
  year_published YEAR,
  FOREIGN KEY (bookindex_FK) REFERENCES BOOKS(book_index),
  FOREIGN KEY (author_FK) REFERENCES AUTHOR(authorid)
);

INSERT INTO PUBLISHER (bookindex_FK, book_name_FK, author_FK, publisher, year_published) VALUES
(101, 'Introduction to Electrical Engineering', 201, 'Pearson', 2018),
(102, 'Digital Signal Processing', 202, 'Prentice Hall', 2015),
(103, 'Engineering Mechanics: Dynamics', 203, 'Wiley', 2020),
(104, 'Computer Networks', 204, 'Pearson', 2011),
(105, 'Database System Concepts', 205, 'McGraw-Hill', 2020),
(106, 'Information Retrieval', 206, 'MIT Press', 2016),
(107, 'Artificial Intelligence: A Modern Approach', 207, 'Pearson', 2021),
(108, 'Software Engineering', 208, 'Pearson', 2015);


CREATE TABLE BOOK_LANGUAGE (
  book_index INT PRIMARY KEY,
  book_title VARCHAR(255),
  author VARCHAR(255),
  language VARCHAR(100),
  FOREIGN KEY (book_index) 
  REFERENCES BOOKS(book_index)
);

INSERT INTO BOOK_LANGUAGE (book_index, book_title, author, language) VALUES
(101, 'Introduction to Electrical Engineering', 'John Smith', 'English'),
(102, 'Digital Signal Processing', 'Alan Oppenheim', 'English'),
(103, 'Engineering Mechanics: Dynamics', 'J.L. Meriam', 'English'),
(104, 'Computer Networks', 'Andrew Tanenbaum', 'English'),
(105, 'Database System Concepts', 'Abraham Silberschatz', 'English'),
(106, 'Information Retrieval', 'Stefan Büttcher', 'English'),
(107, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'English'),
(108, 'Software Engineering', 'Ian Sommerville', 'English');


CREATE TABLE CUSTOMER (
  cust_id INT PRIMARY KEY,
  cust_firstName VARCHAR(100),
  cust_lastName VARCHAR(100)
);

INSERT INTO CUSTOMER (cust_id, cust_firstName, cust_lastname) VALUES
(1, 'Alice', 'Johnson'),
(2, 'Bob', 'Omondi'),
(3, 'Carol', 'Wanjiku'),
(4, 'Terry' , 'Mwakio'),
(5, 'Waithera' , 'Wetu'),
(6, 'Khadija', 'Abdalla');


CREATE TABLE COUNTRY (
  cust_id_FK INT PRIMARY KEY,
  cust_firstName_FK VARCHAR(100),
  cust_lastName_FK VARCHAR(100),
  country VARCHAR(100),
  FOREIGN KEY (cust_id_FK) REFERENCES CUSTOMER(cust_id)
);

INSERT INTO COUNTRY (cust_id_FK, cust_firstName_FK, cust_lastName_FK, country) VALUES
(1, 'Alice', 'Johnson', 'Kenya'),
(2, 'Bob', 'Omondi', 'Uganda'),
(3, 'Carol', 'Wanjiku', 'Tanzania'),
(4, 'Terry', 'Mwakio', 'South Africa'),
(5, 'Waithera', 'Wetu', 'Kenya'),
(6, 'Khadija', 'Abdalla', 'Nigeria');


CREATE TABLE ADDRESS (
  cust_id_FK INT PRIMARY KEY,
  cust_name_FK VARCHAR(100),
  address VARCHAR(255),
  code VARCHAR(20),
  FOREIGN KEY (cust_id_FK) REFERENCES CUSTOMER(cust_id)
);

INSERT INTO ADDRESS (cust_id_FK, cust_name_FK, address, code) VALUES
(1, 'Alice Johnson', '123 Nairobi Lane', '00100'),
(2, 'Bob Omondi', '456 Kampala Road', '00200'),
(3, 'Carol Wanjiku', '789 Arusha Street', '00300'),
(4, 'Terry Mwakio', '128 Pretoria', '00500'),
(5, 'Waithera Wetu', '124 Mfangano', '00100'),
(6, 'Khadija Abdalla', '356 Niger Lane', '00700');


CREATE TABLE ADDRESS_STATUS (
  cust_id_FK INT PRIMARY KEY,
  cust_name_FK VARCHAR(100),
  address_FK VARCHAR(255),
  status VARCHAR(50),
  FOREIGN KEY (cust_id_FK) REFERENCES CUSTOMER(cust_id)
);

INSERT INTO ADDRESS_STATUS (cust_id_FK, cust_name_FK, address_FK, status) VALUES
(1, 'Alice Johnson', '123 Nairobi Lane', 'Active'),
(2, 'Bob Omondi', '456 Kampala Road', 'Active'),
(3, 'Carol Wanjiku', '789 Arusha Street', 'Inactive'),
(4, 'Terry Mwakio', '128 Pretoria', 'Active'),
(5, 'Waithera Wetu', '124 Mfangano', 'Inactive'),
(6, 'Khadija Abdalla', '356 Niger Lane', 'Active');


CREATE TABLE CUST_ADDRESS (
  custid_FK INT PRIMARY KEY,
  custname_FK VARCHAR(100),
  address_FK VARCHAR(255),
  country_FK VARCHAR(100),
  FOREIGN KEY (custid_FK) REFERENCES CUSTOMER(cust_id)
);

INSERT INTO CUST_ADDRESS (custid_FK, custname_FK, address_FK, country_FK) VALUES
(1, 'Alice Johnson', '123 Nairobi Lane', 'Kenya'),
(2, 'Bob Omondi', '456 Kampala Road', 'Uganda'),
(3, 'Carol Wanjiku', '789 Arusha Street', 'Tanzania'),
(4, 'Terry Mwakio', '128 Pretoria', 'South Africa'), 
(5, 'Waithera Wetu', '124 Mfangano', 'Kenya'), 
(6, 'Khadija Abdalla', '356 Niger Lane', 'Nigeria');


CREATE TABLE CUST_ORDER (
  orderid INT PRIMARY KEY,
  customer_name VARCHAR(100),
  no_order_placed INT,
  unit_price DECIMAL(10, 2),
  total DECIMAL(10, 2)
);

INSERT INTO CUST_ORDER (orderid, customer_name, no_order_placed, unit_price, total) VALUES
(901, 'Alice Johnson', 2, 25.00, 50.00),
(902, 'Bob Omondi', 1, 40.00, 40.00),
(903, 'Carol Wanjiku', 3, 20.00, 60.00),
(904, 'Terry Mwakio', 3, 35.00, 105.00), 
(905, 'Waithera Wetu', 2, 40.00, 80.00),
(906, 'Khadija Abdalla', 4, 20.00, 80.00);


CREATE TABLE ORDER_LINE (
  orderid_FK INT,
  booknameFK VARCHAR(255),
  no_books_ordered INT,
  FOREIGN KEY (orderid_FK) REFERENCES CUST_ORDER(orderid)
);

INSERT INTO ORDER_LINE (orderid_FK, booknameFK, no_books_ordered) VALUES
(901, 'Introduction to Electrical Engineering', 1),
(901, 'Computer Networks', 1),
(902, 'Database System Concepts', 1),
(903, 'Digital Signal Processing', 2),
(903, 'Information Retrieval', 1);


CREATE TABLE ORDER_STATUS (
  orderid_FK INT PRIMARY KEY,
  pending BOOLEAN,
  shipped BOOLEAN,
  delivered BOOLEAN
);

INSERT INTO ORDER_STATUS (orderid_FK, pending, shipped, delivered) VALUES
(901, FALSE, TRUE, TRUE),
(902, TRUE, FALSE, FALSE),
(903, FALSE, TRUE, FALSE);


CREATE TABLE ORDER_HISTORY (
  orderid_FK INT PRIMARY KEY,
  date_order DATE,
  date_cancelled DATE,
  date_delivered DATE,
  FOREIGN KEY (orderid_FK) REFERENCES CUST_ORDER(orderid)
);

INSERT INTO ORDER_HISTORY (orderid_FK, date_order, date_cancelled, date_delivered) VALUES
(901, '2025-04-01', NULL, '2025-04-10'),
(902, '2025-04-05', NULL, NULL),
(903, '2025-03-28', NULL, NULL);


CREATE TABLE SHIPPING_METHOD (
  orderid_FK INT PRIMARY KEY,
  shipping_by_air BOOLEAN,
  shipping_by_sea BOOLEAN,
  other VARCHAR(100),
  FOREIGN KEY (orderid_FK) REFERENCES CUST_ORDER(orderid)
);

INSERT INTO SHIPPING_METHOD (orderid_FK, shipping_by_air, shipping_by_sea, other) VALUES
(901, TRUE, FALSE, NULL),
(902, FALSE, TRUE, NULL),
(903, FALSE, FALSE, 'Courier');