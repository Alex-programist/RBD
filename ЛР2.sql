/*drop database Avtosalon;*/
create database if not exists Avtosalon; #створюемо базу данних
use Avtosalon;#використовуєм цю бвзу данних
create table if not exists shopper( kod_shopper int auto_increment primary key, #cтворюемо таблицю покупець з головним полем код_покупця який автомаично заповнюється лічильником
                      last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      phone_shopper varchar(15) check(phone_shopper like "+__(___)_______"),#для цього поля є перевірка на формат введення 
                      address varchar(150) default null);#для цього поля є початкове значення NULL
create table if not exists seller ( kod_seller int auto_increment primary key,#cтворюемо таблицю покупець з головним полем код_продавця який автомаично заповнюється лічильником
					  last_name varchar(44),
                      forename varchar(44),
                      fist_mame varchar(44),
                      sex varchar(10),
                      position varchar(44),
                      phone_seller varchar(15) check(phone_seller like "+__(___)_______"),#для цього поля є перевірка на формат введення 
                      address varchar(150) default null,#для цього поля є початкове значення NULL
                      number_car_dealership int);
create table if not exists car ( id_car int auto_increment primary key,#cтворюемо таблицю "Машина" з головним полем код_машини який автомаично заповнюється лічильником
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
create table if not exists sales(kod_sales int auto_increment primary key, #cтворюемо таблицю "Продажі" з головним полем код_продажі який автомаично заповнюється лічильником
                   kod_shopper int,
                   kod_seller int,
                   id_car int,
                   date_of_sale date,
                   amount int,
                   purchase_amount float);
create table if not exists manufactures( kod_manufactures int auto_increment primary key,# cтворюемо таблицю "Виробник" з головним полем код_виробника який автомаично заповнюється лічильником
                           name_manufactures varchar(44),
                           country_manufactures varchar(44));
create table if not exists car_dealership(number_car_dealership int auto_increment primary key,#cтворюемо таблицю "Автосалон" з головним полем код_автосалонку який автомаично заповнюється лічильником
						    name_car_dealership varchar(44),
                            address_car_dealership varchar(150) default null,#для цього поля є початкове значення NULL
                            phone_car_dealership varchar(15) check(phone_car_dealership like "+__(___)_______"),#для цього поля є перевірка на формат введення 
                            Email varchar(44)check(Email like "%@%.%"));#для цього поля є перевірка на формат введення 
create table if not exists type_of_body (kod_type_of_body int auto_increment primary key,#cтворюемо таблицю "тип кузова" з головним полем код_типу_кузова який автомаично заповнюється лічильником
										 forename_body varchar(44));
create table if not exists kind_of_fuel (kod_kind_of_fuel int auto_increment primary key,#cтворюемо таблицю "вид топлива" з головним полем код_вид_палива який автомаично заповнюється лічильником
										forename_fule varchar(44));
create table if not exists KPP (kod_KPP int auto_increment primary key,#cтворюемо таблицю "тип КПП" з головним полем код_KПП який автомаично заповнюється лічильником
                                forename_KPP varchar(44));
create table if not exists type_of_drive(kod_type_of_drive int auto_increment primary key,#cтворюемо таблицю "тип приовду" з головним полем код_тип_приводу який автомаично заповнюється лічильником
                                         forename_drive varchar(44));                            
alter table sales add foreign key (kod_shopper) references shopper(kod_shopper) on update cascade on delete cascade;#поле код_покупця з талиці продажі з'єднане з полем код_покупця талиці покупець з каскадним оновленням та видаленням 	
alter table sales add foreign key(kod_seller) references seller(kod_seller) on update cascade on delete cascade;#поле код_продавця з талиці продажі з'єднане з полем код_продавця талиці продавець з каскадним оновленням та видаленням
alter table sales add foreign key(id_car) references car(id_car) on update cascade on delete cascade;#поле ід_машини з талиці продажі з'єднане з полем ід_машини талиці "Машина" з каскадним оновленням та видаленням
alter table car add foreign key(type_of_body) references type_of_body(kod_type_of_body) on update cascade on delete cascade; #поле тип_кузова з талиці "машина" з'єднане з полем код_тип_кузова талиці "тип_кузова" з каскадним оновленням та видаленням   
alter table car add foreign key(kind_of_fuel) references kind_of_fuel(kod_kind_of_fuel) on update cascade on delete cascade;#поле вид_топлива з талиці "машина" з'єднане з полем код_вид_топлива талиці "вид_топлива" з каскадним оновленням та видаленням   
alter table car add foreign key(KPP) references KPP(kod_KPP) on update cascade on delete cascade; #поле КПП з талиці "машина" з'єднане з полем код_КПП талиці "КПП" з каскадним оновленням та видаленням   
alter table car add foreign key(type_of_drive) references type_of_drive(kod_type_of_drive) on update cascade on delete cascade;#поле тип_привода з талиці "машина" з'єднане з полем код_тип_привода талиці "тип_привода" з каскадним оновленням та видаленням      
alter table car add foreign key(kod_manufactures) references manufactures(kod_manufactures) on update cascade on delete cascade;#поле код_виробника з талиці "машина" з'єднане з полем код_ввиробника талиці "виробник" з каскадним оновленням та видаленням                       
alter table seller add foreign key(number_car_dealership) references car_dealership (number_car_dealership) on update cascade on delete cascade;#поле номер автосалону з талиці "продавець" з'єднане з полем номер автосалону талиці "автосалон" з каскадним оновленням та видаленням   
INSERT INTO shopper (kod_shopper, last_name, forename, fist_mame, sex,phone_shopper,address ) VALUES ('1', 'Мадяр', 'Олександр', 'Анатолійович', 'Чоловіча','+38(066)0895349','м.Чернівці');#зроблено одни запис в таблицю покупець 
select*from shopper;       
