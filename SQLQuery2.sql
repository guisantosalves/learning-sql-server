--use AdventureWorks2019

-- distict -> é usado pra trazer na ordem alfabética
select BusinessEntityID, JobTitle 
from HumanResources.Employee 
where BusinessEntityID >= 50;
--where JobTitle = 'Research and Development Manager';


-- usando outra table
select SubTotal, TaxAmt, SubTotal +  TaxAmt as subTotalwithTaxAmt
from Purchasing.PurchaseOrderHeader;

select SubTotal, TaxAmt, SubTotal /  TaxAmt as exemple
from Purchasing.PurchaseOrderHeader
where TaxAmt > 0;

-- using arethimatical operation in where
select SubTotal, TaxAmt, SubTotal + TaxAmt as plus, SubTotal / TaxAmt as division
from Purchasing.PurchaseOrderHeader
where SubTotal + TaxAmt > 500;

/*order of execution 

FROM -> WHERE -> SELECT
WE CANT USE THE NICKNAME OF A PARTICULAR COLUMN IN WHERE CLAUSE

*/

-- using another column
select FirstName, MiddleName, LastName, FirstName + ' ' + MiddleName + ' ' + LastName as fullName
from Person.Person;

select FirstName, MiddleName, LastName
from Person.Person
where MiddleName is not null;

-- or/and operators 
select * from HumanResources.Employee 
where JobTitle = 'Design Engineer' or JobTitle = 'Research and Development Manager';
--where MaritalStatus = 'S' and Gender = 'F';

--it's better use IN operator instead OR operator
select * from HumanResources.Employee
where JobTitle in ('Design Engineer', 'Research and Development Manager');

select * from HumanResources.Employee 
where BusinessEntityID in (1,5,10,15);

-- between operator
select * from HumanResources.Employee
where BusinessEntityID between 1 and 50;


-- like operator -> % in like will bring everythin that start with the setence before % ou after %
-- we can use -> undescore to show the number of caracters we want like 'Al____'
select * from Person.StateProvince 
where Name like 'A%'

select * from Person.StateProvince
where Name like '%o'

select * from Person.StateProvince
where Name like 'Al____';


-- sorting the queries
select City, PostalCode
from Person.Address
order by PostalCode desc;

-- sorting based on two columns / desc -> maior para o menor / asc -> menor para o maior
select FirstName, LastName, MiddleName 
from Person.Person
where MiddleName is not null
order by FirstName desc, LastName asc;


-- group by clausule
/*The GROUP BY statement is often used with
aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG())
to group the result-set by one or more columns.*/
select SalesOrderID, sum(UnitPrice) as TotalUnitPricePerSales
from Sales.SalesOrderDetail
group by SalesOrderID;

select SalesOrderID, UnitPrice
from Sales.SalesOrderDetail
--group by SalesOrderID;

--> another agregation function that generally are used with group by
--> AVG(), count(), max(), min()
select SalesOrderID, avg(UnitPrice) as AvaregeUnitPricePerSales
from Sales.SalesOrderDetail
group by SalesOrderID;

select SalesOrderID, count(UnitPrice) as CountUnitPricePerSales
from Sales.SalesOrderDetail
group by SalesOrderID;

select SalesOrderID, max(UnitPrice) as MaxUnitPricePerSales
from Sales.SalesOrderDetail
group by SalesOrderID;

select SalesOrderID, min(UnitPrice) as MinUnitPricePerSales
from Sales.SalesOrderDetail
group by SalesOrderID;