

--Create the first level tables

create table mechanic(
	mechanic_id serial primary key,
	first_name varchar(15),
	last_name varchar(15),
	hourly_rate numeric(5,2)
)

create table parts(
	part_id serial primary key,
	part_price numeric(6,2),
	part_name varchar(25)
)

create table customer(
	customer_id serial primary key,
	first_name varchar(15),
	last_name varchar(15),
	credit_score smallint
)

create table salesperson(
	salesperson_id serial primary key,
	first_name varchar(15),
	last_name varchar(15),
	hire_date date,
	salary numeric(6,0)
)

--Create tables with foreign keys

create table car(
	vin serial primary key,
	model_year smallint,
	model varchar (20),
	make varchar (20),
	used bool,
	msrp numeric(9,2),
	salesperson_id integer,
	foreign key(salesperson_id) references salesperson(salesperson_id)
)

create table sales_invoice(
	sales_invoice_id serial primary key,
	car_sell_price numeric(9,2),
	customer_id integer,
	foreign key(customer_id) references customer(customer_id),
	vin integer,
	foreign key(vin) references car(vin)

)

create table service_invoice(
	service_invoice_id serial primary key,
	vin integer,
	foreign key(vin) references car(vin),
	customer_id integer,
	foreign key(customer_id) references customer(customer_id),
	labor_cost numeric(7,2),
	parts_cost numeric(8,2),
	work_desc varchar(200)
	)
	
create table service_parts(
	service_parts_id serial primary key,
	part_id integer,
	foreign key(part_id) references parts(part_id),
	service_invoice_id integer,
	foreign key(service_invoice_id) references service_invoice(service_invoice_id),
	quantity smallint

)

create table mechanic_invoice(
	mechanic_id integer,
	foreign key(mechanic_id) references mechanic(mechanic_id),
	service_invoice_id integer,
	foreign key(service_invoice_id) references service_invoice(service_invoice_id),
	labor_hours smallint
)

-- Add some values for everything!!
insert into mechanic(first_name,last_name,hourly_rate)
	values ('Gayatri', 'Vanessa',125.00),
	('Noora', 'Kalpana',120.00),
	('Diana', 'Henning',150.00),
	('Taylor','Stephens',075.00)
	

insert into parts(part_price, part_name)
	values (300.00,'muffler'),
		   (25.00,'Wiper Blades'),
		   (999.99, 'carbeurator'),
		   (5000.00,'tire')

insert into customer(first_name,last_name,credit_score)
	values ('Braiden', 'Burnett',780),
		   ('Keegan', 'Coffey',220),
		   ('Tanya', 'Winters', 580)

insert into salesperson(first_name,last_name,hire_date,salary)
	values ('Jessie','Walsh',TO_DATE('03/17/2020','MM/DD/YYYY'),70000),
		   ('Tess', 'Spence',TO_DATE('05/12/2012','MM/DD/YYYY'),15000),
		   ('Liberty','Ayala',TO_DATE('10/15/1983','MM/DD/YYYY'),380000)

insert into car(model_year,model,make,used,msrp,salesperson_id)
	values(2022, 'F-150 Lightning', 'Ford', false, 40000,1),
		(1983, '900 Turbo', 'Saab',true,1000,3),
		(2020, 'Veyron','Bugatti',false,8000000,1),
		(1968, 'Robin','Reliant',true,7000,1),
		(1998, 'Boxer', 'Porshe',false,80000,2)


insert into sales_invoice(car_sell_price,customer_id,vin)
		values(50000,3,1),
			(10000,2,2),
			(800000,1,3),
			(700000,1,4),
			(55000,1,5)

insert into service_invoice(vin,customer_id,labor_cost,parts_cost,work_desc)
	values(3,1,20000,50000,'Replacing all tires after you spent 8 minutes at top speed.'),
		(4,1,80000,60000,'Car rolled several times at high speed due to only having one center front wheel.')

insert into service_parts(part_id,service_invoice_id,quantity)
	values(4,1,4),
		(3,2,8)
	

insert into mechanic_invoice(mechanic_id,service_invoice_id,labor_hours)
	values(1,1,4),
		(3,2,16)






