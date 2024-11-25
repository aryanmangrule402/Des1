select tablespace_name, contents from dba_tablespaces;

create TABLESPACE b35tbs01 datafile 'D:\SEM 7\ADS\Lab\Exp 4\b35tbs01.dbf' size 10m blocksize 8k;

select tablespace_name, contents from dba_tablespaces;

alter session set "_ORACLE_SCRIPT"=true;

--create user sujay identified by sujay default tablespace b35tbs01 quota 5m on b35tbs01;     
--grant create session, create table to sujay;

create user userl identified by userl_password default tablespace b35tbs01 quota 5m on b35tbs02;
grant create session, create table to userl;

show user;

desc dba_ts_quotas;         -- to see the allocated quota

select tablespace_name, username, max_bytes/1024/1024 as max_bytes from dba_ts_quotas where username='USER1';       -- to see the total allocated quota to userl

select tablespace_name, username, max_bytes/1024/1024 as max_bytes, bytes/1024/1024 as used_data from dba_ts_quotas where username='USER1';     -- to see the total allocated quota and used quota to userl

-- from now run remaining queries in sql plus

conn user1/user1_password;

create table students(id int, stu_name varchar(10));

INSERT INTO students VALUES (1, 'John');
INSERT INTO students VALUES (2, 'Alice');
INSERT INTO students VALUES (3, 'Bob');
INSERT INTO students VALUES (4, 'Eve');
INSERT INTO students VALUES (5, 'Tom');