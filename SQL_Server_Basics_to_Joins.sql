--“In this section, I will explain the main SQL DQL commands.”
--DQL means Data Query Language. It focuses on retrieving data, mainly with the SELECT statement.
--I will Use Sample DataBase Her Name Is BikeStores

use BikeStores;

select
p.product_id,
p.product_name,
p.list_price
from production.products p;

select distinct
p.category_id
from production.products p;

/*
 -- Comparison operators
Used to compare values. They usually appear in a WHERE or HAVING clause.
Operator	Meaning
=	Equal to
<> or !=	Not equal to
>	Greater than
<	Less than
>=	Greater than or equal to
<=	Less than or equal to
*/

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price = 1320.99;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price <> 1320.99;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price > 2000;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price < 2000;


select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price >= 2000;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price <= 2000;

/*
  -- Logical operators
Combine or reverse conditions:
Operator	Meaning
AND	Both conditions must be true
OR	At least one condition must be true
NOT	Reverses a condition
*/

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price >= 1000 and  p.list_price <= 2000
order by p.list_price asc , p.product_id asc;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_id = 100 or p.product_id = 200;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where not (p.list_price >= 1000 and  p.list_price <= 2000)
order by p.list_price asc , p.product_name asc;

/*
-- Filtering operators and predicates
Operator	Purpose	Example
IN	Matches any value in a list or query	category_id IN (1, 2, 3)
BETWEEN	Checks an inclusive range	list_price BETWEEN 100 AND 500
LIKE	Matches a text pattern	product_name LIKE 'Bike%'
NOT IN        NOT BETWEEN            NOT LIKE
IS NULL	Checks for a missing value	shipped_date IS NULL
IS NOT NULL	Checks that a value is present	phone IS NOT NULL
لسهEXISTS	Checks whether a subquery returns rows	EXISTS (SELECT ...)
لسهANY / SOME	Compares to at least one subquery value	price > ANY (SELECT ...)
لسهALL	Compares to every subquery value	price > ALL (SELECT ...)
*/

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_id in (100,200,300,400);

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_id not in (100,200,300,400);

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price between 1000 and 1500;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price not between 1000 and 1500;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price is null;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price is not null;

select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '%2016'

/*
 Wildcard Characters in SQL Server
 A wildcard is a special character used to represent one or more characters in a search pattern.
*/

-- Starts With pure
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like 'pure%';

-- Ends With 2019
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '%2019';

-- Contains speed
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '%speed%'

-- Starts and Ends With trek%16
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like 'trek%16'

-- Names starting with t and containing exactly 17 characters
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like 't________________';

-- Names ending with 1 preceded by exactly one character اللي قبل الاخير ايه 1
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like'%1_';

-- Names staring with t and having exactly 17 characters
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like 't________________';

-- Names ending with 8 and having exactly 17 characters
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '________________8';

-- Names ending with s, preceded by at least three characters
select
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '___s';

-- Searching for Multiple Starting Letters
-- Using OR to search for names starting with a, b, or c
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like 'a%' or p.product_name like 'b%' or p.product_name like 'c%';

-- Searching for Multiple Starting Letters
-- Using [abc] instead of multiple OR conditions for names starting with a, b, or c
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '[tsm]%';

-- Searching for Multiple Starting Letters
-- Using [e-h] instead of multiple OR conditions for names starting with e, f, g or h
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '[e-h]%';

-- Searching for Names Not Starting with Specific Letters
-- Using [^e-h] to exclude names starting with e, f, g, or h
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '[^e-h]%';

-- Searching for Multiple Starting Letters
-- Names that do not start with t, s, or m
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name not like '[tsm]%';

-- Searching for Multiple Starting Letters
-- Names that do not start with a, b, or c
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.product_name like '[^tsm]%';

/*-- Searching for Mohammad or Mohammed patterns
SELECT *
FROM dbo.employees AS e
WHERE e.first_name LIKE 'Mohamm[ae]d%';*/


-- ORDER BY, OFFSET, and FETCH , Top 10 , Top Percent
select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price between 100 and 1000
order by p.list_price ASC
offset 0 rows fetch first 20 rows only;

select 
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price between 100 and 1000
order by p.list_price ASC
offset 21 rows fetch first 20 rows only;

select top 20
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price between 100 and 1000
order by p.list_price ASC;

select top 10 percent
p.product_id,
p.product_name,
p.list_price
from production.products p
where p.list_price between 100 and 1000
order by p.list_price ASC;


/*
In This Section We Will Expalin
1. INNER JOIN : Returns rows with matching values in both tables.
2. LEFT JOIN : Returns all rows from the left table and matching rows from the right table. Unmatched right-side columns become NULL.
3. RIGHT JOIN : Returns all rows from the right table and matching rows from the left table.
4. FULL OUTER JOIN : Returns matching rows and unmatched rows from both tables.
5. Recursive Join  OR  Self Join
*/

Create Database HRDataBase;

Use HRDataBase;

Create Table Daepartment(
Department_ID int Not Null,
Department_Name varchar(50) Null,
Constraint PK_100100100 primary key (Department_ID)
);

Create Table Employee(
Employee_ID int Not Null,
Employee_Name Varchar(50),
Employee_Phone varchar(11),
Supervisor int ,
Department_ID int,
Constraint PK_10000000 primary key (Employee_ID),
Constraint UQ_10000000 Unique (Employee_Phone),
Constraint FK_10000000 Foreign key (Department_ID) References Daepartment(Department_ID)
);

--INNER JOIN 
-- Returns rows with matching values in both tables.
Select 
e.Employee_ID,
e.Employee_Name,
e.Employee_Phone,
e.Department_ID ,
d.Department_ID,
d.Department_Name
from dbo.Employee e 
inner Join dbo.Daepartment d
    on e.Department_ID = d.Department_ID
order by e.Employee_ID;

 --LEFT JOIN 
 --Returns all rows from the left table and matching rows from the right table. Unmatched right-side columns become NULL.
select 
e.Employee_ID,
e.Employee_Name,
e.Employee_Phone,
e.Department_ID ,
d.Department_ID,
d.Department_Name
from dbo.Employee e
Left outer join dbo.Daepartment d
  on e.Department_ID = d.Department_ID
order by e.Employee_ID asc;

-- RIGHT JOIN 
-- Returns all rows from the right table and matching rows from the left table.
select 
e.Employee_ID,
e.Employee_Name,
e.Employee_Phone,
e.Department_ID ,
d.Department_ID,
d.Department_Name
from dbo.Employee e
Right outer join dbo.Daepartment d
   on e.Department_ID = d.Department_ID

-- FULL OUTER JOIN 
-- Returns matching rows and unmatched rows from both tables.
select 
e.Employee_ID,
e.Employee_Name,
e.Employee_Phone,
e.Department_ID ,
d.Department_ID,
d.Department_Name
from dbo.Employee e
full outer join dbo.Daepartment d
  on e.Department_ID = d.Department_ID;

-- Recursive Join   OR   Self Join
select 
e.Employee_ID,
e.Employee_Name,
e.Supervisor,
em.Employee_ID,
em.Employee_Name
from dbo.Employee e
inner join dbo.Employee em
   on e.Supervisor = em.Employee_ID;
 

 






















 



