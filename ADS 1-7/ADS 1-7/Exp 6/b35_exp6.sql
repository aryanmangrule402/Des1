-- create table customer
create table customer(
    cus_code integer primary key,
    cus_fname varchar(10),
    cus_lname varchar(10),
    cus_initial varchar(1),
    cus_areacode integer,
    cus_phone integer,
    cus_balance number(10, 2)
);

-- 1. create sequence on cus_code
create sequence cus_code_seq start with 500 nocache;

-- 2. display user sequences
select * from user_sequences;

-- 3. insert values in customer table using created sequence
insert into customer values(cus_code_seq.nextval, 'Sujay', 'Gangan', null, '615', '1223136546', 11114.22);
insert into customer values(cus_code_seq.nextval, 'Aryan', 'Mangrule', null, '616', '4564646789', 5555.44);
insert into customer values(cus_code_seq.nextval, 'Pranav', 'Chavan', null, '617', '4567891230', 1112.66);
insert into customer values(cus_code_seq.nextval, 'Atharva', 'Patil', null, '618', '3456127890', 55554.21);
insert into customer values(cus_code_seq.nextval, 'Tanmay', 'Shinde', null, '619', '2314567890', 88978.23);
insert into customer values(cus_code_seq.nextval, 'Shreyas', 'Bansode', null, '620', '1234567890', 46547.65);

-- 4. Display customer records
select * from customer;





------------------------------------------------------------------------------------------







-- create table student_report
create table student_report(
    s_id number(4) primary key,
    name varchar(20),
    subj1 number(2),
    subj2 number(2),
    subj3 number(2),
    total number(3),
    per number(3),
    check(subj1 >= 0 and subj1 <= 20),
    check(subj2 >= 0 and subj2 <= 20),
    check(subj3 >= 0 and subj3 <= 20)
);

create or replace trigger trg_check_report
before insert or update on student_report
for each row
declare
begin
    :new.total := :new.subj1 + :new.subj2 + :new.subj3;
    :new.per := ((:new.subj1 + :new.subj2 + :new.subj3)/60)*100;
end;

insert into student_report values(1, 'A', 12, 13, 13, 0, 0);
insert into student_report values(2, 'B', 14, 19, 11, 0, 0);
insert into student_report values(3, 'C', 11, 15, 16, 0, 0);
insert into student_report values(4, 'D', 14, 16, 18, 0, 0);
insert into student_report values(5, 'E', 15, 18, 16, 0, 0);
insert into student_report values(6, 'F', 16, 11, 17, 0, 0);
insert into student_report values(7, 'G', 17, 12, 12, 0, 0);
insert into student_report values(8, 'H', 15, 16, 12, 0, 0);
insert into student_report values(9, 'I', 17, 15, 14, 0, 0);
insert into student_report values(10,'J', 19, 13, 16, 0, 0);

select * from student_report;






------------------------------------------------------------------------------------------






-- create table course
create table course(
    course_num integer primary key,
    course_name varchar(50),
    dept_name varchar(15),
    credits integer
);

insert into course values(1001, 'M1', 'BSH', 3);
insert into course values(1002, 'M2', 'BSH', 3);
insert into course values(1003, 'M3', 'CSE', 3);
insert into course values(1004, 'CM', 'CSE', 3);
insert into course values(1005, 'CC', 'CSE', 3);
insert into course values(1006, 'ADS', 'CSE', 3);
insert into course values(1007, 'OS', 'CSE', 3);
insert into course values(1008, 'DLDM', 'CSE', 3);

select * from course;


-- 1. write a procedure which includes cursors: find course_name and credits where course_name starts with 'C'
set serveroutput on;

create or replace procedure lab5_proc_2
is c_name varchar(50);








