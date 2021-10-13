/*drop database Avtosalon;*/
create database Avtosalon;
use Avtosalon;
create table if not exists shopper( kod_shopper int auto_increment primary key,
                      last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      phone_shopper varchar(15) check(phone_shopper like "+__(___)_______"),
                      address varchar(150) default null);
create table if not exists seller ( kod_seller int auto_increment primary key,
					  last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      position varchar(44),
                      phone_seller varchar(15) check(phone_seller like "+__(___)_______"),
                      address varchar(150) default null,
                      number_car_dealership int);
create table if not exists car ( id_car int auto_increment primary key,
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
create table if not exists sales(kod_sales int auto_increment primary key,
                   kod_shopper int,
                   kod_seller int,
                   id_car int,
                   date_of_sale date,
                   amount int,
                   purchase_amount float);
create table if not exists manufactures( kod_manufactures int auto_increment primary key,
                           name_manufactures varchar(44),
                           country_manufactures varchar(44));
create table if not exists car_dealership(number_car_dealership int auto_increment primary key,
						    name_car_dealership varchar(44),
                            address_car_dealership varchar(150) default null,
                            phone_car_dealership varchar(15) check(phone_car_dealership like "+__(___)_______"),
                            Email varchar(44)check(Email like "%@%.%"));
create table if not exists type_of_body (kod_type_of_body int auto_increment primary key,
										 forename_body varchar(44));
create table if not exists kind_of_fuel (kod_kind_of_fuel int auto_increment primary key,
										forename_fule varchar(44));
create table if not exists KPP (kod_KPP int auto_increment primary key,
                                forename_KPP varchar(44));
create table if not exists type_of_drive(kod_type_of_drive int auto_increment primary key,
                                         forename_drive varchar(44));                             
alter table sales add foreign key (kod_shopper) references shopper(kod_shopper) on update cascade on delete cascade;	
alter table sales add foreign key(kod_seller) references seller(kod_seller) on update cascade on delete cascade;
alter table sales add foreign key(id_car) references car(id_car) on update cascade on delete cascade;
alter table car add foreign key(type_of_body) references type_of_body(kod_type_of_body) on update cascade on delete cascade;    
alter table car add foreign key(kind_of_fuel) references kind_of_fuel(kod_kind_of_fuel) on update cascade on delete cascade;
alter table car add foreign key(KPP) references KPP(kod_KPP) on update cascade on delete cascade;
alter table car add foreign key(type_of_drive) references type_of_drive(kod_type_of_drive) on update cascade on delete cascade;   
alter table car add foreign key(kod_manufactures) references manufactures(kod_manufactures) on update cascade on delete cascade;                    
alter table seller add foreign key(number_car_dealership) references car_dealership (number_car_dealership) on update cascade on delete cascade;
select*from shopper;       
select*from seller;
select*from car;
select*from sales;
select*from manufactures;
select*from car_dealership;
select*from type_of_body;
select*from kind_of_fuel;
select*from kpp;
select*from type_of_drive;
                    
                           
                   
                      
                      
                      
