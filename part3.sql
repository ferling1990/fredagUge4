# Opgave 4 part 3
# Statements skal skives i rækkefølge således at data der har foreign keys der peger på sig,
# oprettes først.
use mydb;

insert into  zipcodes values
 (2000,'Frederiksberg');
insert into employees values
  (2099,'Mads',2000,'2005-12-12');
insert into parts values
  (19506,'MYSQL programming vol 1',199,19.99,20);
insert into customers values
  (9999,'Jonatan','VED HAVNEN',2000,'666-666-6666');
insert into orders values
  (19999,9999,2099,'2010-12-10','2011-12-12');
insert into odetails values
  (19999,19506,2);
  
  commit;