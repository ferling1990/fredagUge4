#1. (G) The names of all customers
select cname
from customers;

#2. The names of products of which there are at least 150 pieces in stock
select *
from parts
where parts.qoh > 150;

#3. Names and zip codes of all customers with a phone number which ends with ’55’.
select cname, zip
from customers
where phone like '%%%-%%%-%%55';

#4. Names of products which cost less than 18.00
select pname, price
from parts
where price < 18;

#5.The name and city of all customers
select customers.cname, zipcodes.city
from customers join zipcodes
where customers.zip = zipcodes.zip;

#6. Order numbers for orders made by an employee named’Jones’
select orders.ono, employees.ename
from orders join employees
where employees.ename = 'Jones'; 

#7. Customer name and order number for all orders, where the customers address begins with ‘1’.
select customers.cname, orders.ono, customers.street
from customers join orders, zipcodes
where zipcodes.zip = customers.zip and customers.street like '1%';

#8 All information about employees and the cities they live in. Include information about cities without employees (Hint: outer join).
select employees.*, zipcodes.city
from employees join zipcodes
where zipcodes.zip = employees.zip;

#9. Customer names and order numbers for all orders withcustomer that live in ”Los Angeles”
select customers.cname, orders.ono, zipcodes.city
from customers join orders, zipcodes
where zipcodes.zip = customers.zip and zipcodes.city = 'Los Angeles';

#10. A list with name, quantity, price and total price for all products on the order with order number 1020.
select ono, pname, qoh, price, qoh*price as totalprice
from parts, orders
where ono = 1020;

#11. The price of all orders combined.
select sum(odetails.qty*parts.price) as ordersum
from odetails, parts; 

#12. Order numbers for orders which have not yet been delivered. 
SELECT * 
FROM orders
where orders.recieved is null;

#13. The order number, number of line items, the customer’sname, street, zip code and city
select odetails.ono, odetails.qty, customers.cname, customers.street, customers.zip, zipcodes.city
from odetails natural join customers, zipcodes; 

#14. The names of customers who have made an order with an employee who lives in ’Los Angeles’
select distinct customers.cname AS customers_with_orders_from_employees_who_lives_in_LA
from customers join employees, orders
where orders.cno = customers.cno and orders.eno = employees.eno and employees.zip = 67226;

#15. Order number and total price of the entire order – for all orders
select SUM(parts.price*odetails.qty) as TotalPrice, orders.ono
from orders join odetails, parts
where odetails.ono = orders.ono and odetails.pno = parts.pno
group by orders.ono;


