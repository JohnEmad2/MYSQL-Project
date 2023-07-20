create database company;
use company;
create table employee (emp_id int primary key not null, emp_name varchar(50) , salary int);
create table department ( emp_id int primary key, dep_name varchar(50) , dep_id int );
alter table employee add age int ; 
alter table department drop column dep_id;
alter table employee rename column salary to bonus;
alter table department modify column dep_name varchar(70);
insert into employee (emp_id, emp_name , bonus , age) value ( 1 , "John" , 3000 , 26) , ( 2 , "Angelo" , 3200 , 29) , ( 3 , "Rojeh" , 2900 , 26) , ( 4 , "Emad" , 6200 , 60) , ( 5 , "Magda" , 3400 , 57);
select* from employee;
insert into department 
value (1 , "HR"), ( 2, "TECH") , ( 3, "EMBEDDED"), (4, "FINANCE") , ( 5, "MARKETING");
select * from department;
select emp_name name, age from employee;
truncate table department ;
select * from department;
delete from department where emp_id = 5;
select * from department;
update employee set bonus = 4000 where emp_id = 1;
select* from employee;
select distinct emp_name , age from employee;
select * from employee where bonus >= 3000;
select * from employee where bonus != 3200;
select * from employee where bonus > 3000 and age < 28;
select * from employee where bonus > 3000 or age > 25; 
select * from employee where age between 25 and 57; 
select * from employee where emp_name in ("John" , "Rojeh");
select * from employee where emp_name not in ("John" , "Rojeh");
select * from employee where emp_name like ("a%");
select * from employee where emp_name like ("%a");
select * from employee where emp_name like ("%_a%");
select * from employee where emp_name not like ("%_a%");
select count(bonus) from employee;
select max(bonus) from employee;
select min(bonus) from employee;
select avg(bonus) from employee;
select count(bonus) from employee having count(bonus) < 5000;

select emp_name from employee 
union 
select dep_name from department;

select emp_name from employee 
union all
select dep_name from department;
select emp_name as Name from employee;

select employee.emp_name, employee.bonus , department.dep_name
from employee inner join department
on employee.emp_id = department.emp_id
order by employee.bonus desc ;

select employee.emp_name , employee.bonus, department.dep_name
from employee right join department
using (emp_id)
order by employee.bonus asc;

select employee.emp_name , employee.bonus, department.dep_name
from employee left join department
using (emp_id)
order by employee.bonus desc;

select emp_name, bonus from employee 
union all
select dep_name from department;

select emp_id, emp_name 
from employee
group by emp_name
order by emp_id desc;

select emp_name, count(emp_id) 
from employee
group by emp_name;

select emp_name, count(emp_id) 
from employee
group by emp_name
order by count(emp_id);