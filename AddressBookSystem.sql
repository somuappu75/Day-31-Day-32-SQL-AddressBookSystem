--uc-1 creating database
create database AddressBookServices;

--uc-2 Creating table
create table Address_Book_Table
(FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
)

--UC-3 inserting values to the table
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('somu','Havinal','Near Satti Road','Athani','Karnataka',591304,9731390823,'somusp75@gmail.com'),
('chetan','Koparde','Main Road','Banahatti','Karnataka',587311,9980431245,'chetu65@gmail.com'),
('gouri','shete','18 cross dadra','bangalore','chennai',587315,9740049061,'gourishete@gmail.com');

select *from Address_Book_Table;

--Uc-4 edititng contact using name
Update Address_Book_Table
set Email='ChetanKoparde@gmail.com'
where FirstName='chetan'

Update Address_Book_Table
set Address='Main Road Rampur'
where FirstName='gouri' and LastName='shete';


--uc-5 delete person based on name
delete 
from Address_Book_Table
where FirstName='chetan' and LastName='Koparde'

select *from Address_Book_Table;


select * from Address_Book_Table
where City='bangalore' or State='chennai'


--uc-6 retrieve data basedon city or state
select * from Address_Book_Table
where City='bangalore' or State='chennai'

---uc-7  Retrieve Count of Person belonging to a City or State----
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('sirsu','Bhajantri','shivaji circle Jamkhandi','Belgavi','Karnataka',590006,9663424395,'sirsuba@gmail.com')
select Count(*),state,City
from Address_Book_Table


----uc-8 ability to sort by person name bycity---
select *from Address_Book_Table
where City='bangalore'
order by FirstName,LastName;
Group by state,City
