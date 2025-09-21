 -- SQL -PROJECT -ONLINE  food DELIVERY --
 create  database  ONLINE_food_DELIVERY;
 # useing the databases
 use ONLINE_food_DELIVERY;
 
 #table designs 
 -- 1.CUSTOMERS:WHO ORDERS THE FOOD;
 -- 2. RESTAURANT:RESTAURANTS THAT SELL FOOD
--  3. MENU:FOOD ITEMS OFFERED BY RESTAURANTS
 -- 4.ORDER:EACH ORDER PLACED 
 -- 5.ORDER_ITEMS:FOOD ITEMS INSIDE AN ORDER 
 -- 6.DELIVERY_PERSON:DELIVERY PARTNERS
 -- 7.PAYMENTS:ORDER PAYMENTS
 #table CREATION
 
 -- 1.CUSTOMERS TABLE-
 CREATE TABLE CUSTOMERS (
 CUSTOMERS_ID INT primary KEY auto_increment,
 name varchar(20),
 phone varchar(50),
 address varchar(100)
 );
 -- insert VALUES INTO CUSTOMERS TABLE
 insert into CUSTOMERS(NAME,PHONE,ADDRESS)VALUES
 ("ANKI",8630209557,"BANGLORE"),
 ("ANIL",9142209558,"vizag"),
("SAI",8945678908,"hyderabad"),
("DHARNI",5689073455,"dhone"),
 ("MADHU",4566890456,"kunool"),
 ("HEMATH",8630207890,"chittor"),
 ("DHANESH",8630209559,"banglore"),
 ("SONI",7830229557,"hyderabada"),
 ("SUCHI",9830206557,"BANGLORE"),
 ("TONY",8630209887,"vizg"),
 ("MALLI",8231129557,"chittor"),
 ("PAVANI",8882089557,"kunool");
 select*from CUSTOMERS;
 
 -- 2. RESTAURANTS TABLE --
 CREATE TABLE RESTAURANTS(
 RESTAURANTS_ID INT primary KEY auto_increment,
 NAME varchar(30),
 LOACTION  varchar(50)
 );
  -- INSERTING VALUES INTO RESTAURANTS TABLE -
  INSERT INTO RESTAURANTS (NAME, LOACTION) VALUES
  ('PIZZA HUT','HYDERABAD'),
   ('DOMINAS','BANGLORE'),
   ('FORESTA','KURNOOL'),
   ('KAIRALI','KERALA'),
   ('MANDI HOUSE', 'HYDERABAD');
      SELECT*FROM RESTAURANTS;
      
CREATE TABLE MENU(
-- 3.MENU TABLE (FOOD ITEMS OFFERED BY resTAURANTS)--
ITEM_ID INT primary KEY auto_increment,
RESTAURANTS_ID INT,
ITEM_NAME VARCHAR(50),
PRICE DECIMAL(6,2),
foreign key(RESTAURANTS_ID) references RESTAURANTS(RESTAURANTS_ID)
);
-- INSERTING VALUES INTO THE MENU TABLE --
INSERT INTO MENU(RESTAURANTS_ID,ITEM_NAME ,PRICE)values
(1,'VEG' ,'200'),
(2,'BURGRER' ,'250'),
(3,'BIYANI' ,'300'),
(4,'PANNER' ,'320'),
 (5,'GOBHI' ,'450'),      
 (1,'EGG RIC' ,'150'),
 (2,'CHICKEN RICE' ,'480'),
 (3,'BIYANI' ,'460'),
 (4,'CHICKEN PULKA' ,'120'),
 (1,'PANER CHSEE ROLL' ,'50'); 
 SELECT*FROM MENU;
  -- 4.ORDERS TABLE --
  CREATE TABLE ORDERS(
  ORDERS_ID INT PRIMARY KEY AUTO_INCREMENT,
  CUSTOMERS_ID INT,
  RESTAURANTS_ID INT,
  ORDERDATE datetime,
  STATUS VARCHAR(20),
  FOREIGN  KEY ( CUSTOMERS_ID) REFERENCES CUSTOMERS(CUSTOMERS_ID),
  FOREIGN KEY  (RESTAURANTS_ID) REFERENCES RESTAURANTS (RESTAURANTS_ID)
  );
   -- INSERT VALUES INTO THE ORDERS --
   INSERT INTO ORDERS (CUSTOMERS_ID,RESTAURANTS_ID,ORDERDATE, STATUS ) VALUES
   (1,1,NOW(),'PACKING'),
   (5,3,NOW(),'DELIVERED'),
   (6,2,now(),'preparing'),
   (5,5,now(),'WAITING FOR PARTNER'),
   (5,2,NOW(),'ON THE WAY'),
   (3,4,NOW(), 'PREPARING');
   select *FROM ORDERS;
   
   -- 5.ORSER-ITEMS --
   CREATE TABLE ORDER_ITMES(
   ORDERITEM_IS INT primary KEY auto_increment,
   ORDERS_ID INT,
     ITEM_ID INT,
   QUANTIY_ID INT,
   foreign key(ORDERS_ID) references ORDERS(ORDERS_ID),
   foreign key  (ITEM_ID) references MENU(ITEM_ID)
   );
   
   -- insert values into the order_times tables --
   INSERT INTO  ORDER_ITMES(ORDERS_ID,ITEM_ID ,QUANTIY_ID) VALUES 
   (1,1,2),
   (3,4,2),
   (2,2,1),
   (3,4,4),
   (2,3,2);
   SELECT*FROM ORDER_ITMES;
   
   -- 6.DELIVERY PERSON TABLE --
   CREATE TABLE DELIVERY_person(
   NAME VARCHAR(50),
   PHONE VARCHAR(15),
   VEHICLE VARCHAR(28)
   );
   -- INSERT VALUES INTO THE DELIVERY_PERSON --
   INSERT INTO DELIVERY_person (NAME,PHONE,VEHICLE) VALUES
   ('ARJUU',346789065,'BIKE'),
   ('RAVI', 6789003677,'BIKE'),
   ('SHESTY', 7890347889,'SCOOTER'),
   ('RAM',345690078,' SCOOTER'),
   ('VARMA',34569123788,'BIKE');
   SELECT*FROM DELIVERY_person;
   
   -- 7.PAYMENT TABLE
   CREATE TABLE PAYMENTS(
   ORDERS_ID INT,
   AMOUNT DECIMAL(8,2),
   PAYMENT_METHOD VARCHAR(20),
   PAYMENT_STATUS VARCHAR(20),
   FOREIGN KEY (ORDERS_ID) references ORDERS(ORDERS_ID)
   );
   
   -- INSERING VALUES INTO THE PAYMENTS TABLE --
   INSERT INTO PAYMENTS( ORDERS_ID, AMOUNT ,PAYMENT_METHOD,PAYMENT_STATUS)VALUES 
   (1,650,'UPI','SUCCESS'),
   (2,300,'CASH','PENDING'),

   (4,630,'UPI','SUCCESS'),
   (5,700,'CASH','PENDING'),
   (3,630,'UPI','SUCCESS');
    select*from CUSTOMERS;
    SELECT*FROM RESTAURANTS;
    SELECT*FROM ORDER_ITMES;
   SELECT*FROM PAYMENTS;
   SELECT*FROM DELIVERY_person;
   select*from CUSTOMERS;
   SELECT*FROM RESTAURANTS;
    SELECT*FROM MENU;
    select*from orders;
-- QUERIES --
# 1. Show all customers from hyderabad
   select*from customers where address="hyderabad";
   
# 2.List all  restaurants in alphabetical 
select * from RESTAURANTs order by name;

# 3.find food itms priced above 200.
select *from  menu where price>200;

# 4.Get the 3 most expensive menu items 
select* from menu order  by price desc
limit 3;

# 5.show all packing orders
select*from orders where status="packing";

#6.find Customers who live in either hyderabad or banglore 
select * from customers where address ="hyderabad" or  address='banglore';
  -- (or)--
  select* from customers where address in('hyderabad','banglore');
  
# 7.show menu items with price between 150 and 300 in order wise
select*from menu  where price  between 150 and 300 order by price;

# 8.list customer whose name starts with 's'
select* from customers where name like "s%";

# 9. find orders that are not yet delivered 
select* from orders where status <>'delivered';
-- or --
select*from orders where status not in("delivered");

# 10. Find customer whose customerid is greater than 2 
select customers_id,name from customers where customers_id>2;
 # 11.Find payments where amount is greater than 400 and status is Success
 select *from payments where amount>400 and payment_status ='Success';

# 12.Customer names with their orders 
SeLECT C.NAME,O.ORDERS_ID,O.STATUS FROM ORDERS AS O
JOIN 
CUSTOMERS AS C ON O.CUSTOMERS_ID=C.CUSTOMERS_ID;

# 13.SHOW ALL ORDERS  WITH THE CUSTOMER NAME AND ORDER STATUS 
SELECT C.NAME,O.STATUS FROM ORDERS AS O
INNER JOIN 
CUSTOMERS AS C ON C.CUSTOMERS_ID=O.CUSTOMERS_ID;
# 14.SHOW RESTAURANT NAME ALONG WITH FOOD ITEMS AND PRICES
SELECT R.NAME,M.ITEM_NAME,M.PRICE  FROM RESTAURANTS R
 INNER JOIN 
 MENU M ON  M.RESTAURANTS_ID =R.RESTAURANTS_ID;
 
# 15.LIST  MOST EXPENSIVE ITME IN EACH RESTANURANT 
SELECT r.name,m.item_name,m.price from RESTAURANTS r
inner join 
menu  m on m.RESTAURANTS_id = r.RESTAURANTS_id
order by price desc limit 5;
# 16.show all orders with payments methods and payment satus
select p.payment_method ,p.payment_status from payments p
inner join
orders o on o.orders_id=p.orders_id;

# 17.show all customers with their orders(include customers who never ordered
select*from customers c
left join
orders r on c.customers_id=r.customers_id;
# 18.List all menu items and the restaurant they belong to (show  NULL If restaurant is missing).
select* from menu m
left join 
restaurants r on m.restaurants_id=r.restaurant_id;
# 19.show all restaurants with orders(include restaurants that have never received on order).
select*from restaurants r
left join
orders o on  o.restaurants_id=r.restaurants_id;
# 20. List all customer who placed  an order and also show unmatched orders
select*from orders o
right join
customers c on o.customers_id=c.customers_id;

# 21.Display all itmes priced above 200 with restaurant names
-- (include orders even if the restaurant is missing).
select r.name,m.item_name,m.price from restaurants r
right join 
menu m on m.restaurants_id=r.restaurants_id and price>200;

# 22.Find all orders with payment into (include payments even if the order dontn't exist).
select*from payments p
left join
orders o on p.orders_id=o.orders_id;

#23.Display all payments and all orders _regardless of whether they're mathed.
select*from payments p
left join
orders o on p.orders_id=o.orders_id
union
select *from payments p
right join
orders o on p.orders_id=o.orders_id;
# 24.full join customers and orders
select c.customers_id ,c.name,o.orders_id,o.Status
from customers c
left join orders o on c.customers_id=o.customers_id
union
select c.Customers_id ,c.name,o.orders_id,o.status
from customers c
right join orders o on c.customers_id =o.customers_id;

# 25.all  possible combinations of customers and  REstaurants
select c.customers_id ,c.name as customernames,r.restaurants_id,r.name
from customers c
cross join restaurants r;
# 26.Customers with all menu itmes under 300
select c.customers_id ,c.name as customername ,m.item_name,m.price
from customers c
cross join menu m
where m.price < 300;

# 27.count total customers
 select count(*) from customers;
 
# 28.display total itmes in a menu  card
 select count(item_name)from menu;
  
  # 29.Average price of dominas itmes
  select avg(price)
  from menu m
  join restaurants r on m.restaurants_id =r.restaurants_id
  where r.name='dominas';
 
 #30. Highest order amount
 select max(amount) from payments;
 
 #31.total revenue collected
  select sum(amount)from  payments where payment_status ="sucess";
  
 # 32.orders per restaurant
  select r.name,count(o.orders_id) as totalorders
  from restaurants r
  left join orders o on r.restaurants_id =o.customers_id
  group by r.name;
  
  # 33. orders per customers
  select c.name,count(o.orders_id) as totalorders 
  from customers c
  join orders o on c.customers_id =c.customers_id
  group by c.name;
  
  # 34. revenue by restaurant 
  select r.name,sum(p.Amount) as Revenue
  from restaurants r
  join orders o on r.restaurants_id =o.restaurants_id
  join payments p on o.orders_id =p.orders_id
  where p.payment_status='success'
  group by r.name;
  
  # 35.Items sold per restaurant
  select r.name,sum(oi.QUANTIY_id) as itmesSold
  from Order_itmes oi
  join orders o on  oi.orders_id =o.orders_id
  join restaurants r on o.restaurants_id = r.restaurants_id 
  group by r.name;
  
# 36.Customers with less than 2 orders
select c.name,count(o.orders_id) as orderCount
from customers c
join orders o on c.customers_id =o.customers_id
group by c.name
having count(o.orders_id)<3;
# 38.get menu items priced  higher than the average price of all items .
  select item_name, price from menu 
  where price >(select avg(price) from menu);
  
  # 39.customers who never placed an order
  select name from customers 
  where customers_id not in(select distinct customers_id from orders);

# 40.customers who  ordered from more than 2 restanurant 
select name
from customers
where customers_id in (
     select customers_id
     from orders
     group by customers_id 
     having count(distinct restaurants_id)<2
    );

         
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  









  
   
 
 
 
