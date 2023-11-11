-- INSERT 
-- insert into table)column1, column2..)
--select column1, column 2...
--from another_table
---where condition;

select * from  account;

insert into account (username , password, email, created_on)
values
('Lola ','password','lola@gmail.com',current_timestamp);


select * from account;

insert into job ( job_name)
values
('Astronaut');

insert into job (job_name)
values
('President');

---Update
--update table ser column1 = value 1,
--column 2 = value 2,
--where condition;
---Reset to overide previous updates
-- update join 
--return affected rows

select * from account;

update account 
set last_login = current_timestamp;

update account_job 
set hire_date = account.created_on
from account
where account_job.user_id = account.user_id;


select * from account_job;


--Delete caluse

-- delete from table a usiing where table a
--delete from table.

select * from job;
insert into job(job_name)
values
   ('Cowboy');

select * from job;


delete from job
where job_name = 'President'
returning job_id, job_name;


--- Alter tables, columns and set default values , add constarints 

create table information (

info_id serial primary key,
title varchar (500) not null,
person varchar (50) not null unique

);

Alter table information
rename to new_info;

select * from new_info;

alter table new_info
rename column person to people;

-- Alter constraints

alter table new_info
alter column people drop not null;


insert into new_info(title)
values
('some new title');

select * from new_info

---see documentation for more info
--drop command, cascade

alter table new_info 
drop column people;

select * from new_info


-- Check constraints, create more constraints

create table employees(

	emp_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	birthdate date check (birthdate > '1900-01-01'),
	hire_date date check (hire_date > birthdate),
	salary integer check (salary >0)
	)

select * from employees


alter table employees
rename column frist_name to first_name





insert into employees (
first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)

values
(
	'Bola',
	'Sola',
	'1989-11-03',
	'2001-01-02',
	100
)
select *from employees;

















































