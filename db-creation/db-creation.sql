-- DB creation

create database xyz_company;

use xyz_company;

create table employee(
	id int primary key,
    name varchar(40),
    age int,
    department varchar(40)
    );
    
SELECT * FROM xyz_company.employee;

--  stored procedure for insertion and updation

DELIMITER $$
create procedure employeeInsertOrUpdate(
	in pId int,
	in pName varchar(40), 
	in pAge int,
	in pDepartment varchar(40)
    )
BEGIN
	declare type varchar(40);
	if exists( select * from employee where id = pId) then
		update employee
		set name = pName, age = pAge, department = pDepartment
		where id = pId;
        set type = 'Updated Successfully';
	else
		insert into employee(id, name, age, department)
		values(pId, pName, pAge, pDepartment);
        set type = 'Inserted Successfully';
	end if;
    select type;
END$$
DELIMITER ;

-- calling procedure

call employeeInsertOrUpdate(8, 'Ankit Jain', 23, 'Support');

-- droping procedure

drop procedure employeeInsertOrUpdate;