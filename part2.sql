#PART 2
#a
insert into employees values (1002, ‘Olsen’, 67226, ‘2006-09-13’);
#Fejlen er brug af accenter i stedet for apostrofer
INSERT INTO employees
values(1002, 'Olsen', 67226, '2006-09-13');

#b
insert into odetails values (1020, 10900);
#qty mangler en standard værdi
insert into odetails values (1020, 10900, null);

#c
insert into employees values (1004, ‘Jensen’, 66666, ‘2006-09-15’);
#Fejlen er brug af accenter i stedet for apostrofer
insert into employees values (1004, 'Jensen', 66666, '2006-09-15');

#d
insert into parts values (11000, Harry Potter, 12, 23.25, 12);
#Harry Potter skal pakkes ind i apostrofer
insert into parts values (11000, 'Harry Potter', 12, 23.25, 12);

#e
insert into parts values (11001, ‘Marx Brothers’, 10, -22.99, 20);
#Fejlen er brug af accenter i stedet for apostrofer
insert into parts values (11001, 'Marx Brothers', 10, -22.99, 20);

#f
update zipcodes set values (city=’Los Angeles’) where zip=67226;
#fixed
update zipcodes set city='Los Angeles' where zip=67226;
