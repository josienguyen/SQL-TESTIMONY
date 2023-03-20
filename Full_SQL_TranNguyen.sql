
====DATASET====
##DROP ANY TABLES LEFT
/*
*********************************************************************
http://www.mysqltutorial.org
*********************************************************************
Name: MySQL Sample Database classicmodels
Link: http://www.mysqltutorial.org/mysql-sample-database.aspx
Version 3.1
+ changed data type from DOUBLE to DECIMAL for amount columns
Version 3.0
+ changed DATETIME to DATE for some colunmns
Version 2.0
+ changed table type from MyISAM to InnoDB
+ added foreign keys for all tables 
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tdn210001`/*!40100 DEFAULT CHARACTER SET latin1 */;

# CREATE TABLE MOVIE TITLE
use tdn210001;
##1st TABLE

create table `MovieTitle` (
	`MovieID` int NOT NULL,
    `MovieName` varchar(25) NOT NULL,
    `Genre` varchar(25) NOT NULL,
    `Studio` char(15) NOT NULL, 
    `YearReleased` varchar(10) NOT NULL, 
    primary key (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Movie Title` */
insert into `MovieTitle` (`MovieID`, `MovieName`, `Genre`, `Studio`, `YearReleased`) values 
(103,'Hai Phuong','Action','AMC',2018),
(104,'Bo Gia','Family','Cinema',2020),
(105,'Nghe Sieu De','Comedy','AMC',2022),
(106,'Sieu Sao Dai Chien','Comedy','AMC',2010),
(107,'Trang Ti','Adventure','Strike and Reel',2010);

select * from MovieTitle;
---------------------------------------------------------------------------
##2ND TABLE
# CREATE TABLE MOVIE STAR
create table `MovieStar` (
	`StarID` char(15) NOT NULL,
    `FirstName` varchar(15) NOT NULL,
    `LastName` varchar(15) NOT NULL,
    `Gender` varchar(10) NOT NULL, 
    `Nationality` varchar(20) NOT NULL,
    primary key (`StarID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `MovieStar` (`StarID`, `FirstName`, `LastName`, `Gender`, `Nationality`) values
('S101', 'Van', 'Ngo', 'F', 'VN'),
('S102', 'Thanh', 'Tran', 'M', 'VN'),
('S103', 'Trang', 'Thu', 'F', 'VN'),
('S104', 'Giang', 'Truong', 'M', 'VN'),
('S105', 'Dan', 'Trung', 'M', 'VN');
----------------------------------------------------------------------
-------------------#3RD TABLE-----------------------------------------
# CREATE TABLE MOVIE CAST
create table `MovieCast` (
	`CastID` char(15) NOT NULL,
    `MovieID` int NOT NULL,
    `StarID` char(15) NOT NULL,
    `Role` varchar(15) NOT NULL, 
    primary key (`CastID`), 
    CONSTRAINT `MovieCast_ibfk_1` foreign key (`MovieID`) REFERENCES `MovieTitle` (`MovieID`) on update cascade,
	CONSTRAINT `MovieCast_ibfk_2`  foreign key (`StarID`) REFERENCES `MovieStar` (`StarID`) on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `MovieCast` (`CastID`, `MovieID`, `StarID`, `Role`) values
('Cast100','103', 'S101','Main Character'),
('Cast101','104', 'S102','Cameo'),
('Cast102','105', 'S103','Extra'),
('Cast103','106', 'S104','Main Character'),
('Cast104','107', 'S105','Main Character');

----------------------------------------------------------------------
-------------------#4ND TABLE-----------------------------------------
# CREATE TABLE LIBRARY BRANCH
create table `Librarybranch` (
	`BranchID` char(50) NOT NULL,
    `Address` char(100) NOT NULL,
    `City` char(50) NOT NULL,
    `State` char(50) NOT NULL,
    `Zip` varchar(10) NOT NULL, 
    `Branchmanagername` varchar(50) NOT NULL,
    primary key (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `Librarybranch` (`BranchID`,`Address`,`City`,`State`,`Zip`,`Branchmanagername`) values
('Branch101','101 Abrams','Dallas','Texas','75243','Lisa'),
('Branch102','230 Prestonwood Dr','Richardson','Texas','75080','Maria'),
('Branch103','1000 Dallas Parkway','Dallas','Texas','75248','Kent'),
('Branch104','1290 Jupiter Rd','Garland','Texas','75040','Lion'),
('Branch105','3212 North Garland','Garland','Texas','75044','Tiger');

----------------------------------------------------------------------
-------------------#5nd TABLE-----------------------------------------
# CREATE TABLE CATALOGUE ITEM
create table `CatalogItem` (
	`CatalogItemID` char(50) NOT NULL,
    `MovieID` int NOT NULL,
    `BranchID` char(100) NOT NULL,
    `CopyType` varchar(15) NOT NULL, 
    `DateAcquired` date NOT NULL,
    primary key (`CatalogItemID`), 
    CONSTRAINT `CatalogItem_ibfk_1` foreign key (`MovieID`) REFERENCES `MovieTitle` (`MovieID`) on update cascade,
    CONSTRAINT `CatalogItem_ibfk_2` foreign key (`BranchID`) REFERENCES `Librarybranch` (`BranchID`) on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `CatalogItem` (`CatalogItemID`,`MovieID`,`BranchID`,`CopyType`,`DateAcquired`) values
('Cat101', '103', 'Branch101','MainCopy','2021-01-01'),
('Cat102', '104', 'Branch102','Addition','2021-12-08'),
('Cat103', '105', 'Branch103','Addition','2019-11-01'),
('Cat104', '106', 'Branch104','MainCopy','2021-02-01'),
('Cat105', '107', 'Branch105','MainCopy','2021-03-01');

----------------------------------------------------------------------
-------------------#6nd TABLE-----------------------------------------
# CREATE TABLE PATRON
create table `Patron` (
	`PatronID` char(20) NOT NULL,
    `PatronName` char(100) NOT NULL, 
    `PatronAddress` char(100) NOT NULL,
    `City` char(50) NOT NULL,
    `State` char(50) NOT NULL,
    `Zip` varchar(10) NOT NULL, 
    `FavoriteGenre` varchar(10) NOT NULL,
    primary key (`PatronID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `Patron` (`PatronID`,`PatronName`,`PatronAddress`,`City`,`State`,`Zip`,`FavoriteGenre`) values
('misa01', 'Misa', '2110 Carnation Ct', 'Garland', 'Texas', 75040, 'Horor'),
('annie02', 'Annie', '632 Tiffany Trl', 'Richardson', 'Texas', 75081, 'Comedy'),
('aubry00', 'Aubry', '15221 Berry Trl APT 604', 'Dallas', 'Texas', 75248, 'Action'),
('cheng05', 'Cheng', '5907 Copperwood Ln #1138', 'Dallas', 'Texas', 75248, 'Adventure'),
('tim00', 'Tim', '610 Fairview Dr', 'Richardson', 'Texas', 75081, 'Romantic');

----------------------------------------------------------------------
-------------------#7nd TABLE-----------------------------------------


# CREATE TABLE CHECK OUT
create table `Checkout` (
	`CheckoutID` char(20) NOT NULL,
	`CatalogItemID` char(50) NOT NULL,
	`PatronID` char(20) NOT NULL,
    `CheckoutDate` date NOT NULL,
    `DueDate` date NOT NULL, 
    primary key (`CheckoutID`), 
    CONSTRAINT `Checkout_ibfk_1` foreign key (`CatalogItemID`) REFERENCES `CatalogItem` (`CatalogItemID`) on update cascade,
    CONSTRAINT `Checkout_ibfk_2` foreign key (`PatronID`) REFERENCES `Patron` (`PatronID`) on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `Checkout` (`CheckoutID`,`CatalogItemID`,`PatronID`,`CheckoutDate`,`DueDate`) values
('receipt01', 'Cat101', 'misa01','2022-04-05', '2022-04-19'),
('receipt02', 'Cat102', 'annie02','2022-01-17', '2022-02-04'),
('receipt03', 'Cat103', 'aubry00','2022-10-05', '2022-10-19'),
('receipt04', 'Cat104', 'cheng05','2022-11-01', '2022-11-15'),
('receipt05', 'Cat105', 'tim00','2022-07-06', '2022-07-20');

#--THE END---#

====###EXTRACT DATASET PART ###=======
##1. Which last name is the most common actor last name? (1 pt)
select last_name, count(last_name) as totalcount from actor group by last_name order by totalcount desc limit 1;
## the most common actor last name is Kilmer

##2. How many actor(s) appeared in at least 2 movies? (1 pt)
select  count(*)
from (select a.actor_id, first_name, last_name, f.title , count(first_name) from actor as a join film_actor as fa on a.actor_id = fa.actor_id 
join film as f on f.film_id = fa.film_id group by a.actor_id having count(first_name) >= 2 order by count(first_name) desc) as a ;
##WITH DUPLICATES
select count(t.totalcount)
from ( select a.last_name, count(a.actor_id) as totalcount
		from
		(select last_name,fa.film_id, title, release_year, a.actor_id from film_actor as fa join film as f on fa.film_id = f.film_id
        join actor as a
        on a.actor_id = fa.actor_id) as a
			group by a.actor_id
			having totalcount >= 2) as t;
##there are 200 actors

##REMOVE DUPLICATED
select count(*)
from ( select a.fullname, count(a.fullname) as totalcount
		from
		(select a.actor_id, concat( a.last_name, ' ',a. first_name) as fullname, title
        from film_actor as fa join film as f on fa.film_id = f.film_id join actor as a
        on a.actor_id = fa.actor_id ) as a
			group by a.fullname
			having totalcount >=2 ) as t;
            
select * , count(a.fullname) as totcount
from (select a.actor_id, concat( a.last_name, ' ',a. first_name) as fullname, title
        from film_actor as fa join film as f on fa.film_id = f.film_id join actor as a
        on a.actor_id = fa.actor_id group by actor_id) as a group by a.fullname order by totcount desc
        ;

## 3. How many different movie titles are there for each language? (1 pt)

select name, count(name)
from film as f inner join language as l on f.language_id = l.language_id
group by name;

##4. Which movie title has the most copies across all stores? (2 pts)
select a.store_id, a.title, a.totCount
 from 				(select st.store_id, i.inventory_id, title, count(*) as totCount
									from inventory as i inner join  store as st on st.store_id = i.store_id left join 
									film as f on f.film_id = i.film_id 
									group by  st.store_id, title
										order by totCount desc)  as a
				INNER JOIN (Select max(totCount) as totCount from
									(select st.store_id, i.inventory_id, title, count(*) as totCount
									from inventory as i inner join  store as st on st.store_id = i.store_id left join 
									film as f on f.film_id = i.film_id 
									group by  st.store_id, title
										order by totCount desc)  as a) as max USING(totCount);                                        ;

##5. List the top 10 customers for each store in terms of number of rentals. (3 pts)

SELECT a.customer_id, a.first_name,  store_id, rn, a.total
FROM ( SELECT c.customer_id, c.first_name, store_id, count(rental_id) total,
           ROW_NUMBER() OVER (PARTITION BY store_id 
                              ORDER BY count(rental_id) DESC
                             )
             AS rn
    FROM rental as r inner join customer as c 
on r.customer_id = c.customer_id group by c.last_name
ORDER BY store_id, count(rental_id) desc) a
group by customer_id, store_id
having rn <= 10
ORDER BY store_id, rn;

##6. The Movie Rental Company wants to tier its customers based on the amount they spent so far in then database
#• If total between 100 – 150 the tier is in the “Silver” tier,
#• Between 150.01 and 199.99 the customer is in the “Gold” tier,
#• Above 200, the customer is in the “Platinum” tier.
#• Otherwise, the customer is in the “Standard” tier.
# Using this query, create another table named customer_tier with the following columns customer_id,
# reward_tier with suitable data types. Provide the top customer at each tier. (3 pts)

###CREATE TIER
select a.customer_id, a.last_name, a.rental_id, a.totalsum,
case 
	when a.totalsum between 100 and 150 then "Silver"
    when a.totalsum between 150.01 and 199.99 then "Gold"
    when a.totalsum >= 200 then "Platinum"
    else "Standard" end as customer_tier
from ( select pmt.customer_id, c.last_name, amount, r.rental_id,sum(amount) as totalsum 
		from payment as pmt join rental as r 
		on pmt.rental_id = r.rental_id
		join customer as c on c.customer_id = pmt.customer_id
		group by c.last_name) as a
order by customer_tier, Amount desc;
     
##LIST THE TOP OF EACH TIER
select *
from(select *,
row_number() over (partition by b.customer_tier order by b.totalsum desc) as alian
from (select a.customer_id, a.last_name, a.rental_id, a.totalsum,
case 
	when a.totalsum between 100 and 150 then "Silver"
    when a.totalsum between 150.01 and 199.99 then "Gold"
    when a.totalsum >= 200 then "Platinum"
    else "Standard" end as customer_tier
from ( select pmt.customer_id, c.last_name, amount, r.rental_id,sum(amount) as totalsum 
		from payment as pmt join rental as r 
		on pmt.rental_id = r.rental_id
		join customer as c on c.customer_id = pmt.customer_id
		group by c.last_name) as a
order by customer_tier) as b) as c
having c.alian = 1; 
     
##7. Find how many customers who have not rented a movie for more than 2 months (60 days) as of
## 1/1/2006 (3 pts) (Hint: You can calculate the days for this using the expression date(‘2006-01-01’) –
## rental_date).

select count(last_name) as totalnotrentover60days
from (select b.customer_id, b.last_name, b.rental_id,  DATEDIFF(b.endday, b.rentdate) as dateOfnorent
		from (select * ,
		row_number() over (partition by a.last_name order by a.rentdate desc) as rownumber
		from (select c.customer_id, c.last_name, r.rental_id, r.return_date, r.rental_date,
  cast(r.rental_date as date) as rentdate, date('2006-01-01') as endday
from rental as r join payment as pmt
on r.rental_id = pmt.rental_id
join customer as c 
on c.customer_id = r.customer_id
where year(r.rental_date) = 2005) as a) as b
where b.rownumber = 1 and DATEDIFF(b.endday, b.rentdate) > 60) as c;
###note: datediff for MYSQL: select datediff(rental_date , return_date) from rental

##8. What are the longest and shortest movies at each category? (3 pts)
##longest
select *
from (select fl.title, fl.length as longest, ct.name, 
row_number() over (partition by ct.name order by length desc) as rownumber
FROM film fl JOIN film_category fc ON fl.film_id=fc.film_id
             JOIN category ct ON ct.category_id=fc.category_id) as a
             group by a.name
             having rownumber <=1
             order by a.title;
##SHORTEST
select *
from (select fl.title, fl.length as shortest, ct.name, 
row_number() over (partition by ct.name order by length) as rownumber
FROM film fl JOIN film_category fc ON fl.film_id=fc.film_id
             JOIN category ct ON ct.category_id=fc.category_id) as a
             group by a.name
             having rownumber <=1
             order by a.name;

## OR WE CAN DO THIS WAY TO GET SHORTEST
select a.title, a.longest, a.name, a.category_id, totcount
from ( select fl.title, fl.length as longest, ct.name, fc.category_id,
		row_number() over (partition by category_id order by name , fl.length ) as totcount
		FROM film fl JOIN film_category fc ON fl.film_id=fc.film_id
             JOIN category ct ON ct.category_id=fc.category_id) as a
             where totcount = 1;
  
##9. Which movies were rented in 2006 but not in 2005? (2 pts)
select fl.title, r.rental_date
from film as fl join inventory as ivt on fl.film_id = ivt.film_id
				join rental as r on ivt.inventory_id=r.inventory_id
where year(r.rental_date) = 2006 and not year(r.rental_date) = '2005'
limit 17000; 

##10. Compare each store’s rental numbers between 2005 and 2006. (2 pts)
select a.store_id, count(a.rental_id) as NoOfRental
from (select s.store_id, r.rental_date, r.rental_id
	from customer as c join rental as r on r.customer_id = c.customer_id 
	join store as s on s.store_id = c.store_id
    having year(r.rental_date) between 2005 and 2006
    order by s.store_id
	) as a
      group by a.store_id
    limit 17000;


####========####
#DATA OVERVIEW
select count(*) from address; -- 603 rows
select count(*) from actor; -- 200 rows
select count(*) from category; -- 16 rows
select count(*) from city; -- 600 rows
select count(*) from country;  -- 109 countries
select count(*) from customer; -- 599 
select count(rental_date) from rental; -- 16044 rows



