-- stored function for adding customers
create or replace function add_customer(first_ VARCHAR, last_ VARCHAR)
	returns void
	language plpgsql
	as $MAIN$
	begin 
		insert into customer(first_name, last_name)
		values(first_, last_);
	end;
	$MAIN$;

--stored function for adding salesperson
create or replace function add_salesperson(first_ VARCHAR, last_ VARCHAR)
	returns void
	language plpgsql
	as $MAIN$
	begin 
		insert into salesperson(first_name, last_name)
		values(first_, last_);
	end;
	$MAIN$;

--stored function for adding mechanic
create or replace function add_mechanic(first_ VARCHAR, last_ VARCHAR)
	returns void
	language plpgsql
	as $MAIN$
	begin 
		insert into mechanic(first_name, last_name)
		values(first_, last_);
	end;
	$MAIN$;

--stored function for adding car
create or replace function add_car(make_ VARCHAR, model_ VARCHAR, car_year VARCHAR)
	returns void
	language plpgsql
	as $MAIN$
	begin 
		insert into car(make, model, year_)
		values(make_, model_, car_year);
	end;
	$MAIN$;

--add customer
select add_customer('Fatima', 'Armas');
select add_customer('Dylan', 'Smith');

--add salesperson
select add_salesperson('Thomas', 'Johnson');
select add_salesperson('Karri', 'Smith');

--add mechanic
select add_mechanic('Boris', 'Norris');
select add_mechanic('Jimbo', 'Doyle');

--add car
select add_car('Ford', 'F-150', '2023');
select add_car('Ford', 'Escape', '2022');

--add invoice
insert into invoice(salesperson_id, VIN, customer_id, sale_price)
values(1,1,1,50000);
insert into invoice(salesperson_id, VIN, customer_id, sale_price)
values(2,2,2,30000);
select * from salesperson;

--add service_ticket
insert into service_ticket(customer_id, VIN, service_price)
values(1,1, 80.34);
insert into service_ticket(customer_id, VIN, service_price)
values(2,2, 120.56);

--add service_history
insert into service_history(VIN, times_serviced, service_notes)
values(1,1,'oil change');
insert into service_history(VIN, times_serviced, service_notes)
values(2,2,'gasket change');

--add parts
insert into parts(part_name, quantity)
values('gasket', 150);
insert into parts(part_name, quantity)
values('catalytic converter', 10);

--add service_details
insert into service_details(appointment_id, mechanic_id, part_id)
values(2,1,1);
insert into service_details(appointment_id, mechanic_id)
values(2,2);

--select * from service_details;