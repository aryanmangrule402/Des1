-- RANGE PARTITIONING

create table employees(
    id int primary key,
    fname varchar(25) not null,
    lname varchar(25) not null,
    store_id int not null,
    department_id int not null
)
PARTITION by range(id) (
    partition p0 values less than(5),
    partition p1 values less than(10),
    partition p2 values less than(15),
    partition p3 values less than(20)
);


insert into employees values(0, 'Sumit', 'More', 2541, 101);
insert into employees values(1, 'Jay', 'Bansode', 2251, 101);
insert into employees values(2, 'Sujay', 'Gangan', 2541, 101);
insert into employees values(3, 'Aryan', 'Mangrule', 2642, 101);
insert into employees values(4, 'Tanmay', 'Vidwans', 2645, 102);
insert into employees values(5, 'Soham', 'Sadolkar', 2415, 102);
insert into employees values(6, 'Somnath', 'Kumbhar', 2524, 103);
insert into employees values(7, 'Vaibhav', 'Malvi', 2251, 104);
insert into employees values(8, 'Aditya', 'Belkude', 2541, 105);
insert into employees values(9, 'Pavan', 'Rajmane', 2642, 105);
insert into employees values(10, 'Shreyas', 'Bansode', 2645, 106);
insert into employees values(11, 'Sourabh', 'Shinde', 2415, 107);
insert into employees values(12, 'Sourabh', 'Jadhav', 2524, 108);
insert into employees values(13, 'Samarth', 'Jadhav', 2251, 105);
insert into employees values(14, 'Prasanna', 'Patil', 2541, 104);
insert into employees values(15, 'Vivek', 'Patil', 2642, 103);
insert into employees values(16, 'Shreyas', 'Patil', 2645, 104);
insert into employees values(17, 'Shreyas', 'Shinde', 2415, 107);
insert into employees values(18, 'Pranav', 'Chavan', 2524, 105);
insert into employees values(19, 'Atharva', 'Patil', 2251, 107);


-- 1. Retrieve employee details from partition p1 and p2
select * from employees partition(p1) union select * from employees partition(p2);

-- 2. Retrieve employee details from partition p0 and p1 where fname begin with 'S'
select * from employees partition(p0)where fname like 'S%' union select * from employees partition(p1) where fname like 'S%';

-- 3. Count number of empployees from each department from p1, p2, p3
select department_id, count(*) as Number_of_Employees from (select * from employees minus select * from employees partition(p0)) group by department_id;



-- HASH PARTITIONING

create table sales_hash(
    salesman_id number(5) primary key,
    salesman_name varchar(30),
    sales_amount number(10),
    week_no number(2)
)

partition by hash(salesman_id) partitions 4;

insert into sales_hash values(1, 'Jay', 2251, 1);
insert into sales_hash values(2, 'Sujay', 2541, 1);
insert into sales_hash values(3, 'Aryan', 2642, 2);
insert into sales_hash values(4, 'Tanmay', 2645, 1);
insert into sales_hash values(5, 'Soham', 2415, 1);
insert into sales_hash values(6, 'Somnath', 2524, 3);
insert into sales_hash values(7, 'Vaibhav', 2251, 1);
insert into sales_hash values(8, 'Aditya', 2541, 2);
insert into sales_hash values(9, 'Pavan', 2642, 3);
insert into sales_hash values(10, 'Shreyas', 2645, 3);


SELECT * 
FROM ALL_TAB_PARTITIONS 
WHERE table_name = 'SALES_HASH' ORDER BY 1,2;


-- 1. Retrieve sales details from 2nd partition
select * from sales_hash partition(SYS_P402);

-- 2. Retrieve name of salesman and amount from 4th partition where sales amount between 2000 and 5000
select salesman_name, sales_amount from sales_hash partition(SYS_P404) where sales_amount between 2000 and 5000;

-- 3. find average sale amount per week from 3rd partition
select week_no, avg(sales_amount) from sales_hash partition(SYS_P403) group by week_no order by week_no;