create database payroll_service;  
show databases;               
use payroll_service;              
create table employee_payroll (         
     id INT unsigned NOT NULL AUTO_INCREMENT,
     name VARCHAR(150) NOT NULL,
     salary Double NOT NULL,
     start DATE NOT NULL,
     PRIMARY KEY (id)
     );

DESCRIBE employee_payroll;     

insert into employee_payroll (name, salary, start) values  
    ( 'bill',100000.00,'2018-01-03'),
	('terisa',200000.00,'2019-11-13');

select * from employee_payroll;      
select salary from employee_payroll where name='bill'; 
select * from employee_payroll where start between CAST('2018-01-01' AS DATE)AND DATE(NOW());  

alter table employee_payroll add gender char(1) after name;     

update employee_payroll set gender = 'M' where name = 'bill';     

select * from employee_payroll;

select sum(salary) from employee_payroll where gender = 'F' group by gender; 
           
select gender, count(name) from employee_payroll group by gender;  
   

select * ,avg(salary) from employee_payroll; 
alter table employee_payroll add phone_number varchar(250) after name; 

alter table employee_payroll add address varchar(100) DEFAULT 'TBD' after phone, 

alter table employee_payroll add department varchar(150) not null after address;

ALTER table employee_payroll rename column salary to basic_pay,
     add deductions int not null after basicPay,
     add taxablePay int not null after deductions,
     add incomeTax int not null after taxablePay,
     add netPay int not null after incomePay;


 update employee_payroll set department='Sales' where name='terisa';
 insert into employee_payroll(name,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start) values
    ('terisa','Marketing','F',3000000.00,1000000.00,3000000.00,500000.00,1500000.00,'2019-11-13');


CREATE TABLE employee (
  emp_id int NOT NULL,
  name varchar(20),
  dep_name varchar(20) NOT NULL,
  gender varchar(20),
  start_date int,
  phone_no int,
  city varchar(20),
  country varchar(20),
  PRIMARY KEY (emp_id)
);
insert into employee values(1,'david','IT','F','2021-07-02','9892348589','denim','IND');

insert into employee values(2,'sakhi','Computers','F','2022-05-04','9259345789','karann','IND');

insert into employee values(3,'sravani','IT','F','2020-04-08','9994859362','dil','IND');


CREATE TABLE company (
  cmp_id int NOT NULL,
  name_cmp varchar(20),
  PRIMARY KEY (cmp_id)
);
insert into company values('amazon',1);

insert into company values('google',2);

insert into company values('EY',3);


CREATE TABLE salary (
  emp_id int,
  basic int,
  deduction int,
  taxable int,
  tax int,
  netpay int,
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
insert into salary values(1,20000,500,15000,680,16000);

CREATE TABLE department (
  dep_name varchar(20),
  emp_id int,
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
insert into department values('Comp',1);
insert into department values('IT',2);

select employee.gender,sum(salary.basic_pay) from employee inner join salary on employee.payment=payroll.payment_id group by gender;

select * from employee e,department d,address a,payroll p,company c
     where c.emp_id = e.emp_id
    and c.dept_id = d.dept_id
    and a.emp_id = e.emp_id
     and p.emp_id = e.emp_id
    and e.start between Date('2018-01-01') and Date('2021-12-31');

