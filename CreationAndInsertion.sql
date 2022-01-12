create database mssqlpractise
use mssqlpractise
create table Departmental_STORE(
ProductID int,
ProductNAME varchar(100),
Price int,
DepatmentNAME varchar(100),
ManufacturingYEAR int
);
select * from Departmental_STORE
insert into Departmental_STORE(ProductID, ProductNAME, Price, DepatmentNAME, ManufacturingYEAR) values('1', 'Soap', '20', 'Daily Neads', '2021')
insert into Departmental_STORE values('2', 'Notebook', '30', 'Stationary', '2022')
insert into Departmental_STORE values('3', 'Wheat', '170', 'Eatables', '2022')
insert into Departmental_STORE values('4', 'Sugar', '45', 'Eatables', '2022')
insert into Departmental_STORE(ProductID, ProductNAME, Price, ManufacturingYEAR) values('5', 'Room Freshner', '85', '2021')
insert into Departmental_STORE(ProductID, ProductNAME, Price, DepatmentNAME) values('6', 'Mop', '60', 'Daily Neads')
