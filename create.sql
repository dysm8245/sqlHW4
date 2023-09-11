drop table if exists customer cascade;
create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

drop table if exists salesperson cascade;
create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

drop table if exists car cascade;
create table car(
	VIN SERIAL primary key,
	make VARCHAR(30),
	model VARCHAR(30),
	year_ VARCHAR(4)
);

drop table if exists service_history cascade;
create table service_history(
	VIN INTEGER primary key,
	times_serviced INTEGER,
	service_notes text,
	foreign key(VIN) references car(VIN)
);

drop table if exists mechanic cascade;
create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

drop table if exists parts cascade;
create table parts(
	part_id SERIAL primary key,
	part_name VARCHAR(50),
	quantity INTEGER
);

drop table if exists invoice cascade;
create table invoice(
	invoice_id SERIAL primary key,
	salesperson_id INTEGER not null,
	VIN INTEGER not null,
	customer_id INTEGER not null,
	sale_price NUMERIC(7,2),
	dat_of_sale DATE default CURRENT_DATE,
	foreign key(salesperson_id) references salesperson(salesperson_id),
	foreign key(VIN) references car(VIN),
	foreign key(customer_id) references customer(customer_id)
);


create table service_ticket(
	appointment_id SERIAL primary key,
	customer_id INTEGER not null,
	VIN INTEGER not null,
	service_date DATE default CURRENT_DATE,
	service_price NUMERIC(5,2),
	foreign key(customer_id) references customer(customer_id),
	foreign key(VIN) references car(VIN)
);


create table service_details(
	appointment_id INTEGER not null,
	mechanic_id INTEGER not null,
	part_id INTEGER,
	primary key(appointment_id, mechanic_id),
	foreign key(appointment_id) references service_ticket(appointment_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(part_id) references parts
);