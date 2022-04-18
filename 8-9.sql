create table if not exists shopper( kod_shopper int generated always as identity primary key,
                      last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      phone_shopper varchar(15),
                      address varchar(150) default null,
					  q varchar(44),
					  qq varchar(44));
create table if not exists seller ( kod_seller int generated always as identity primary key,
					  last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      position_p varchar(44),
                      phone_seller varchar(15),
                      address varchar(150) default null,
					  number_car_dealership int );
create table if not exists car ( id_car int generated always as identity primary key,
				   brand_car varchar(44),
                   model varchar(44),
                   kod_manufactures int,
                   color varchar(44),
                   date_of_manufacture date,
                   type_of_body int,
                   kind_of_fuel int,
                   KPP int,
                   type_of_drive int,
                   Engine_capacity varchar(15),
                   power varchar(15),
                   number_of_doors int,
                   number_of_seats int,
                   additionally varchar (99));
create table if not exists sales(kod_sales int generated always as identity primary key,
                   kod_shopper int,
                   kod_seller int,
                   id_car int,
                   date_of_sale date,
                   amount int,
                   purchase_amount float);
create table if not exists manufactures( kod_manufactures int generated always as identity primary key,
                           name_manufactures varchar(44),
                           country_manufactures varchar(44));
create table if not exists car_dealership(numder_car_dealership int generated always as identity primary key,
						    name_car_dealership varchar(44),
                            address_car_dealership varchar(150) default null,
                            phone_car_dealership varchar(15),
                            Email varchar(44));
create table if not exists type_of_body (kod_type_of_body int generated always as identity primary key,
										 forename_body varchar(44));
create table if not exists kind_of_fuel (kod_kind_of_fuel int generated always as identity primary key,
										forename_fule varchar(44));
create table if not exists KPP (kod_KPP int generated always as identity primary key,
                                forename_KPP varchar(44));
create table if not exists type_of_drive(kod_type_of_drive int generated always as identity primary key,
                                         forename_drive varchar(44));                             
alter table sales add foreign key (kod_shopper) references shopper(kod_shopper) on update cascade on delete cascade;	
alter table sales add foreign key(kod_seller) references seller(kod_seller) on update cascade on delete cascade;
alter table sales add foreign key(id_car) references car(id_car) on update cascade on delete cascade;
alter table car add foreign key(type_of_body) references type_of_body(kod_type_of_body) on update cascade on delete cascade;    
alter table car add foreign key(kind_of_fuel) references kind_of_fuel(kod_kind_of_fuel) on update cascade on delete cascade;
alter table car add foreign key(KPP) references KPP(kod_KPP) on update cascade on delete cascade;
alter table car add foreign key(type_of_drive) references type_of_drive(kod_type_of_drive) on update cascade on delete cascade;
--ALTER TABLE seller ADD salary varchar(44);
--ALTER TABLE seller ADD date_nar date;
--select*from seller;
--drop table seller;
--insert into seller(last_name, forename, fist_mame,address,salary) Values ('Безушко','Максим','Віорелович','Чернівці','1500'),('Атвіновський','Олексій','Ігорович','Харків','1200'),('Рацой','Олександр','Васильвич','ЛЬвів','1000');
--ALTER TABLE seller drop COLUMN salary ;
--ALTER TABLE seller ADD salary1 float;
--ALTER TABLE car ADD price float;
--insert into shopper (last_name, forename, fist_mame,address) Values ('SAvitskuur','gergger','ergerge','efwfew');#добавлення одного запису
--insert into shopper (last_name, forename, fist_mame,address) Values ('Madiar','Oleksander','Anatolyevich','Chernivtsi'),('Zaitsev','Artem ','Olegovich','Chernivtsi');--#добавлення групи записів
--UPDATE shopper SET address = 'Chernivtsi' WHERE address = 'efwfew';#модифікація поля за умови
--DELETE FROM shopper WHERE address = 'efwfew';#видалення записів за умовою
--DELETE FROM shopper;#видалення всіх записів
--DELETE FROM shopper WHERE kod_shopper=2;#видалення конкретного запису
--LOAD DATA INFILE 'D:\\Робота\\Коледж\\РБД\\text.txt' INTO TABLE shopper;
--COPY shopper FROM PROGRAM 'dir C:\data/text' WITH (format 'csv');
--COPY shopper FROM 'D:\\Робота\\Коледж\\РБД\\text.txt' WITH (FORMAT csv);
--\copy shopper FROM 'D:\\Робота\\Коледж\\РБД\\text.txt' DELIMITER ',' CSV;
--COPY shopper FROM 'D:\\Робота\\Коледж\\РБД\\text.txt' DELIMITER ',' CSV HEADER;
--INSERT shopper FROM 'D:\Робота\Коледж\РБД\text.txt'
--WITH (fieldterminator = '	', rowterminator = '\n');
--insert into shopper
--  SELECT a.*  
--  FROM OPENROWSET( BULK 'D:\Робота\Коледж\РБД\text.txt', FORMATFILE = 'D:\Робота\Коледж\РБД\text.txt') AS a;
/*create table if not exists shopper_1( idq int generated always as identity primary key,
                      last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      phone_shopper varchar(15),
                      address varchar(150) default null);
create table if not exists seller_1( idq int generated always as identity primary key,
                      last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      phone_shopper varchar(15),
                      address varchar(150) default null);*/
--insert into shopper_1 (last_name, forename, fist_mame,address) Values ('SAvitskuur','gergger','ergerge','efwfew');
--insert into seller_1 (last_name, forename, fist_mame,address) Values ('SAvitskuur','gergger','ergerge','efwfew');
--insert into seller_1 (last_name, forename, fist_mame,address) Values ('пкпукп','gerукпукпgger','erукпупgerge','eукпfwfew');
--insert into shopper_1 (last_name, forename, fist_mame,address) Values ('ergerg','jtjyjt','ergetyjtyjtyrge','eftyjywfew');
--SELECT * FROM shopper_1 UNION ALL SELECT * FROM seller_1;#об'єднання таблиць(всі записи)
--SELECT * FROM shopper_1 INTERSECT SELECT * FROM seller_1; #запит на претен таблиць 
--select idq, last_name from shopper_1 union select idq,last_name from seller_1; #запит на об'єднання талиць (контретні поля)
--drop table seller_1;
--drop table shopper_1;
--select* from shopper_1;
--select* from seller_1;
--drop table sales11;
--SELECT last_name, forename FROM shopper_1 EXCEPT SELECT last_name, forename FROM seller_1;#запит на побудову різниці
--select * from shopper_1, seller_1; #запит на виконання декартового добутку
--create view
--select *from shopper;

--ЛР6--

--1--
--create view coment2 as select distinct last_name,forename from shopper;   
--select*from coment2;
--2--
--create view coment5 as select distinct last_name,date_of_sale from shopper,sales; 
--select*from coment5;
--3--
--select*from car where date_of_manufacture >='2002.04.20' and date_of_manufacture<='2002.12.20';
--4--
--select sales.kod_shopper, sales.id_car, sales.amount, shopper.last_name , shopper.forename from sales,shopper where sales.kod_shopper=shopper.kod_shopper;
--drop table sales;
--drop table car;
--insert into car ( brand_car, model,kod_manufactures,date_of_manufacture) Values ('vsdvsvs','vwvewwev','1','2002.12.21'),('efewf','fwefwe','1','2002.04.20'),('efewf','fwefwe','1','2002.06.20'),('efewf','fwefwe','1','2002.02.20');
--insert into sales (kod_shopper,id_car,amount,date_of_sale)Values ('1','1','22','2002.12.20');
--5--
--select sales.kod_shopper, sales.id_car, sales.amount, shopper.last_name , shopper.forename, car.date_of_manufacture from sales,shopper,car where sales.kod_shopper=shopper.kod_shopper and sales.date_of_sale>car.date_of_manufacture; 
--select*from car;

--ЛР7--

--1--
--1.Відобразити всіх працівників.+
--2.Відобразити всіх клієнтів.+
--3.Відобразити всі авто з їхніми характеристиками.+
--4.Відобразити всі авто німецького виробика.+
--5.Відобразати дні коли вартість продаж =5000.+
--6.Відобразити автосалони, які знаходяться в місті Чернівці.+
--7.Відобразити всіх авто в яких не доповненна інформація про них.+
--8.Відобразити всі авто рік випуску якого <2006 >2010.+
--9.Відобразити клієнтів, які проживають в місті Чернівці.+
--10.Відобразити 3 авто дата виготовлення яких = 2005.05.30.+
--11.Відобразити відсотований список авто за назвою.+
--12.Відобразити всіх працівників їх продажі.+
--13.Відобразити всі авто в є додаткова інформація.+
--14.Відобразити клієнтів, які не проживають в місті Чернівці.+
--15.Відобразити авто, в яких дата виготовлення пізніша ніж дата продажі.+
--2--
--1--select*from seller;

--2--select*from shopper;

--3--select*from car;

--4--insert into manufactures(name_manufactures,country_manufactures) values ('Volkswagen','Germany');
--insert into car(brand_car,kod_manufactures) values ('Volkswagen','1'),('Audi','1');
--select*from manufactures; 
--select*from car where car.kod_manufactures='1';
--drop table sales;
--insert into sales(kod_shopper,id_car,date_of_sale,purchase_amount) values ('1','1','2003.03.03','5000'),('1','2','2003.04.04','4000'),('2','5','2003.01.04','6000');
--SELECT * FROM sales  WHERE purchase_amount =5000;

--insert into car_dealership(name_car_dealership,address_car_dealership) values ('qwqw','Чернівці'),('ggg','Киів');
--SELECT * FROM car_dealership  WHERE address_car_dealership LIKE 'Чернівці%' any 'Харків';
--SELECT * FROM car_dealership WHERE address_car_dealership LIKE ANY (ARRAY ['Чернівці%']);

--select *from car where additionally is null;
--insert into car(brand_car,kod_manufactures,date_of_manufacture) values ('Volkswagen','1','2005.05.30'),('Audi','1','2007.11.11'),('Merz','1','2012.03.03'),('Volkswagen','1','2005.05.30'),('Volkswagen','1','2005.05.30'),('Volkswagen','1','2005.05.30'),('Volkswagen','1','2005.05.30'),('Volkswagen','1','2003.03.03');
--select* from car where date_of_manufacture between '2006.12.12' and '2010.10.10';

--select forename,last_name, address from shopper where address in('Чернівці');

--select *from car where date_of_manufacture ='2005.05.30' limit 5;

--select *from car order by brand_car;

--select sales.kod_shopper, sales.id_car, sales.purchase_amount from sales,shopper where sales.kod_shopper=shopper.kod_shopper;
--select *from sales;
--select *from car where additionally is not null;

--select forename,last_name,address from shopper where address not in('Чернівці');
--select*from shopper;
--select*from car;
--drop table shopper;
--insert into shopper(last_name, forename, fist_mame,address) Values ('Мадяр','Олександр','Анатолійович','Чернівці'),('Зайцев','Артем','Олегович','Харків');
--select shopper.kod_shopper,sales.date_of_sale,car.date_of_manufacture,shopper.last_name,shopper.forename from sales,car,shopper where sales.kod_shopper=shopper.kod_shopper and sales.date_of_sale=car.date_of_manufacture; 
                   
				   
				    
					
					
					                  --ЛР8--
--Вивести перелік клієнтів відсортованих за прізвищем в алфавітному порядку.
--select kod_shopper,last_name,forename,fist_mame,address from shopper order by last_name;  
--select *from shopper;

--Вивести перелік працівників відсортованих за датою народження.
--select last_name,forename,fist_mame,address,date_nar from seller order by date_nar;  
--select*from seller;

--Вивести перелік авто відсортовиних за полем модель та рік випуску.
--select *from car order by model,date_of_manufacture;
--select*from car;

--Вивести перелік авто відсортованих за ціною в порядку:
--1.зростання;
--select brand_car,model,kod_manufactures,price from car order by price asc;
--select brand_car,model,kod_manufactures,price from car;

--2.спадання;
--select brand_car,model,kod_manufactures,price from car order by price desc;

--Вивести перелік працівників відсортованих за зарплатою в порядку спадання:
--select last_name,forename,fist_mame,salary from seller order by salary desc;

--Вивести перелік 4 найновіших(по року випуску) доступних авто для продажу.
--SELECT brand_car,model,date_of_manufacture FROM car ORDER BY date_of_manufacture DESC LIMIT 4;
--select brand_car,model,date_of_manufacture from car;

--select*from seller;
--select *from sales;
 
--Запит містить стовпці моделі та код виробника з таблиці авто.
--select *from car;
--select brand_car, kod_manufactures from car group by brand_car, kod_manufactures; 

--Вивести суму вартості авто по кожному виробнику.
--select brand_car, sum(price) as price from car group by brand_car;

--Вивести суму продажів по кожному дню.
--Select date_of_sale paid_date, SUM(purchase_amount) as "Сума" FROM sales GROUP BY date_of_sale;







                                      --ЛР9--
--Вивести загальну кількість авто.
--select count(brand_car) as "Кількість авто" from car; 

--Вивести вартість найдорощого авто.
--select max(price) as "Вартість найдорощого авто" from car;

--Вивести вартість найдешевшого авто.
--select min(price) as "Вартість найдешевшого авто" from car;

--Вивести загальний обєм продаж.
--select*from sales;
--SELECT SUM(purchase_amount) AS "Сума всіх продаж" FROM sales;

--Вивести середю заробітню плату серед працівників.
--select avg(salary) as "Середня заробітня плата" from seller;

--select brand_car, count(model) as "Кількість авто кожного виробника" from car group by brand_car;
