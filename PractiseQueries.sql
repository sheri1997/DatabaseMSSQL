--creating and executing some database queries
use mssqlpractise
select * from Departmental_STORE
select ProductNAME, Price from  Departmental_STORE
select distinct Price from  Departmental_STORE
select count(distinct Price) from  Departmental_STORE
select * from Departmental_STORE where DepatmentNAME='Eatables'
select * from Departmental_STORE where ManufacturingYEAR=2021
select * from Departmental_STORE where Price>40
select * from Departmental_STORE where Price>40 and ManufacturingYEAR=2022
select * from Departmental_STORE where Price<10 or ManufacturingYEAR=2021
select * from Departmental_STORE where not ManufacturingYEAR=2020
select * from Departmental_STORE where Price>40 and (ManufacturingYear=2022 or DepatmentNAME='Daily Neads');
select * from Departmental_STORE where ManufacturingYEAR is null;
select * from Departmental_STORE where DepatmentNAME is not null;
select * from Departmental_STORE order by Price DESC;
select * from Departmental_STORE order by Price ASC, ProductID DESC
update Departmental_STORE set DepatmentNAME='Home' where ProductID = 5 
select top 2 * from Departmental_STORE where Price >40
select top 50 percent * from Departmental_STORE where ManufacturingYEAR=2022
select min(Price) as MinimumPrice from Departmental_STORE
select max(ProductNAME) as Biggest from Departmental_STORE
select avg(Price) as AveragePrice from Departmental_STORE
select sum(Price) as PriceSUM from Departmental_STORE
select * from Departmental_STORE where ProductNAME like 's%'
select * from Departmental_STORE where  ProductNAME like '%r';
select * from Departmental_STORE where ProductNAME like '%a%';
select * from Departmental_STORE where ProductNAME like '_o%'
select * from Departmental_STORE where ProductNAME like 'S__%'
select * from Departmental_STORE where ProductNAME like 'S%p'
select * from Departmental_STORE where ProductNAME not like 'a%'
select * from Departmental_STORE where DepatmentNAME in ('Stationary' , 'Home');
select * from Departmental_STORE where DepatmentNAME not in('Eatables');
select * from Departmental_STORE where Price between 30 and 90;
select * from Departmental_STORE where Price not between 30 and 90;
select * from Departmental_STORE where Price between 30 and 90 and ProductID not in (1,2,5);
select * from Departmental_STORE where ProductNAME not between 'Notebook' and 'Room Freshner' order by ProductID;
create table Coustomers(
CoustomerID int,
CoustomerNAME varchar(100),
Mob int
);
SELECT o.ProductID, o.ProductNAME, c.CoustomerNAME FROM Coustomers AS c, Departmental_STORE AS o;
insert into Coustomers values('1','Ana Trujillo Emparedados y helados', '123466');
insert into Coustomers values('2','Antonio Moreno Taquería', '88624761');
insert into Coustomers values('3','Around the Horn', '886');
insert into Coustomers values('4','Berglunds snabbköp', '96247135');
insert into Coustomers values('5','Around the Horn', '369753247');

select * from Coustomers;

select Departmental_STORE.ProductID, Coustomers.CoustomerID from Departmental_STORE inner join Coustomers on Departmental_STORE.ProductID=Coustomers.CoustomerID;
select Departmental_STORE.ProductID, Coustomers.CoustomerID from Departmental_STORE left join Coustomers on Departmental_STORE.ProductID=Coustomers.CoustomerID;
select Departmental_STORE.ProductID, Coustomers.CoustomerID from Departmental_STORE right join Coustomers on Departmental_STORE.ProductID=Coustomers.CoustomerID;
select Departmental_STORE.ProductID, Coustomers.CoustomerID from Departmental_STORE full outer join Coustomers on Departmental_STORE.ProductID=Coustomers.CoustomerID;
select ProductID from Departmental_STORE union all select CoustomerID from Coustomers;
select count(ProductID) from Departmental_STORE group by DepatmentNAME order by count(ProductID) DESC;
select count(ProductID) from Departmental_STORE group by DepatmentNAME having count(ProductID) >1;
select ProductNAME from Departmental_STORE where exists (select CoustomerNAME from Coustomers where Coustomers.CoustomerID=Departmental_STORE.ProductID and Price >10);
select ProductNAME from Departmental_STORE where ProductID = any(select CoustomerID from Coustomers where CoustomerID>2);
select * into Coustomersbackup from Coustomers;
select * from Coustomersbackup
alter table Coustomers add ContactName varchar(100);
insert into Coustomersbackup(CoustomerNAME) select ContactName from Coustomers;
select Price, ProductNAME, case when ManufacturingYEAR > 2021 then 'Manufactured in 2022' else 'Product manufactured in 2021' end as msg from Departmental_STORE;
create procedure selectallproducts as select * from Departmental_STORE go;
exec selectallproducts;
create procedure selectallpro @pr nvarchar(100) as select * from Departmental_STORE where price=@pr;
exec selectallpro @pr = '30';
backup database mssqlpractise to disk = 'D:\Brize';
create table Persons (ID int not null unique,LastName varchar(255) not null,FirstName varchar(255),Age int);
select * from Persons;
alter table persons add MobileNumber int unique;
create table practise (ID int not null primary key,LastName varchar(255) not null,FirstName varchar(255),Age int);
select * from practise;
CREATE TABLE Orders (OrderID int NOT NULL,OrderNumber int NOT NULL,ID int,PRIMARY KEY (OrderID),FOREIGN KEY (ID) REFERENCES Persons(ID));
select * from Orders;
CREATE TABLE PersonsAge (ID int NOT NULL,LastName varchar(255) NOT NULL,FirstName varchar(255),Age int CHECK (Age>=18));
CREATE TABLE Ordersdefault (ID int NOT NULL,OrderNumber int NOT NULL,OrderDate date DEFAULT GETDATE());
select * from Ordersdefault;
CREATE INDEX idx_pname ON Persons (LastName, FirstName);
CREATE TABLE Personsautoincrement (Personid int identity(1,1) primary key,LastName varchar(255) NOT NULL,FirstName varchar(255),Age int);
select * from Personsautoincrement;
INSERT INTO Personsautoincrement (FirstName,LastName) VALUES ('Lars','Monsen');
create view [2021 Maufactured] as select ProductNAME from Departmental_STORE where ManufacturingYEAR='2021';
select * from [2021 Maufactured];
