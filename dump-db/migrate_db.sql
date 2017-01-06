insert into data_bikes.manufacturers (id, name, years, description, logo_url, images_url, created_at, updated_at)
    select id, name, years, description, logo_url, images_url, now(), now()
    from data_motoplanete.bike_manufacturers;

insert into data_bikes.categories (id, name, created_at, updated_at)
    select id, name, now(), now()
    from data_motoplanete.bike_categories;

insert into data_bikes.bikes (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, created_at, updated_at, id_category, id_manufacturer)
    select id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, now(), now(), id_category, id_manufacturer
    from data_motoplanete.bike_general_information;	
	
insert into data_bikes.categories_bikes (created_at, updated_at, category_id, bike_id)
    select now(), now(), id_category, id
    from data_motoplanete.bike_general_information;
	
insert into data_bikes.manufacturers_bikes (created_at, updated_at, manufacturer_id, bike_id)
    select now(), now(), id_manufacturer, id
    from data_motoplanete.bike_general_information;
	
insert into data_bikes.features_dictionary (type, feature, value, correct_value, created_at, updated_at)
    select type, feature, value, correct_value, now(), now()
    from data_motoplanete.bike_features_dictionary;
	
insert into data_bikes.engines (id, gas_supply, camshaft, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, 
torque, power_to_weight_ratio, battery_pack, created_at, updated_at, id_bike)
select engine.id, engine.gas_supply, engine.act, engine.cooling, engine.displacement, engine.type, engine.valve, engine.valve_command, engine.engine_intake, 
	engine.bridable, engine.max_torque_rpm, engine.max_power_rpm, engine.power, engine.torque, engine.power_to_weight_ratio, engine.battery_pack, now(), now(), bike.id
    from data_motoplanete.bike_general_information as bike, data_motoplanete.bike_engine as engine
    where bike.id_engine = engine.id;
	
insert into data_bikes.frames (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight, created_at, updated_at, id_bike)
select frame.id, frame.dry_weight, frame.seat_height, frame.type, frame.tank_capacity, frame.lenght, frame.wheel_base, frame.width, frame.height, frame.moving_weight, now(), now(), bike.id
    from data_motoplanete.bike_general_information as bike, data_motoplanete.bike_frame as frame
    where bike.id_frame = frame.id;
	
insert into data_bikes.front_axles (id, fork, shock, wheel, brake, created_at, updated_at, id_bike)
select frontaxle.id, frontaxle.fork, frontaxle.front_shock, frontaxle.front_wheel, frontaxle.front_brake, now(), now(), bike.id
    from data_motoplanete.bike_general_information as bike, data_motoplanete.bike_front_axle as frontaxle
    where bike.id_front_axle = frontaxle.id;
	
insert into data_bikes.rear_axles (id, shock, brake, wheel, type, created_at, updated_at, id_bike)
select rearaxle.id, rearaxle.rear_shock, rearaxle.rear_brake, rearaxle.rear_wheel, rearaxle.type, now(), now(), bike.id
    from data_motoplanete.bike_general_information as bike, data_motoplanete.bike_rear_axle as rearaxle
    where bike.id_rear_axle = rearaxle.id;
	
insert into data_bikes.transmissions (id, gearbox_speeds, gearbox_type, secondary_transmission, type, created_at, updated_at, id_bike)
select transmission.id, transmission.gearbox_speeds, transmission.gearbox_type, transmission.secondary_transmission, transmission.type, now(), now(), bike.id
    from data_motoplanete.bike_general_information as bike, data_motoplanete.bike_transmission as transmission
    where bike.id_rear_axle = transmission.id;
	
	
UPDATE data_bikes.bikes
SET images_url[1] = replace(images_url[1], 'http://www.motoplanete.com/', '/api/images/bikes/');

UPDATE data_bikes.manufacturers
SET logo_url = '/api/images/manufacturers/' || replace(lower(name), ' ', '-') || '.png';




