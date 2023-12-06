drop database if exists seafood_service_v4;
create database seafood_service_v4;
use seafood_service_v4;

DROP TABLE IF EXISTS vendor;
CREATE TABLE vendor ( 
	vendor_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	phone_number int NOT NULL,
	steet_number int NOT NULL,
	street_name VARCHAR(64) NOT NULL,
	city VARCHAR(25) NOT NULL,
	state VARCHAR(2) NOT NULL,
	zip INT NOT NULL
);

DROP TABLE IF EXISTS category;
CREATE TABLE category (
	category_name VARCHAR(64) NOT NULL PRIMARY KEY
);
insert into category values ('Frozen'), ('Fresh'), ('Non-Refrigerated');

DROP TABLE IF EXISTS product;
CREATE TABLE product (
	pid 	INT NOT NULL AUTO_INCREMENT,
	p_name	VARCHAR(64) NOT NULL UNIQUE,
    category VARCHAR(64) NOT NULL,
    sell_price	INT NOT NULL,
    p_description varchar(64) DEFAULT NULL,
    qty_in_stock INT NOT NULL DEFAULT 0,
    product_img varchar(64) NOT NULL,
    PRIMARY KEY (pid),
    FOREIGN KEY (category) REFERENCES category(category_name) 
		ON UPDATE CASCADE ON DELETE CASCADE
);

select * from customer;
insert inget_payment_methodsto product(p_name, category, sell_price, qty_in_stock, product_img) values 
	('Scallop Sashimi', 'Frozen', 30, 25, 'https://picsum.photos/200/300?random=1'),
    ('Maine Lobster', 'Fresh', 28, 50, 'https://picsum.photos/200/300?random=2'); 
    
delete from product where pid = 2;


DROP TABLE IF EXISTS vendor_supplies_seafood_product;
CREATE TABLE vendor_supplies_seafood_product ( 
	vendor_id INT NOT NULL,
    pid INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (vendor_id, pid),
    price_per_qty FLOAT NOT NULL,
    FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id) 
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (pid) references product(pid) 
		ON UPDATE CASCADE ON DELETE RESTRICT
);

-- individuals we contract, each is responsible for orders in some area (contains a group of 
drop table if exists delivery_partner;
create table delivery_partner(
	partner_id 	int primary key auto_increment not null,
    first_name 	varchar(15) not null,
    last_name 	varchar(15) not null,
    phone		CHAR(11) NOT NULL
);
insert into delivery_partner(partner_id, first_name, last_name, phone) 
values (1, "delivery_1", "delivery_last", "12784");insert into delivery_partner(partner_id, first_name, last_name, phone) 
values (2, "delivery_2", "delivery_last2", "12784454");

-- collection of zip codes representing areas we can deliver to;
-- check order zipcode against this when order being placed
-- the assigned parner is responsible for all orders with a specific zipcode
drop table if exists delivery_zone;
create table delivery_zone(
	zipcode	CHAR(5) NOT NULL PRIMARY KEY,
    partner_id	int not null,
    FOREIGN KEY (partner_id) REFERENCES delivery_partner(partner_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);
insert into delivery_zone(zipcode, partner_id) values ('02114', 1), ('02115', 2);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	cid 		INT NOT NULL AUTO_INCREMENT,
	c_fname		VARCHAR(64) NOT NULL,
    c_lname		VARCHAR(64) NOT NULL,
    email		VARCHAR(64) NOT NULL UNIQUE,
    pwd			VARCHAR(64) NOT NULL,	-- add mininum len requirement?
    phone		CHAR(11) NOT NULL,
    street		VARCHAR(64) NOT NULL,
    apt			VARCHAR(8),
    city		VARCHAR(64) NOT NULL,
    zip			CHAR(5) NOT NULL,
    PRIMARY KEY (cid)
);
insert into customer(c_fname, c_lname, email, pwd, phone, street, apt, city, zip) values
("user2", "user1lname", "zyx@123.com", "234423", "123123123", "st123", "5", "Bos", "02114"); 
drop table if exists coupon;
create table coupon(
	coupon_code varchar(10) primary key not null,
    coupon_discount_amt float not null default 0.10,
    coupon_expiration_date date default NULL,
    coupon_description varchar(64)
);
insert into coupon(coupon_code) values ('SANTA'), ('ISF2023'), ('Summer2024'), ('Fall2023');
insert into coupon(coupon_code, coupon_discount_amt, coupon_expiration_date, coupon_description) values 
('', 0, date("9999-01-01"), 'Default empty coupon.');

drop table if exists payment;
create table payment(
	payment_type varchar(16) primary key not null,
    img VARCHAR(64),
    payment_text VARCHAR(64),
    bg_color VARCHAR(64)
);

INSERT INTO payment(payment_type, img, payment_text, bg_color) VALUES 
('Credit/Debit', '/credit.png', 'text-black', 'bg-green-200'),  
('Venmo', '/venmo.png', 'text-white', 'bg-blue-600'),            
('Zelle', '/zelle.png', 'text-white', 'bg-purple-600'),    
('PayPal', '/paypal.png', 'text-black', 'bg-yellow-400');        

UPDATE payment
SET img = '/credit.png', payment_text = 'text-black', bg_color = 'bg-green-200'
WHERE payment_type = 'Credit/Debit';

UPDATE payment
SET img = '/venmo.png', payment_text = 'text-white', bg_color = 'bg-blue-600'
WHERE payment_type = 'Venmo';

UPDATE payment
SET  bg_color = 'bg-red-600'
WHERE payment_type = 'Zelle';

UPDATE payment
SET img = '/paypal.png', payment_text = 'text-black', bg_color = 'bg-yellow-400'
WHERE payment_type = 'PayPal';

select  * from payment;


DROP TABLE IF EXISTS order_invoice;
CREATE TABLE order_invoice (
	order_id 	INT NOT NULL AUTO_INCREMENT,
    customer_id	INT NOT NULL,
    payment_type varchar(16) NOT NULL,
    coupon_code varchar(10) DEFAULT NULL,		-- limit 1 coupon per order for simpliciy
    order_date	DATETIME DEFAULT CURRENT_TIMESTAMP,		-- should be automatically generated, need to 
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(cid) 
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (payment_type) REFERENCES payment(payment_type) 
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (coupon_code) REFERENCES coupon(coupon_code) 
		ON UPDATE CASCADE ON DELETE RESTRICT
);
INSERT INTO order_invoice (customer_id, payment_type, coupon_code)
VALUES (1, 'Credit/Debit', 'ISF2023');



DROP TABLE IF EXISTS delivery;
CREATE TABLE delivery ( 
    order_id INT NOT NULL,
    delivery_partner_id INT NOT NULL,
    expected_delivery_date DATE NOT NULL,
    delivery_status ENUM("placed", "in-transit", "delivered"),
    
    PRIMARY KEY(order_id),
    FOREIGN KEY(order_id) REFERENCES order_invoice(order_id)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(delivery_partner_id) REFERENCES delivery_partner(partner_id)
		ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE delivery 
ADD COLUMN status_update_trigger INT DEFAULT 0;

DROP TABLE IF EXISTS order_item;
CREATE TABLE order_item (
	order_id 	INT NOT NULL,
    p_name		VARCHAR(64) NOT NULL,	-- unique alternative key
    quantity	INT NOT NULL,
    PRIMARY KEY (order_id, p_name),
    FOREIGN KEY (order_id) REFERENCES order_invoice(order_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (p_name) REFERENCES product(p_name)
		ON UPDATE CASCADE ON DELETE CASCADE
);
insert into order_item(order_id, p_name, quantity) values
(1, 'scallop sashimi 1lb', 3)


