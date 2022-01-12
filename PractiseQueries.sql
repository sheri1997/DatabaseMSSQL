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
