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

delete 
from Address_Book_Table
where FirstName='chetan' and LastName='Koparde'

select *from Address_Book_Table;

select * from Address_Book_Table
where City='bangalore' or State='chennai'

---uc-7  Retrieve Count of Person belonging to a City or State----
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('sirsu','Bhajantri','shivaji circle Jamkhandi','Belgavi','Karnataka',590006,9663424395,'sirsuba@gmail.com')
select Count(*),state,City
from Address_Book_Table
Group by state,City

----uc-8 ability to sort by person name bycity---
select *from Address_Book_Table
where City='bangalore'
order by FirstName,LastName;

---uc-9 Adding Address Book With Name and Type-----
alter table Address_Book_Table
add AddressBookName varchar(100),
Type varchar(100)


--update vaalues for craeted book name and type column---
update Address_Book_Table
set AddressBookName='PuneetFans',Type='Fan_group'
where FirstName='chetan' or FirstName='somu'

--update vaalues for craeted book name and type column---
update Address_Book_Table
set AddressBookName='havinals',Type='Family'
where FirstName='sirsu'

--update vaalues for craeted book name and type column---
update Address_Book_Table
set AddressBookName='shetes',Type='Dears'
where FirstName='gouri'

select *from Address_Book_Table;

----uc-10 get get number of contact based on count by type-----
select Count(*) as NumberOfContacts,Type
from Address_Book_Table
Group by Type

select type,count(*)
from Address_Book_Table
group by type;


---uc-11 add Prerson NAme both family anf Profession
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Appu','Havinal','Near Satti Road','Athani','Karnataka',591304,9731390823,'somusp75@gmail.com'),
('Suresh','Koparde','Main Road','Banahatti','Karnataka',587311,9980431245,'chetu65@gmail.com');

update Address_Book_Table
set AddressBookName='Mom',Type='Family'
where FirstName='Suresh'

update Address_Book_Table
set AddressBookName='MD',Type='Profession'
where FirstName='Appu'

----adding Family---
select * from Address_Book_Table;
insert into Address_Book_Table
values ('Santosh','poojari','sasalatti','Teradal','UP',591304,9876543210,'SAntosh@gmail','Mom','Family');
--Addding to Profession
select * from Address_Book_Table;
insert into Address_Book_Table
values ('Santosh','poojari','sasalatti','Teradal','UP',591304,9876543210,'SAntosh@gmail','MD','Profession');

--uc-12-Creating different entities 
--creating table typeofcontacts
create table TypesOfContacts
(
typeid int primary key ,
typename varchar(50) not null);
--inserting data into type of contacts
insert into Typesofcontacts
values
(1,'Family'),
(2,'Friends'),
(3,'Business');
alter table Address_BooK_Table
add contactid int primary key identity(1,1);

select *from Address_Book_Table;

create table AddressBookNames
(addressBookId int primary key identity(1,1),
addressBookName varchar(50) not null );
---inserting values to addressbokk table--
insert into AddressBooknames values ('S'),('P'),('H');
select * from AddressBookNames;

---creating table address book names mapper which will contain contact id and address book names id---
create table addressbookMappeing
(contactid int not null, addressbookid int not null);
--inserting data into address book mapper id
insert into addressbookMappeing
values
(1,1),(2,1),(3,2);

select * from Address_Book_Table;
select a.firstname,a.phoneNumber,a.city,a.state,a.eMail,b.addressbookname,b.addressBookId
from Address_Book_Table a
join addressbookMappeing d
on a.contactid= d.contactId
join AddressBookNames b
on b.addressBookId= d.addressbookId


-- UC-13 Retrieving data using new table structure 
--UC6
select FirstName,LastName,city from Address_Book_Table
where FirstName='Appu';

--UC7
select city,count(*) from Address_Book_Table
where city='Athani'
group by city;

--UC8
select * from  Address_Book_Table
where city='Athani'
order by FirstName,LastName;

--UC10
select * from Address_Book_Table;

select typename,count(*) numberOfContactPersons from Address_Book_Table a
join addressbookMappeing am
on am.contactid= a.contactid
join TypesOfContacts t
on t.typeid= am.addressbookid
group by t.typename;
