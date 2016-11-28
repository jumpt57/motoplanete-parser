--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-11-28 15:14:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE motorcycleportal;
--
-- TOC entry 2182 (class 1262 OID 84142)
-- Name: motorcycleportal; Type: DATABASE; Schema: -; Owner: motorcycleportal
--

CREATE DATABASE motorcycleportal WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE motorcycleportal OWNER TO motorcycleportal;

\connect motorcycleportal

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 84143)
-- Name: data_bikes; Type: SCHEMA; Schema: -; Owner: motorcycleportal
--

CREATE SCHEMA data_bikes;


ALTER SCHEMA data_bikes OWNER TO motorcycleportal;

--
-- TOC entry 189 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 189
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = data_bikes, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 84144)
-- Name: bike_categories; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE bike_categories OWNER TO motorcycleportal;

--
-- TOC entry 185 (class 1259 OID 84200)
-- Name: bike_engine; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_engine (
    id integer NOT NULL,
    gas_supply character varying(100),
    act character varying(100),
    cooling character varying(100),
    displacement character varying(100),
    type character varying(100),
    valve character varying(100),
    valve_command character varying(100),
    engine_intake character varying(100),
    bridable character varying(100),
    max_torque_rpm integer,
    max_power_rpm integer,
    power double precision,
    torque double precision,
    camshaft character varying(100),
    power_to_weight_ratio double precision
);


ALTER TABLE bike_engine OWNER TO motorcycleportal;

--
-- TOC entry 188 (class 1259 OID 84337)
-- Name: bike_features_dictionary; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_features_dictionary (
    feature character varying(100) NOT NULL,
    value character varying(255) NOT NULL,
    correct_value character varying(255)
);


ALTER TABLE bike_features_dictionary OWNER TO motorcycleportal;

--
-- TOC entry 187 (class 1259 OID 84222)
-- Name: bike_frame; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_frame (
    id integer NOT NULL,
    dry_weight double precision,
    seat_height double precision,
    type character varying(100),
    tank_capacity double precision,
    lenght integer,
    wheel_base integer,
    width integer,
    height double precision,
    moving_weight double precision
);


ALTER TABLE bike_frame OWNER TO motorcycleportal;

--
-- TOC entry 184 (class 1259 OID 84189)
-- Name: bike_front_axle; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_front_axle (
    id integer NOT NULL,
    fork character varying(255),
    front_shock character varying(255),
    front_wheel character varying(255),
    front_brake character varying(255)
);


ALTER TABLE bike_front_axle OWNER TO motorcycleportal;

--
-- TOC entry 182 (class 1259 OID 84162)
-- Name: bike_general_information; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_general_information (
    id integer NOT NULL,
    name character varying,
    images_url character varying(255)[],
    year character varying(4),
    max_speed integer,
    zero_to_hundred double precision,
    price integer,
    price_with_abs integer,
    id_category integer,
    id_rear_axle integer,
    id_front_axle integer,
    id_engine integer,
    id_transmission integer,
    id_frame integer,
    id_manufacturer integer
);


ALTER TABLE bike_general_information OWNER TO motorcycleportal;

--
-- TOC entry 181 (class 1259 OID 84152)
-- Name: bike_manufacturers; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_manufacturers (
    id integer NOT NULL,
    name character varying(100),
    years character varying(255)[],
    description character varying(255),
    logo_url character varying(255),
    images_url character varying(255)[]
);


ALTER TABLE bike_manufacturers OWNER TO motorcycleportal;

--
-- TOC entry 183 (class 1259 OID 84178)
-- Name: bike_rear_axle; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_rear_axle (
    id integer NOT NULL,
    rear_shock character varying(255),
    rear_brake character varying(255),
    rear_wheel character varying(255),
    type character varying(100)
);


ALTER TABLE bike_rear_axle OWNER TO motorcycleportal;

--
-- TOC entry 186 (class 1259 OID 84211)
-- Name: bike_transmission; Type: TABLE; Schema: data_bikes; Owner: motorcycleportal
--

CREATE TABLE bike_transmission (
    id integer NOT NULL,
    gearbox_speeds character varying(100),
    geerbox_type character varying(100),
    secondary_transmission character varying(100),
    type character varying(100)
);


ALTER TABLE bike_transmission OWNER TO motorcycleportal;

--
-- TOC entry 2169 (class 0 OID 84144)
-- Dependencies: 180
-- Data for Name: bike_categories; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_categories (id, name) VALUES (1, 'Sportive');
INSERT INTO bike_categories (id, name) VALUES (2, 'Roadster');
INSERT INTO bike_categories (id, name) VALUES (3, '125 sportive');
INSERT INTO bike_categories (id, name) VALUES (4, '125 roadster');
INSERT INTO bike_categories (id, name) VALUES (5, 'Trail');
INSERT INTO bike_categories (id, name) VALUES (6, 'Super motard');
INSERT INTO bike_categories (id, name) VALUES (7, 'Superbike');
INSERT INTO bike_categories (id, name) VALUES (8, 'Série spéciale');
INSERT INTO bike_categories (id, name) VALUES (9, 'Sport-GT');
INSERT INTO bike_categories (id, name) VALUES (10, '125 trail');
INSERT INTO bike_categories (id, name) VALUES (11, '125 custom');


--
-- TOC entry 2174 (class 0 OID 84200)
-- Dependencies: 185
-- Data for Name: bike_engine; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (1, 'Injection Ø 48 mm', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 13000, 201, 11.699999999999999, NULL, 0.90000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (2, 'Injection Ø 48 mm', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 13000, 201, 11.699999999999999, NULL, 0.90000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (3, 'Injection Ø 48 mm', '2 ACT', 'par eau', '1077 cc (81 x 52.3 mm)', 'Bicylindre en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9000, 11000, 175, 12.300000000000001, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (4, 'Injection Ø 48 mm', '2 ACT', 'par eau', '1077 cc (81 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9000, 11000, 175, 12.300000000000001, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (5, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8250, 10500, 15, 1.1100000000000001, NULL, 8.9299999999999997);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (6, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8250, 10500, 15, 1.1100000000000001, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (7, 'Injection Ø 48 mm', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 13000, 201, 11.699999999999999, NULL, 0.90000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (8, 'Injection Ø 48 mm', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 13000, 201, 11.699999999999999, NULL, 0.90000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (9, 'Injection Ø nc', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, NULL, NULL, 230, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (10, 'Injection Ø 48 mm', '2 ACT', 'par eau', '1077 cc (81 x 52.3 mm)', 'Bicylindre en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9000, 11000, 175, 12.300000000000001, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (11, 'Injection Ø 48 mm', '2 ACT', 'par eau', '1077 cc (81 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9000, 11000, 175, 12.300000000000001, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (12, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (13, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6800, 8250, 125, 11.699999999999999, NULL, 1.71);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (14, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6800, 8250, 125, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (15, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7200, 8700, 130, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (16, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (17, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8250, 10500, 15, 1.1100000000000001, NULL, 8.9299999999999997);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (18, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8250, 10500, 15, 1.1100000000000001, NULL, 8.9299999999999997);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (19, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (20, 'Injection Ø 48 mm', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 13000, 201, 11.699999999999999, NULL, 0.90000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (21, 'Injection Ø 48 mm', '2 ACT', 'par eau', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 13000, 201, 11.699999999999999, NULL, 0.90000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (22, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (23, 'Injection Ø 48 mm', '2 ACT', 'par eau', '1077 cc (81 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9000, 11000, 175, 12.199999999999999, NULL, 1.05);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (24, 'Injection Ø 48 mm', '2 ACT', 'par eau', '1077 cc (81 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9000, 11000, 175, 12.199999999999999, NULL, 1.05);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (25, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6800, 8250, 125, 11.699999999999999, NULL, 1.71);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (26, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6800, 8250, 125, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (27, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7200, 8700, 130, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (28, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (29, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8250, 10500, 15, 1.1100000000000001, NULL, 8.9299999999999997);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (30, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (31, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 12500, 184, 11.9, NULL, 0.97999999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (32, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 184, 11.9, NULL, 1.01);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (33, 'Injection électronique Marelli, papillon', '1 ACT par cylindre', 'liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (34, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (35, 'Injection Ø 48 mm', '2 ACT', 'Refroidissement liquide', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9500, 11500, 170, 11.5, NULL, 1.05);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (36, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6800, 8250, 125, 11.699999999999999, NULL, 1.71);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (37, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7200, 8700, 130, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (38, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (39, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8250, 10500, 15, 1.1100000000000001, NULL, 8.9299999999999997);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (40, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (41, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10500, 12500, 184, 11.9, NULL, 0.97999999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (42, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12250, 180, 11.699999999999999, NULL, 1.03);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (43, 'Injection électronique Marelli, papillon', '1 ACT par cylindre', 'liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (44, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (45, 'Injection Ø 48 mm', '2 ACT', 'Refroidissement liquide', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9500, 11500, 167, 11.199999999999999, NULL, 1.0700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (46, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6800, 8250, 125, 11.9, NULL, 1.71);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (47, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7200, 8700, 130, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (48, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto accessible au permis A2 ou bridable à 48ch', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (49, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (50, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (51, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12250, 180, 11.5, NULL, 0.98999999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (52, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 180, 11.5, NULL, 1.01);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (53, 'Injection électronique Marelli, papillon', '1 ACT par cylindre', 'liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (54, 'Injection ''Ride by Wire'' avec sélectio', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (55, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (56, 'Injection Ø 48 mm', '2 ACT', 'Refroidissement liquide', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9500, 11500, 167, 11.199999999999999, NULL, 1.0700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (57, 'Injection Ø 48 mm', '2 ACT', 'Refroidissement liquide', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9500, 11500, 167, 11.199999999999999, NULL, 1.0700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (58, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7200, 8700, 130, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (59, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (60, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (61, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (62, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (63, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 180, 11.5, NULL, 0.98999999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (64, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12250, 180, 11.5, NULL, 0.98999999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (65, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12250, 180, 11.5, NULL, 0.98999999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (66, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 180, 11.5, NULL, 1.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (67, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 180, 11.5, NULL, 1.01);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (68, 'Injection électronique Marelli, papillon', '1 ACT par cylindre', 'liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (69, 'Injection Ø 38 mm', '1 ACT par cylindre', 'Refroidissement liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (70, 'Injection ''Ride by Wire'' avec sélectio', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (71, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (72, 'Injection Ø 48 mm', '2 ACT', 'Refroidissement liquide', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9500, 11500, 167, 11.199999999999999, NULL, 1.0700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (73, 'Injection Ø 48 mm', '2 ACT', 'Refroidissement liquide', '999.6 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 9500, 11500, 167, 11.199999999999999, NULL, 1.0700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (74, 'Injection Ø nc', '2 ACT', 'Refroidissement liquide', '1197 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7200, 8700, 130, 11.699999999999999, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (75, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (76, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (77, 'Injection Ø 32 mm', '2 ACT', 'Refroidissement liquide', '124.8 cc (58 x 47 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (78, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 200, 12.5, NULL, 0.88);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (79, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 180, 11.5, NULL, 0.98999999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (80, 'Injection Ø 48 mm', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 10000, 12500, 180, 11.5, NULL, 1.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (81, 'Injection électronique Marelli, papillon', '1 ACT par cylindre', 'liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (82, 'Injection Ø 38 mm', '1 ACT par cylindre', 'Refroidissement liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (83, 'Injection ''Ride by Wire'' avec sélectio', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (84, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (85, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3300000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (86, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (87, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (88, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (89, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (90, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (91, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'Admission à clapets', NULL, 6500, 10000, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (92, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'Admission à clapets', NULL, 6500, 10000, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (93, 'Injection', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, NULL, NULL, 210, NULL, NULL, 0.77000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (94, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 143, 10.300000000000001, NULL, 1.3200000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (95, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 143, 10.300000000000001, NULL, 1.29);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (96, 'Injection électronique Marelli, papillon', '1 ACT par cylindre', 'liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (97, 'Injection Ø 38 mm', '1 ACT par cylindre', 'Refroidissement liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (98, 'Injection ''Ride by Wire'' avec sélectio', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (99, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (100, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3300000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (101, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (102, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '660 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes', NULL, NULL, NULL, 5000, 6000, 48, 6.0099999999999998, NULL, 3.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (103, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (104, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (105, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (106, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'Admission à clapets', NULL, 6500, 10000, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (107, 'Injection', 'double ACT', 'Refroidissement liquide', '998 cc (78 x 52.3 mm)', '4 Cylindres en V à 65°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, NULL, NULL, 210, NULL, NULL, 0.77000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (108, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 143, 10.300000000000001, NULL, 1.3200000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (109, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 143, 10.300000000000001, NULL, 1.29);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (110, 'Injection Ø 52 mm', '2 ACT', 'Refroidissement liquide', '1196 cc (106 x 67.8 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 4000, 9500, 135, 10.5, NULL, 1.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (111, 'Injection Ø 38 mm', '1 ACT par cylindre', 'Refroidissement liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (112, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (113, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3300000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (114, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (115, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '660 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes', NULL, NULL, NULL, 5000, 6000, 48, 6.0099999999999998, NULL, 3.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (116, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (117, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (118, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (119, 'Injection', '2 ACT', 'Refroidissement liquide', '749.9 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, 'Moto bridable à 34ch pour le permis A MTT1', 4500, 8750, 92, 8.4000000000000004, NULL, 2.02);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (120, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'Admission à clapets', NULL, 6500, 10000, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (121, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 143, 10.300000000000001, NULL, 1.3200000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (122, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 133, 10.300000000000001, NULL, 1.3700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (123, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '995.8 cc (100 x 63.4 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 11000, 150, 11.5, NULL, 1.23);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (124, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 143, 10.300000000000001, NULL, 1.3200000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (125, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 143, 10.300000000000001, NULL, 1.29);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (126, 'Injection Ø 38 mm', '1 ACT par cylindre', 'Refroidissement liquide', '839.3 cc (88 x 69 mm mm)', 'Bicylindre à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5000, 8000, 76, 7.4500000000000002, NULL, 2.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (127, 'Injection Ø 52 mm et Ride By Wire', '2 ACT', 'Refroidissement liquide', '749 cc (92 x 56.4 mm)', 'Bicylindre en V à 90°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7000, 9000, 95, 8.25, NULL, 1.99);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (128, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3300000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (129, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 9500, 139, 10.9, NULL, 1.3);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (130, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '660 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes', NULL, NULL, NULL, 5000, 6000, 48, 6.0099999999999998, NULL, 3.5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (131, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (132, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (133, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (134, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'Admission à clapets', NULL, 6500, 10000, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (135, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 143, 10.300000000000001, NULL, 1.3200000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (136, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 143, 10.300000000000001, NULL, 1.29);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (137, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8750, 9500, 133, 10.4, NULL, 1.3899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (138, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (139, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (140, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (141, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'Admission à clapets', NULL, 6500, 10000, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (142, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 138, 10.300000000000001, NULL, 1.3700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (143, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 138, 10.300000000000001, NULL, 1.3400000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (144, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7250, 9500, 126, 10.300000000000001, NULL, 1.52);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (145, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (146, 'Injection Ø 44 mm', '1 ACT', 'Refroidissement liquide', '659 cc (100 x 84 mm)', 'Monocylindre, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 5200, 6250, 50, 6.25, NULL, 3.3599999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (147, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (148, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (149, 'Injection', '2 ACT', 'liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 118, 9.5999999999999996, NULL, 1.6100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (150, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (151, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'par clapets', NULL, 6500, NULL, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (152, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10800, 11900, 70, 3.8999999999999999, NULL, 1.8899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (153, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 138, 10.300000000000001, NULL, 1.3700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (154, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 138, 10.300000000000001, NULL, 1.3400000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (155, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9500, 143, 10.300000000000001, NULL, 1.24);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (156, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 141, 10.300000000000001, NULL, 1.24);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (157, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7250, 9500, 126, 10.300000000000001, NULL, 1.52);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (158, 'Injection Ø nc', '2 ACT', 'par eau', '652 cc (100 x 83 mm)', 'Monocylindre en ligne, 4 temps', '5 soupapes', NULL, NULL, NULL, 5000, 6300, 49, 5.5, NULL, 3.5699999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (159, 'Injection Ø 34 mm', '2 ACT', 'Refroidissement liquide', '652 cc (100 x 83 mm)', 'Monocylindre, 4 temps', '5 soupapes par cylindre', NULL, NULL, NULL, 4500, 6300, 49, 5.9000000000000004, NULL, 3.5699999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (160, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (161, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (162, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 114, 9.4000000000000004, NULL, 1.8400000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (163, 'Injection', '2 ACT', 'liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 118, 9.5999999999999996, NULL, 1.6100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (164, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (165, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'par clapets', NULL, 6500, NULL, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (166, 'Injection Ø 57 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 135, 10.300000000000001, NULL, 1.3500000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (167, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 133, 10.300000000000001, NULL, 1.3700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (168, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '995.8 cc (100 x 63.4 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 11000, 150, 11.5, NULL, 1.23);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (169, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.46);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (170, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 130, 10.300000000000001, NULL, 1.4099999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (171, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7250, 9500, 126, 10.300000000000001, NULL, 1.52);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (172, 'Injection Ø nc', '2 ACT', 'par eau', '652 cc (100 x 83 mm)', 'Monocylindre en ligne, 4 temps', '5 soupapes', NULL, NULL, NULL, 5000, 6300, 49, 5.5, NULL, 3.5699999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (173, 'Injection Ø 34 mm', '2 ACT', 'Refroidissement liquide', '652 cc (100 x 83 mm)', 'Monocylindre, 4 temps', '5 soupapes par cylindre', NULL, NULL, NULL, 4500, 6300, 49, 5.9000000000000004, NULL, 3.5699999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (174, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (175, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (176, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 114, 9.4000000000000004, NULL, 1.8400000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (177, 'Injection', '2 ACT', 'liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 118, 9.5999999999999996, NULL, 1.6100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (178, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (179, '1 carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre, 2 temps', NULL, NULL, 'par clapets', NULL, 6500, NULL, 35, 1.3, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (180, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 133, 10.300000000000001, NULL, 1.3700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (181, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '995.8 cc (100 x 63.4 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 11000, 150, 11.5, NULL, 1.23);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (182, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (183, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.46);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (184, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.46);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (185, 'Injection', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 7250, 9500, 130, 10.300000000000001, NULL, 1.3899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (186, 'Injection Ø nc', '2 ACT', 'par eau', '652 cc (100 x 83 mm)', 'Monocylindre en ligne, 4 temps', '5 soupapes', NULL, NULL, NULL, 5000, 6300, 49, 5.5, NULL, 3.5699999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (187, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (188, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 114, 9.4000000000000004, NULL, 1.8400000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (189, 'Injection', '2 ACT', 'liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 118, 9.5999999999999996, NULL, 1.6100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (190, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (191, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (192, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.46);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (193, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.46);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (194, 'Injection Ø nc', '2 ACT', 'par eau', '652 cc (100 x 83 mm)', 'Monocylindre en ligne, 4 temps', '5 soupapes', NULL, NULL, NULL, 5000, 6300, 49, 5.5, NULL, 3.5699999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (195, 'Injection Ø 47 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6250, 8250, 98, 9.8000000000000007, NULL, 2.1899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (196, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 114, 9.4000000000000004, NULL, 1.8400000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (197, 'Injection', '2 ACT', 'liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 118, 9.5999999999999996, NULL, 1.6100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (198, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (199, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '123.6 cc (54 x 54 mm)', 'Monocylindre, 2 temps', NULL, NULL, NULL, NULL, 6000, 6750, 13, 1.3999999999999999, NULL, 8.8499999999999996);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (200, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (201, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 10000, 133, 10.300000000000001, NULL, 1.3700000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (202, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '995.8 cc (100 x 63.4 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8500, 11000, 150, 11.5, NULL, 1.23);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (203, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (204, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.48);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (205, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.45);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (206, 'Injection', '2 ACT', 'liquide', '997.6 cc (97 x 67.5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes', NULL, NULL, NULL, 7000, 9250, 118, 9.5999999999999996, NULL, 1.6100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (207, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (208, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '123.6 cc (54 x 54 mm)', 'Monocylindre, 2 temps', NULL, NULL, NULL, NULL, 6000, 6750, 13, 1.3999999999999999, NULL, 8.8499999999999996);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (209, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (210, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (211, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.48);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (212, 'Carburateur Ø 28 mm', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 10000, 11250, 35, 2, NULL, 3.2599999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (213, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '123.6 cc (54 x 54 mm)', 'Monocylindre, 2 temps', NULL, NULL, NULL, NULL, 6000, 6750, 13, 1.3999999999999999, NULL, 8.8499999999999996);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (214, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (215, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (216, 'Injection Ø 51 mm', '2 ACT', 'Refroidissement liquide', '997.6 cc (97 x 67,5 mm)', 'Bicylindre en V à 60°, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 8000, 9250, 128, 10.300000000000001, NULL, 1.48);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (217, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '123.6 cc (54 x 54 mm)', 'Monocylindre, 2 temps', NULL, NULL, NULL, NULL, 6000, 6750, 13, 1.3999999999999999, NULL, 8.8499999999999996);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (218, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (219, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (220, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (221, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (222, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (223, '2 carburateurs Ø 34 mm', NULL, 'Refroidissement liquide', '249 cc (56 x 50.6 mm)', 'Bicylindre en V à 90°, 2 temps', NULL, NULL, NULL, NULL, 10750, 11900, 70, 4.0999999999999996, NULL, 2.0099999999999998);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (224, 'Carburateur Ø nc', NULL, 'Refroidissement liquide', '124.8 cc (54 x 54.5 mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, 'admission à clapets', NULL, 6500, 6600, 15, 1.3, NULL, 9.6699999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (225, NULL, NULL, 'par air', '562 cc (94 x 81 mm mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6, 7, 46, 5, 'simple arbre à came en tête', 3.2000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (226, NULL, NULL, 'par air', '562 cc (94 x 81 mm mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6, 7, 46, 5, 'simple arbre à came en tête', 3.2000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (227, NULL, NULL, 'liquide', '124.8 cc (54 x 54.5 mm mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, NULL, NULL, 9, 11, 29, 2.2999999999999998, NULL, 3.9100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (228, NULL, NULL, 'par air', '562 cc (94 x 81 mm mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6, 7, 46, 5, 'simple arbre à came en tête', 3.2000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (229, NULL, NULL, 'liquide', '124.8 cc (54 x 54.5 mm mm)', 'Monocylindre en ligne, 2 temps', NULL, NULL, NULL, NULL, 9, 11, 29, 2.2999999999999998, NULL, 3.9100000000000001);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (230, NULL, NULL, 'par air', '562 cc (94 x 81 mm mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6, 7, 46, 5, 'simple arbre à came en tête', 3.2000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (231, NULL, NULL, 'par air', '562 cc (94 x 81 mm mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6, 7, 46, 5, 'simple arbre à came en tête', 3.2000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (232, '1 carbu Ø 34 mm', '1 ACT', 'par air', '349.2 cc (79.5 x 70.4 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, 6000, 7500, 33, 2.8999999999999999, NULL, 4.0899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (233, NULL, NULL, 'par air', '562 cc (94 x 81 mm mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes par cylindre', NULL, NULL, NULL, 6, 7, 46, 5, 'simple arbre à came en tête', 3.2000000000000002);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (234, '1 carbu Ø 34 mm', '1 ACT', 'par air', '349.2 cc (79.5 x 70.4 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, 6000, 7500, 33, 2.8999999999999999, NULL, 4.0899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (235, '1 carbu Ø 34 mm', '1 ACT', 'par air', '349.2 cc (79.5 x 70.4 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, 6000, 7500, 33, 2.8999999999999999, NULL, 4.0899999999999999);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (236, '1 carbu Ø 34 mm', '1 ACT', 'par air', '349.2 cc (79.5 x 70.4 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, 6000, 7000, 27, 2.8999999999999999, NULL, 5);
INSERT INTO bike_engine (id, gas_supply, act, cooling, displacement, type, valve, valve_command, engine_intake, bridable, max_torque_rpm, max_power_rpm, power, torque, camshaft, power_to_weight_ratio) VALUES (237, '1 carbu Ø 34 mm', '1 ACT', 'par air', '349.2 cc (79.5 x 70.4 mm)', 'Monocylindre en ligne, 4 temps', '4 soupapes', NULL, NULL, NULL, 6000, 7000, 27, 2.8999999999999999, NULL, 5);


--
-- TOC entry 2177 (class 0 OID 84337)
-- Dependencies: 188
-- Data for Name: bike_features_dictionary; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('cooling', 'par eau', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('act', '2 ACT', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('cooling', 'Refroidissement liquide', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('act', 'double ACT', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('cooling', 'liquide', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('act', '1 ACT par cylindre', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('act', '1 ACT', '');
INSERT INTO bike_features_dictionary (feature, value, correct_value) VALUES ('cooling', 'par air', '');


--
-- TOC entry 2176 (class 0 OID 84222)
-- Dependencies: 187
-- Data for Name: bike_frame; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (1, 180, 840, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (2, 180, 840, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (3, NULL, 825, 'double poutre périmetrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (4, NULL, 825, 'double poutre périmetrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (5, 134, 820, 'Double poutre périmétrique en alu', 14.5, 1968, 1353, 760, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (6, NULL, 820, 'Double poutre périmétrique en alu', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (7, 180, 840, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (8, 180, 840, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (9, NULL, NULL, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (10, NULL, 825, 'double poutre périmetrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (11, NULL, 825, 'double poutre périmetrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (12, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (13, 228, 840, 'treillis tubulaire en tube d''acier relié à des platines en alu', 24, 2245, 1565, NULL, 1440, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (14, NULL, NULL, 'treillis tubulaire en tube d''acier relié à des platines en alu', 24, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (15, NULL, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2248, 1528, 925, 1205, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (16, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (17, 134, 820, 'Double poutre périmétrique en alu', 14.5, 1968, 1353, 760, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (18, 134, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (19, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (20, 180, 840, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (21, 180, 840, 'Double poutre périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (22, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (23, 184, 825, 'périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (24, 184, 825, 'périmétrique en aluminium', 18.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (25, 228, 840, 'treillis tubulaire en tube d''acier relié à des platines en alu', 24, 2245, 1565, NULL, 1440, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (26, NULL, NULL, 'treillis tubulaire en tube d''acier relié à des platines en alu', 24, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (27, NULL, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2248, 1528, 925, 1205, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (28, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (29, 134, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (30, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (31, 181, 845, 'Double poutre périmétrique en aluminium', 18.5, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (32, 186, 840, 'Double poutre périmétrique en aluminium', 18.5, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (33, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (34, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (35, 179, 835, 'Double poutre périmétrique en alu', 18.5, 2065, 1440, 800, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (36, 228, 840, 'treillis tubulaire en tube d''acier relié à des platines en alu', 24, 2245, 1565, NULL, 1440, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (37, NULL, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2248, 1528, 925, 1205, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (38, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (39, 134, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (40, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (41, 181, 845, 'Double poutre périmétrique en aluminium', 18.5, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (42, 186, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (43, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (44, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (45, 179, 835, 'Double poutre périmétrique en alu', 17, 2065, 1440, 800, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (46, 228, 840, 'treillis tubulaire en tube d''acier relié à des platines en alu', 24, 2245, 1565, NULL, 1440, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (47, NULL, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2248, 1528, 925, 1205, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (48, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (49, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (50, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (51, 179, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (52, 182, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1424, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (53, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (54, 192, 810, 'Treillis tubulaire en acier relié à deux platines en alu', 16, 2265, 1440, 800, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (55, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (56, 179, 835, 'Double poutre périmétrique en alu', 17, 2065, 1440, 800, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (57, 179, 835, 'Double poutre périmétrique en alu', 17, 2065, 1440, 800, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (58, NULL, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2248, 1528, 925, 1205, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (59, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (60, 184, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (61, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (62, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (63, 179, 845, 'Double poutre périmétrique en aluminium', 17, 2050, 1424, 715, 1165, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (64, 179, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (65, 179, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1420, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (66, 184, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1424, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (67, 182, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1424, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (68, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (69, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (70, 192, 810, 'Treillis tubulaire en acier relié à deux platines en alu', 16, 2265, 1440, 800, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (71, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (72, 179, 835, 'Double poutre périmétrique en alu', 17, 2065, 1440, 800, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (73, 179, 835, 'Double poutre périmétrique en alu', 17, 2065, 1440, 800, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (74, NULL, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2248, 1528, 925, 1205, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (75, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (76, 184, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (77, NULL, 820, 'Double poutre périmétrique en alu', 14.5, 1953, 1350, 740, 1138, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (78, 175, 880, 'Double poutre périmétrique en aluminium', 17, 2050, 1440, 715, 1165, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (79, 179, 845, 'Double poutre périmétrique en aluminium', 17, 2050, 1424, 715, 1165, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (80, 184, 845, 'Double poutre périmétrique en aluminium', 17, 2040, 1424, 735, 1120, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (81, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (82, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (83, 192, 810, 'Treillis tubulaire en acier relié à deux platines en alu', 16, 2265, 1440, 800, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (84, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (85, 185, 810, 'Double poutre périmétrique en aluminium', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (86, 181, 810, 'double poutre en alliage alu', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (87, 168, 780, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (88, 168, 820, 'Monopoutre en acier à berceau ouvert', 16, 2160, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (89, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (90, 184, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (91, 114, 805, 'périmétrique en alu', 14, 1955, 1345, 720, 1100, 137);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (92, 114, 805, 'périmétrique en alu', 14, 1955, 1345, 720, 1100, 137);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (93, 162, NULL, 'Double poutre périmétrique en aluminium', 23, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (94, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (95, 185, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, 211);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (96, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (97, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (98, 192, 810, 'Treillis tubulaire en acier relié à deux platines en alu', 16, 2265, 1440, 800, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (99, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (100, 185, 810, 'Double poutre périmétrique en aluminium', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (101, 181, 810, 'double poutre en alliage alu', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (102, 168, 800, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, 1150, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (103, 168, 780, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (104, 168, 820, 'Monopoutre en acier à berceau ouvert', 16, 2160, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (105, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (106, 114, 805, 'périmétrique en alu', 14, 1955, 1345, 720, 1100, 137);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (107, 162, NULL, 'Double poutre périmétrique en aluminium', 23, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (108, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (109, 185, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, 211);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (110, 160, NULL, 'structure en carbone', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (111, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (112, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (113, 185, 810, 'Double poutre périmétrique en aluminium', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (114, 181, 810, 'double poutre en alliage alu', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (115, 168, 800, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, 1150, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (116, 168, 780, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (117, 168, 820, 'Monopoutre en acier à berceau ouvert', 16, 2160, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (118, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (119, 186, 870, 'Treillis tubulaire en acier relié à 2 platines en alu', 12, 2216, 1505, 905, 1185, 212);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (120, 114, 805, 'périmétrique en alu', 14, 1955, 1345, 720, 1100, 137);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (121, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (122, 182, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 208);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (123, 185, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (124, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (125, 185, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, 211);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (126, 190, 800, 'treillis tubulaire en acier', 15, 2080, 1463, 800, 1130, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (127, 189, 810, 'Treillis tubulaire en acier relié à 2 platines en alu', 15, 2120, 1440, 800, 1135, 210);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (128, 185, 810, 'Double poutre périmétrique en aluminium', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (129, 181, 810, 'double poutre en alliage alu', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (130, 168, 800, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, 1150, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (131, 168, 780, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (132, 168, 820, 'Monopoutre en acier à berceau ouvert', 16, 2160, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (133, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (134, 114, 805, 'périmétrique en alu', 14, 1955, 1345, 720, 1100, 137);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (135, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (136, 185, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, 211);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (137, 185, 810, 'Double poutre périmétrique en aluminium', 18, 2025, 1410, 830, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (138, 168, 780, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (139, 168, 820, 'Monopoutre en acier à berceau ouvert', 16, 2160, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (140, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (141, 114, 805, 'périmétrique en alu', 14, 1955, 1345, 720, 1100, 137);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (142, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (143, 185, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, 211);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (144, 191, 820, 'Double poutre périmétrique en aluminium', 18, 2070, 1415, 800, 1040, 216);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (145, 168, 780, '2 poutres alu sur caisson d''acier et simple berceau', 16, 2173, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (146, 168, 820, 'Monopoutre en acier à berceau ouvert', 16, 2160, 1479, 810, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (147, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (148, 215, 860, 'double poutre alu-magnésium', 25, 2300, 1568, 876, 1460, 258);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (149, 190, 815, 'double poutre en alliage alu-magnésium', 21, 2050, 1415, 736, 1210, 219);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (150, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (151, 114, 805, 'périmétrique en alu', 14, 1950, 1345, 720, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (152, 132, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (153, 189, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (154, 185, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, 211);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (155, 177, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (156, 175, 810, 'double poutre en alliage alu', 18, 2035, 1418, 730, 1145, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (157, 191, 820, 'Double poutre périmétrique en aluminium', 18, 2070, 1415, 800, 1040, 216);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (158, 175, 810, '2 poutres alu sur caisson d''acier et simple berceau', 21, 2180, 1475, 920, 1260, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (159, 175, 835, '2 poutres alu sur caisson d''acier et simple berceau', 21, 2180, 1480, 880, 1320, 200);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (160, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (161, 215, 860, 'double poutre alu-magnésium', 25, 2300, 1568, 876, 1460, 258);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (162, 210, 820, 'double poutre en alliage alu', 21, 2170, 1435, 740, 1240, 247);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (163, 190, 815, 'double poutre en alliage alu-magnésium', 21, 2050, 1415, 736, 1210, 219);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (164, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (165, 114, 805, 'périmétrique en alu', 14, 1950, 1345, 720, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (166, 182, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (167, 182, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 208);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (168, 185, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (169, 187, 820, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 218);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (170, 183, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 209);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (171, 191, 820, 'Double poutre périmétrique en aluminium', 18, 2070, 1415, 800, 1040, 216);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (172, 175, 810, '2 poutres alu sur caisson d''acier et simple berceau', 21, 2180, 1475, 920, 1260, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (173, 175, 835, '2 poutres alu sur caisson d''acier et simple berceau', 21, 2180, 1480, 880, 1320, 200);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (174, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (175, 215, 860, 'double poutre alu-magnésium', 25, 2300, 1568, 876, 1460, 258);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (176, 210, 820, 'double poutre en alliage alu', 21, 2170, 1435, 740, 1240, 247);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (177, 190, 815, 'double poutre en alliage alu-magnésium', 21, 2050, 1415, 736, 1210, 219);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (178, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (179, 114, 805, 'périmétrique en alu', 14, 1950, 1345, 720, 1135, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (180, 182, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 208);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (181, 185, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (182, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (183, 187, 820, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 218);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (184, 187, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (185, 181, 820, 'Double poutre périmétrique en aluminium', 18, 2070, 1415, 800, 1220, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (186, 175, 810, '2 poutres alu sur caisson d''acier et simple berceau', 21, 2180, 1475, 920, 1260, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (187, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (188, 210, 820, 'double poutre en alliage alu', 21, 2170, 1435, 740, 1240, 247);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (189, 190, 815, 'double poutre en alliage alu-magnésium', 21, 2050, 1415, 736, 1210, 219);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (190, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (191, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (192, 187, 820, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 218);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (193, 187, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (194, 175, 810, '2 poutres alu sur caisson d''acier et simple berceau', 21, 2180, 1475, 920, 1260, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (195, 215, 820, 'double poutre alu-magnésium', 25, 2290, 1544, 876, 1436, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (196, 210, 820, 'double poutre en alliage alu', 21, 2170, 1435, 740, 1240, 247);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (197, 190, 815, 'double poutre en alliage alu-magnésium', 21, 2050, 1415, 736, 1210, 219);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (198, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (199, 115, 880, 'simple berceau en acier', 12, 2220, 1465, NULL, NULL, 130);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (200, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (201, 182, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, 208);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (202, 185, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (203, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (204, 189, 825, 'double poutre en alliage alu', 20, 2070, 1415, 725, 1170, 220);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (205, 185, 825, 'double poutre en alliage alu', 18, 2070, 1415, 725, 1170, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (206, 190, 815, 'double poutre en alliage alu-magnésium', 21, 2050, 1415, 736, 1210, 219);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (207, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (208, 115, 880, 'simple berceau en acier', 12, 2220, 1465, NULL, NULL, 130);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (209, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (210, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (211, 189, 825, 'double poutre en alliage alu', 20, 2070, 1415, 725, 1170, 220);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (212, 114, 780, 'périmétrique en aluminium', 14, 1955, 1345, 720, 1100, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (213, 115, 880, 'simple berceau en acier', 12, 2220, 1465, NULL, NULL, 130);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (214, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (215, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (216, 189, 825, 'double poutre en alliage alu', 20, 2070, 1415, 725, 1170, 220);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (217, 115, 880, 'simple berceau en acier', 12, 2220, 1465, NULL, NULL, 130);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (218, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (219, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (220, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (221, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (222, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (223, 141, 810, 'double poutre en alliage alu', 16.5, 1980, 1370, 690, 1090, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (224, 145, 720, 'Double berceau en acier', 10, 2270, 1553, 850, 1058, 160);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (225, 147, NULL, 'monopoutre en acier, simple berceau', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (226, 147, NULL, 'monopoutre en acier, simple berceau', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (227, 113.5, NULL, 'double poutre en aluminium', 14.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (228, 147, NULL, 'monopoutre en acier, simple berceau', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (229, 113.5, NULL, 'double poutre en aluminium', 14.5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (230, 147, NULL, 'monopoutre en acier, simple berceau', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (231, 147, NULL, 'monopoutre en acier, simple berceau', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (232, 135, NULL, 'Simple berceau tubulaire en acier', 13, 2150, 1470, 860, 1230, 162);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (233, 147, NULL, 'monopoutre en acier, simple berceau', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (234, 135, NULL, 'Simple berceau tubulaire en acier', 13, 2150, 1470, 860, 1230, 162);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (235, 135, NULL, 'Simple berceau tubulaire en acier', 13, 2150, 1470, 860, 1230, 162);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (236, 135, NULL, 'Simple berceau tubulaire en acier', 13, 2150, 1470, 860, 1230, 162);
INSERT INTO bike_frame (id, dry_weight, seat_height, type, tank_capacity, lenght, wheel_base, width, height, moving_weight) VALUES (237, 135, NULL, 'Simple berceau tubulaire en acier', 13, 2150, 1470, 860, 1230, 162);


--
-- TOC entry 2173 (class 0 OID 84189)
-- Dependencies: 184
-- Data for Name: bike_front_axle; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (1, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux monobloc Brembo 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (2, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux monobloc Brembo 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (3, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux Brembo monoblocs 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (4, 'Fourche téléhydraulique Sachs Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux Brembo monoblocs 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (5, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (6, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (7, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux monobloc Brembo 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (8, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux monobloc Brembo 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (9, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux monobloc Brembo 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (10, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux Brembo monoblocs 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (11, 'Fourche téléhydraulique Sachs Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 330 mm, étriers radiaux Brembo monoblocs 4 pistons M50');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (12, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (13, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 167 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320mm, étriers radiaux à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (14, 'Fourche téléhydraulique inversée Ø 43 mm + ADD', NULL, '120 / 70 - 19"', '2 disques Ø 320mm, étriers radiaux à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (15, 'Fourche téléhydraulique inversée Ø 43mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (16, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (17, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (18, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '110 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (19, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (20, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux monobloc Brembo 4 pistons M430');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (21, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux monobloc Brembo 4 pistons M430');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (22, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (23, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux monobloc Brembo 4 pistons M4-32');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (24, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux monobloc Brembo 4 pistons M432');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (25, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 167 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320mm, étriers radiaux à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (26, 'Fourche téléhydraulique inversée Ø 43 mm + ADD', NULL, '120 / 70 - 19"', '2 disques Ø 320mm, étriers radiaux à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (27, 'Fourche téléhydraulique inversée Ø 43mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (28, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (29, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '110 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (30, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (31, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (32, 'Fourche téléhydraulique inversée Ø 43mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (33, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (34, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (35, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (36, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 167 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320mm, étriers radiaux à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (37, 'Fourche téléhydraulique inversée Ø 43mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (38, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (39, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '110 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (40, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (41, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (42, 'Fourche téléhydraulique inversée Ø 43mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (43, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (44, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (45, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (46, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 167 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320mm, étriers radiaux à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (47, 'Fourche téléhydraulique inversée Ø 43mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (48, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (49, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '110 / 80 - 17"', '1 disque wave Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (50, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (51, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (52, 'Fourche téléhydraulique inversée Ø 43mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (53, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (54, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (55, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (56, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (57, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (58, 'Fourche téléhydraulique inversée Ø 43mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (59, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (60, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (61, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (62, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (63, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (64, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (65, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (66, 'Fourche téléhydraulique inversée Ø 43mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (67, 'Fourche téléhydraulique inversée Ø 43mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (68, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (69, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (70, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (71, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (72, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (73, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (74, 'Fourche téléhydraulique inversée Ø 43mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (75, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (76, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (77, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 110 mm', NULL, '100 / 80 - 17"', '1 disque Ø 300 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (78, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120 / 76 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (79, 'Fourche téléhydraulique Öhlins inversée 43 mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (80, 'Fourche téléhydraulique inversée Ø 43mm, déb : 120 mm', NULL, '120/70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (81, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (82, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (83, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (84, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (85, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (86, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm , étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (87, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm , étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (88, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (89, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (90, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (91, 'Fourche hydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (92, 'Fourche hydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (93, 'Fourche téléhydraulique inversée Öhlins TTX36 Ø 43 mm', NULL, NULL, '2 disques Ø 320 mm, étriers Brembo radiaux monoblocs 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (94, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (95, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (96, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (97, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (98, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (99, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (100, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (101, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm , étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (102, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (103, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm , étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (104, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (105, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (106, 'Fourche hydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (107, 'Fourche téléhydraulique inversée Öhlins TTX36 Ø 43 mm', NULL, NULL, '2 disques Ø 320 mm, étriers Brembo radiaux monoblocs 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (108, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (109, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (110, 'Fourche double bras en carbone', NULL, '120 / 70 - 17"', '2 disques Ø nc, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (111, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (112, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (113, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (114, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm , étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (115, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (116, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm , étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (117, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (118, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (119, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 160 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (120, 'Fourche hydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (121, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (122, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (123, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (124, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (125, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (126, 'Fourche téléscopique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', 'Double disque flottants Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (127, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 130 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (128, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (129, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm , étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (130, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (131, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm , étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (132, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (133, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (134, 'Fourche hydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (135, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (136, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (137, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers radiaux 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (138, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm , étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (139, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (140, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (141, 'Fourche hydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm, étrier radial 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (142, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (143, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (144, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (145, 'Fourche téléhydraulique Ø 45 mm, déb : 140 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320 mm , étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (146, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (147, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (148, 'Fourche téléhydraulique Ø 50 mm, déb : 200 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (149, 'fourche téléhydraulique inversée , déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (150, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (151, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque 320 mm, étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (152, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '120 / 60 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (153, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (154, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (155, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (156, 'Fourche téléhydraulique inversée öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (157, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (158, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (159, 'Fourche téléhydraulique Ø 45 mm, déb : 175 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm , étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (160, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (161, 'Fourche téléhydraulique Ø 50 mm, déb : 200 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (162, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 298 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (163, 'fourche téléhydraulique inversée , déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (164, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (165, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque 320 mm, étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (166, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (167, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (168, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (169, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (170, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons à fixation radiale');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (171, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (172, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (173, 'Fourche téléhydraulique Ø 45 mm, déb : 175 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm , étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (174, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (175, 'Fourche téléhydraulique Ø 50 mm, déb : 200 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (176, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 298 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (177, 'fourche téléhydraulique inversée , déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (178, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (179, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque 320 mm, étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (180, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (181, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (182, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '120 / 60 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (183, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (184, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (185, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (186, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (187, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (188, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 298 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (189, 'fourche téléhydraulique inversée , déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (190, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (191, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '120 / 60 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (192, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (193, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (194, 'Fourche téléhydraulique Ø 45 mm, déb : 170 mm', NULL, '100 / 90 - 19"', '1 disque Ø 300 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (195, 'Fourche téléhydraulique Ø 50 mm, déb : 175 mm', NULL, '110 / 80 - 19"', '2 disques Ø 300 mm , étriers 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (196, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 298 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (197, 'fourche téléhydraulique inversée , déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (198, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (199, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 230 mm', NULL, '90 / 90 - 21"', '1 disque Ø 250 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (200, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (201, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (202, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (203, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '120 / 60 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (204, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (205, 'Fourche téléhydraulique inversée Öhlins Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (206, 'fourche téléhydraulique inversée , déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (207, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (208, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 230 mm', NULL, '90 / 90 - 21"', '1 disque Ø 250 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (209, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (210, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '120 / 60 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (211, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (212, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '1 disque Ø 320mm, étrier à 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (213, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 230 mm', NULL, '90 / 90 - 21"', '1 disque Ø 250 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (214, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (215, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '120 / 60 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (216, 'Fourche téléhydraulique inversée Ø 43 mm, déb : 120 mm', NULL, '120 / 70 - 17"', '2 disques Ø 320 mm, étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (217, 'Fourche téléhydraulique inversée Ø 40 mm, déb : 230 mm', NULL, '90 / 90 - 21"', '1 disque Ø 250 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (218, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (219, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (220, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (221, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (222, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (223, 'Fourche téléhydraulique inversée Ø 41 mm, déb : 120 mm', NULL, '110 / 70 - 17"', '2 disques Ø 298 mm , étriers 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (224, 'Fourche téléhydraulique Ø 40 mm, déb : 120 mm', NULL, '90 / 90 - 19"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (225, 'Fourche inversée Ø 38mm, déb : 101 mm', NULL, '100/90 - 19"', 'Un disque Ø 300mm, étrier à 2 pistons opposés');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (226, 'Fourche inversée Ø 38mm, déb : 101 mm', NULL, '100/90 - 19"', 'Un disque Ø 300mm, étrier à 2 pistons opposés');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (227, 'fourche téléscopique inversée, déb : 120 mm', NULL, '100/80 - 17"', '1 disque Ø 320mm, étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (228, 'Fourche inversée Ø 38mm, déb : 101 mm', NULL, '100/90 - 19"', 'Un disque Ø 300mm, étrier à 2 pistons opposés');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (229, 'fourche téléscopique inversée, déb : 120 mm', NULL, '100/80 - 17"', '1 disque Ø 320mm, étrier 4 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (230, 'Fourche inversée Ø 38mm, déb : 101 mm', NULL, '100/90 - 19"', 'Un disque Ø 300mm, étrier à 2 pistons opposés');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (231, 'Fourche inversée Ø 38mm, déb : 101 mm', NULL, '100/90 - 19"', 'Un disque Ø 300mm, étrier à 2 pistons opposés');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (232, 'Fourche téléscopique Ø nc', NULL, '90 / 90 - 21"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (233, 'Fourche inversée Ø 38mm, déb : 101 mm', NULL, '100/90 - 19"', 'Un disque Ø 300mm, étrier à 2 pistons opposés');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (234, 'Fourche téléscopique Ø nc', NULL, '90 / 90 - 21"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (235, 'Fourche téléscopique Ø nc', NULL, '90 / 90 - 21"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (236, 'Fourche téléscopique Ø nc', NULL, '90 / 90 - 21"', '1 disque Ø 260 mm, étrier 2 pistons');
INSERT INTO bike_front_axle (id, fork, front_shock, front_wheel, front_brake) VALUES (237, 'Fourche téléscopique Ø nc', NULL, '90 / 90 - 21"', '1 disque Ø 260 mm, étrier 2 pistons');


--
-- TOC entry 2171 (class 0 OID 84162)
-- Dependencies: 182
-- Data for Name: bike_general_information; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (1, '1000 RSV4 RF ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-RF-2017.jpg}', '2017', 300, NULL, 21500, NULL, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (2, '1000 RSV4 RR ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-RR-2017.jpg}', '2017', 300, NULL, 17500, NULL, 1, 2, 2, 2, 2, 2, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (3, 'TUONO V4 1100 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-Tuono-V4-1100-factory-2017.jpg}', '2017', 250, NULL, 17200, NULL, 2, 3, 3, 3, 3, 3, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (4, 'TUONO V4 1100 RR ', '{http://www.motoplanete.com/aprilia/aprilia-Tuono-V4-1100-RR-2017.jpg}', '2017', 250, NULL, 14800, NULL, 2, 4, 4, 4, 4, 4, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (5, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2017.jpg}', '2017', 130, NULL, 4600, NULL, 3, 5, 5, 5, 5, 5, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (6, 'Tuono 125 ', '{http://www.motoplanete.com/aprilia/aprilia-125-tuono-2017.jpg}', '2017', 120, NULL, 4000, NULL, 4, 6, 6, 6, 6, 6, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (7, '1000 RSV4 RF ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-RF-2017.jpg}', '2016', 300, NULL, 21500, NULL, 1, 7, 7, 7, 7, 7, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (8, '1000 RSV4 RR ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-RR-2017.jpg}', '2016', 300, NULL, 17500, NULL, 1, 8, 8, 8, 8, 8, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (9, '1000 RSV4 R-FW ', '{http://www.motoplanete.com/aprilia/Aprilia-1000-RSV4-R-FW.jpg}', '2016', 300, NULL, 17200, NULL, 1, 9, 9, 9, 9, 9, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (10, 'TUONO V4 1100 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-Tuono-V4-1100-factory-2017.jpg}', '2016', 250, NULL, 17200, NULL, 2, 10, 10, 10, 10, 10, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (11, 'TUONO V4 1100 RR ', '{http://www.motoplanete.com/aprilia/aprilia-Tuono-V4-1100-RR-2017.jpg}', '2016', 250, NULL, 14800, NULL, 2, 11, 11, 11, 11, 11, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (12, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/Aprilia-SL-750-Shiver-2016.jpg}', '2016', 220, NULL, 6499, 6999, 2, 12, 12, 12, 12, 12, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (13, '1200 CAPONORD ', '{http://www.motoplanete.com/aprilia/aprilia-1200-caponord-2016.jpg}', '2016', 200, NULL, 13599, NULL, 5, 13, 13, 13, 13, 13, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (14, '1200 CAPONORD RALLY ', '{http://www.motoplanete.com/aprilia/aprilia-1200-caponord-rally-2016.jpg}', '2016', 200, NULL, 16499, NULL, 5, 14, 14, 14, 14, 14, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (15, 'DORSODURO 1200 1.2 ', '{http://www.motoplanete.com/aprilia/aprilia-1200-dorsoduro-2016.jpg}', '2016', 200, NULL, 11599, NULL, 6, 15, 15, 15, 15, 15, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (16, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/Aprilia-SMV-750-Dorsoduro-2016.jpg}', '2016', 200, 3.8999999999999999, 8999, NULL, 6, 16, 16, 16, 16, 16, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (17, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2017.jpg}', '2016', 130, NULL, 4600, NULL, 3, 17, 17, 17, 17, 17, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (18, 'RS4 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS4-125-2016.jpg}', '2016', 130, NULL, 4199, NULL, 3, 18, 18, 18, 18, 18, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (19, 'RS4 125 Replica ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-replica-2016.jpg}', '2016', 130, NULL, 4199, NULL, 3, 19, 19, 19, 19, 19, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (20, '1000 RSV4 RF ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-RF-2015-2.jpg}', '2015', 300, NULL, 20999, NULL, 1, 20, 20, 20, 20, 20, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (21, '1000 RSV4 RR ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-RR-2015-2.jpg}', '2015', 300, NULL, 17200, NULL, 1, 21, 21, 21, 21, 21, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (22, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/Aprilia-SL-750-Shiver-2015.jpg}', '2015', 220, NULL, 6999, 7499, 2, 22, 22, 22, 22, 22, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (23, 'TUONO V4 1100 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-tuono-V4-1100-factory-2015.jpg}', '2015', 250, NULL, 16949, NULL, 2, 23, 23, 23, 23, 23, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (24, 'TUONO V4 1100 RR ', '{http://www.motoplanete.com/aprilia/Aprilia-1100-tuono-V4-2015.jpg}', '2015', 250, NULL, 14650, NULL, 2, 24, 24, 24, 24, 24, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (25, '1200 CAPONORD ', '{http://www.motoplanete.com/aprilia/aprilia-1200-caponord-2015.jpg}', '2015', 200, NULL, 13599, NULL, 5, 25, 25, 25, 25, 25, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (26, '1200 CAPONORD RALLY ', '{http://www.motoplanete.com/aprilia/aprilia-1200-caponord-rally-2015-2.jpg}', '2015', 200, NULL, 16149, NULL, 5, 26, 26, 26, 26, 26, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (27, 'DORSODURO 1200 1.2 ', '{http://www.motoplanete.com/aprilia/aprilia-1200-dorsoduro-2015.jpg}', '2015', 200, NULL, 11499, NULL, 6, 27, 27, 27, 27, 27, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (28, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/Aprilia-SMV-750-Dorsoduro-2015.jpg}', '2015', 200, 3.8999999999999999, 7999, 8999, 6, 28, 28, 28, 28, 28, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (29, 'RS4 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS4-125-2015.jpg}', '2015', 130, NULL, 4199, NULL, 3, 29, 29, 29, 29, 29, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (30, 'RS4 125 Replica ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-replica-2015.jpg}', '2015', 130, NULL, 4199, NULL, 3, 30, 30, 30, 30, 30, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (31, 'RSV4 1000 FACTORY APRC ABS ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-factory-2014.jpg}', '2014', 305, NULL, 19999, NULL, 1, 31, 31, 31, 31, 31, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (32, 'RSV4-R 1000 APRC ABS ', '{http://www.motoplanete.com/aprilia/Aprilia-1000-RSV4-R-2014.jpg}', '2014', 300, NULL, 15699, NULL, 1, 32, 32, 32, 32, 32, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (33, 'Mana 850 GT ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-GT-2014.jpg}', '2014', 200, NULL, 10599, NULL, 2, 33, 33, 33, 33, 33, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (34, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/Aprilia-SL-750-Shiver-2014.jpg}', '2014', 220, NULL, 6999, 7499, 2, 34, 34, 34, 34, 34, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (35, 'TUONO 1000 V4 R ', '{http://www.motoplanete.com/aprilia/Aprilia-1000-Tuono-V4R-2014.jpg}', '2014', 260, NULL, 13999, NULL, 2, 35, 35, 35, 35, 35, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (36, '1200 CAPONORD ', '{http://www.motoplanete.com/aprilia/aprilia-1200-caponord-2014.jpg}', '2014', 200, NULL, 13499, NULL, 5, 36, 36, 36, 36, 36, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (37, 'DORSODURO 1200 1.2 ', '{http://www.motoplanete.com/aprilia/aprilia-1200-dorsoduro-2014.jpg}', '2014', 200, NULL, 11499, NULL, 6, 37, 37, 37, 37, 37, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (38, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/Aprilia-SMV-750-Dorsoduro-2014.jpg}', '2014', 200, 3.8999999999999999, 7999, 8999, 6, 38, 38, 38, 38, 38, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (39, 'RS4 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS4-125-2014.jpg}', '2014', 130, NULL, 4199, NULL, 3, 39, 39, 39, 39, 39, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (40, 'RS4 125 Replica ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-replica-2014.jpg}', '2014', 130, NULL, 4199, NULL, 3, 40, 40, 40, 40, 40, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (41, 'RSV4 1000 FACTORY APRC ABS ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-factory-ABS-2013.jpg}', '2013', 305, NULL, 19499, NULL, 1, 41, 41, 41, 41, 41, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (42, 'RSV4-R 1000 APRC ABS ', '{http://www.motoplanete.com/aprilia/Aprilia-1000-RSV4-R-ABS-2013.jpg}', '2013', 300, NULL, 15499, NULL, 1, 42, 42, 42, 42, 42, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (43, 'Mana 850 GT ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-GT-2013.jpg}', '2013', 200, NULL, 10599, NULL, 2, 43, 43, 43, 43, 43, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (44, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/Aprilia-SL-750-Shiver-2013.jpg}', '2013', 220, NULL, 6799, 7299, 2, 44, 44, 44, 44, 44, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (45, 'TUONO 1000 V4 R APRC ', '{http://www.motoplanete.com/aprilia/aprilia-1000-tuono-V4R-APRC-2013.jpg}', '2013', 260, NULL, 13499, NULL, 2, 45, 45, 45, 45, 45, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (46, '1200 CAPONORD ', '{http://www.motoplanete.com/aprilia/aprilia-1200-caponord-2013-2.jpg}', '2013', 200, NULL, 12999, NULL, 5, 46, 46, 46, 46, 46, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (47, 'DORSODURO 1200 1.2 ', '{http://www.motoplanete.com/aprilia/aprilia-1200-dorsoduro-2013.jpg}', '2013', 200, NULL, 9999, 10999, 6, 47, 47, 47, 47, 47, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (48, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/Aprilia-SMV-750-Dorsoduro-2013.jpg}', '2013', 200, 3.8999999999999999, 8499, NULL, 6, 48, 48, 48, 48, 48, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (49, 'RS4 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS4-125-2013.jpg}', '2013', 130, NULL, 4199, NULL, 3, 49, 49, 49, 49, 49, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (50, 'RS4 125 Replica ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-replica-2013.jpg}', '2013', 130, NULL, 4199, NULL, 3, 50, 50, 50, 50, 50, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (51, 'RSV4 1000 FACTORY APRC ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-factory-APRC-2012.jpg}', '2012', 304, NULL, 18999, NULL, 1, 51, 51, 51, 51, 51, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (52, 'RSV4-R 1000 APRC ', '{http://www.motoplanete.com/aprilia/RSV4-R-1000-APRC-2012.jpg}', '2012', 300, NULL, 14999, NULL, 1, 52, 52, 52, 52, 52, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (53, 'Mana 850 GT ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-GT-2012.jpg}', '2012', 200, NULL, 10599, NULL, 2, 53, 53, 53, 53, 53, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (54, 'Shiver 750 GT ', '{http://www.motoplanete.com/aprilia/Shiver-750-GT-2012.jpg}', '2012', 220, NULL, 8199, 8799, 2, 54, 54, 54, 54, 54, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (55, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/SL-750-Shiver-2012.jpg}', '2012', 220, NULL, 6799, 7299, 2, 55, 55, 55, 55, 55, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (56, 'TUONO 1000 V4 R ', '{http://www.motoplanete.com/aprilia/aprilia-tuono-1000-V4R-2012.jpg}', '2012', 260, NULL, 12999, NULL, 2, 56, 56, 56, 56, 56, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (57, 'TUONO 1000 V4 R APRC ', '{http://www.motoplanete.com/aprilia/aprilia-tuono-1000-V4R-APRC-2012.jpg}', '2012', 260, NULL, 13499, NULL, 2, 57, 57, 57, 57, 57, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (58, 'DORSODURO 1200 1.2 ', '{http://www.motoplanete.com/aprilia/aprilia-1200-dorsoduro-1-2-2012.jpg}', '2012', 200, NULL, 9999, 10999, 6, 58, 58, 58, 58, 58, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (59, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-2012.jpg}', '2012', 200, 3.8999999999999999, 7999, 8499, 6, 59, 59, 59, 59, 59, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (60, 'SMV 750 DORSODURO Factory ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-factory-2012.jpg}', '2012', 200, 3.8999999999999999, 8999, 9499, 6, 60, 60, 60, 60, 60, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (61, 'RS4 125 ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-2012.jpg}', '2012', 130, NULL, 3999, NULL, 3, 61, 61, 61, 61, 61, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (62, 'RS4 125 Replica ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-replica-2012.jpg}', '2012', 130, NULL, 4199, NULL, 3, 62, 62, 62, 62, 62, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (63, 'RSV4 1000 FACTORY ', '{http://www.motoplanete.com/aprilia/RSV4-1000-factory-2011.jpg}', '2011', 304, NULL, 19990, NULL, 1, 63, 63, 63, 63, 63, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (64, 'RSV4 1000 FACTORY APRC ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-factory-APRC-2011.jpg}', '2011', 304, NULL, 21599, NULL, 1, 64, 64, 64, 64, 64, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (65, 'RSV4 1000 FACTORY APRC SE ', '{http://www.motoplanete.com/aprilia/aprilia-1000-RSV4-factory-APRC-SE-2011.jpg}', '2011', 304, NULL, 21999, NULL, 1, 65, 65, 65, 65, 65, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (66, 'RSV4-R 1000 ', '{http://www.motoplanete.com/aprilia/RSV4-R-1000-2011.jpg}', '2011', 300, NULL, 14999, NULL, 1, 66, 66, 66, 66, 66, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (67, 'RSV4-R 1000 APRC ', '{http://www.motoplanete.com/aprilia/RSV4-R-1000-APRC-2011.jpg}', '2011', 300, NULL, 16490, NULL, 1, 67, 67, 67, 67, 67, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (68, 'Mana 850 GT ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-GT-2011.jpg}', '2011', 200, NULL, 10599, NULL, 2, 68, 68, 68, 68, 68, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (69, 'Mana 850 NA ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-2011.jpg}', '2011', 200, NULL, 9599, 10199, 2, 69, 69, 69, 69, 69, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (70, 'Shiver 750 GT ', '{http://www.motoplanete.com/aprilia/Shiver-750-GT-2011.jpg}', '2011', 220, NULL, 8199, NULL, 2, 70, 70, 70, 70, 70, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (71, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/SL-750-Shiver-2011.jpg}', '2011', 220, NULL, 6499, 7699, 2, 71, 71, 71, 71, 71, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (72, 'TUONO 1000 V4 R ', '{http://www.motoplanete.com/aprilia/aprilia-tuono-1000-V4R-2011.jpg}', '2011', 260, NULL, 12999, NULL, 2, 72, 72, 72, 72, 72, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (73, 'TUONO 1000 V4 R APRC ', '{http://www.motoplanete.com/aprilia/aprilia-tuono-1000-V4R-APRC-2011.jpg}', '2011', 260, NULL, 14999, NULL, 2, 73, 73, 73, 73, 73, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (74, '1200 DORSODURO ', '{http://www.motoplanete.com/aprilia/aprilia-1200-dorsoduro-2011.jpg}', '2011', 200, NULL, 11690, 12890, 6, 74, 74, 74, 74, 74, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (75, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-2011.jpg}', '2011', 200, 3.8999999999999999, 8999, 9599, 6, 75, 75, 75, 75, 75, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (76, 'SMV 750 DORSODURO Factory ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-factory-2011.jpg}', '2011', 200, 3.8999999999999999, 9849, 10449, 6, 76, 76, 76, 76, 76, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (77, 'RS4 125 ', '{http://www.motoplanete.com/aprilia/aprilia-125-RS4-2011.jpg}', '2011', 130, NULL, 4199, NULL, 3, 77, 77, 77, 77, 77, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (78, 'RSV4 1000 Biaggi Superbike Replica ', '{http://www.motoplanete.com/aprilia/Aprilia-RSV4-Biaggi-Replica-2010.jpg}', '2010', 310, NULL, 50000, NULL, 1, 78, 78, 78, 78, 78, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (79, 'RSV4 1000 FACTORY ', '{http://www.motoplanete.com/aprilia/RSV4-1000-factory-2010.jpg}', '2010', 304, NULL, 19990, NULL, 1, 79, 79, 79, 79, 79, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (80, 'RSV4R 1000 ', '{http://www.motoplanete.com/aprilia/RSV4-R-1000-2010.jpg}', '2010', 300, NULL, 14999, NULL, 1, 80, 80, 80, 80, 80, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (81, 'Mana 850 GT ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-GT-2010.jpg}', '2010', 200, NULL, 10599, NULL, 2, 81, 81, 81, 81, 81, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (82, 'Mana 850 NA ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-2010.jpg}', '2010', 200, NULL, 9599, 10199, 2, 82, 82, 82, 82, 82, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (83, 'Shiver 750 GT ', '{http://www.motoplanete.com/aprilia/Shiver-750-GT-2010.jpg}', '2010', 220, NULL, 8199, 8799, 2, 83, 83, 83, 83, 83, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (84, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/SL-750-Shiver-2010.jpg}', '2010', 220, NULL, 7799, 8399, 2, 84, 84, 84, 84, 84, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (85, 'TUONO 1000 R ', '{http://www.motoplanete.com/aprilia/tuono-1000-R-2010.jpg}', '2010', 240, NULL, 10499, NULL, 2, 85, 85, 85, 85, 85, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (86, 'TUONO 1000 R FACTORY ', '{http://www.motoplanete.com/aprilia/1000-tuono-R-factory-2010.jpg}', '2010', 250, 3.5, 12899, NULL, 2, 86, 86, 86, 86, 86, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (87, '650 PEGASO STRADA ', '{http://www.motoplanete.com/aprilia/650-pegaso-strada-2010.jpg}', '2010', 170, NULL, 6600, NULL, 5, 87, 87, 87, 87, 87, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (88, '650 PEGASO TRAIL ', '{http://www.motoplanete.com/aprilia/650-pegaso-trail-2010.jpg}', '2010', 160, NULL, 6215, NULL, 5, 88, 88, 88, 88, 88, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (89, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-2010.jpg}', '2010', 200, 3.8999999999999999, 8999, 9599, 6, 89, 89, 89, 89, 89, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (90, 'SMV 750 DORSODURO Factory ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-factory-2010.jpg}', '2010', 200, 3.8999999999999999, 9849, 10449, 6, 90, 90, 90, 90, 90, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (91, 'RS 125 ', '{http://www.motoplanete.com/aprilia/RS-125_2010.jpg}', '2010', 170, NULL, 5799, NULL, 3, 91, 91, 91, 91, 91, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (92, 'RS 125 Biaggi Replica ', '{http://www.motoplanete.com/aprilia/Aprilia-RS-125-2010-Biaggi-replica.jpg}', '2010', 170, NULL, 5999, NULL, 3, 92, 92, 92, 92, 92, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (93, 'RSV4 1000 Factory SUPERBIKE ', '{http://www.motoplanete.com/aprilia/RSV4-1000-SUPERBIKE-2010.jpg}', '2010', 330, NULL, 130000, NULL, 7, 93, 93, 93, 93, 93, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (94, 'RSV-R 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2009.jpg}', '2009', 280, 3.3999999999999999, 14499, NULL, 1, 94, 94, 94, 94, 94, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (95, 'RSV-R 1000 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-factory-2009.jpg}', '2009', 280, 3.3999999999999999, 16849, NULL, 1, 95, 95, 95, 95, 95, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (96, 'Mana 850 GT ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-GT-2009.jpg}', '2009', 200, NULL, 10590, NULL, 2, 96, 96, 96, 96, 96, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (97, 'Mana 850 NA ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-2009.jpg}', '2009', 200, NULL, 9399, NULL, 2, 97, 97, 97, 97, 97, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (98, 'Shiver 750 GT ', '{http://www.motoplanete.com/aprilia/Shiver-750-GT-2009.jpg}', '2009', 220, NULL, 8799, 9399, 2, 98, 98, 98, 98, 98, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (99, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/SL-750-Shiver-2009.jpg}', '2009', 220, NULL, 7799, 8399, 2, 99, 99, 99, 99, 99, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (100, 'TUONO 1000 R ', '{http://www.motoplanete.com/aprilia/tuono-1000-R-2009.jpg}', '2009', 240, NULL, 12099, NULL, 2, 100, 100, 100, 100, 100, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (101, 'TUONO 1000 R FACTORY ', '{http://www.motoplanete.com/aprilia/1000-tuono-R-factory-2009.jpg}', '2009', 250, 3.5, 14589, NULL, 2, 101, 101, 101, 101, 101, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (102, '650 PEGASO FACTORY ', '{http://www.motoplanete.com/aprilia/650-pegaso-factory-2009.jpg}', '2009', 160, NULL, 7549, NULL, 5, 102, 102, 102, 102, 102, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (103, '650 PEGASO STRADA ', '{http://www.motoplanete.com/aprilia/650-pegaso-strada-2009.jpg}', '2009', 170, NULL, 6600, NULL, 5, 103, 103, 103, 103, 103, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (104, '650 PEGASO TRAIL ', '{http://www.motoplanete.com/aprilia/650-pegaso-trail-2009.jpg}', '2009', 160, NULL, 6215, NULL, 5, 104, 104, 104, 104, 104, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (105, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-2009.jpg}', '2009', 200, 3.8999999999999999, 8849, 9499, 6, 105, 105, 105, 105, 105, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (106, 'RS 125 ', '{http://www.motoplanete.com/aprilia/RS-125_2009.jpg}', '2009', 170, NULL, 5699, NULL, 3, 106, 106, 106, 106, 106, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (107, 'RSV4 1000 Factory SUPERBIKE ', '{http://www.motoplanete.com/aprilia/RSV4-1000-SUPERBIKE-2009.jpg}', '2009', 310, NULL, 130000, NULL, 7, 107, 107, 107, 107, 107, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (108, 'RSV-R 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2008.jpg}', '2008', 280, 3.3999999999999999, 14499, NULL, 1, 108, 108, 108, 108, 108, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (109, 'RSV-R 1000 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-factory-2008.jpg}', '2008', 280, 3.3999999999999999, 16849, NULL, 1, 109, 109, 109, 109, 109, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (110, 'FV2 1200 ', '{http://www.motoplanete.com/aprilia/aprilia-FV2-1200-2008.jpg}', '2008', 250, NULL, 50000, NULL, 2, 110, 110, 110, 110, 110, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (111, 'Mana 850 NA ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-2008.jpg}', '2008', 200, NULL, 9399, NULL, 2, 111, 111, 111, 111, 111, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (112, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/SL-750-Shiver-2008.jpg}', '2008', 220, NULL, 8399, 8999, 2, 112, 112, 112, 112, 112, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (113, 'TUONO 1000 R ', '{http://www.motoplanete.com/aprilia/tuono-1000-R-2008.jpg}', '2008', 240, NULL, 11491, NULL, 2, 113, 113, 113, 113, 113, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (114, 'TUONO 1000 R FACTORY ', '{http://www.motoplanete.com/aprilia/1000-tuono-R-factory-2008.jpg}', '2008', 250, 3.5, 14589, NULL, 2, 114, 114, 114, 114, 114, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (115, '650 PEGASO FACTORY ', '{http://www.motoplanete.com/aprilia/650-pegaso-factory-2008.jpg}', '2008', 160, NULL, 7549, NULL, 5, 115, 115, 115, 115, 115, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (116, '650 PEGASO STRADA ', '{http://www.motoplanete.com/aprilia/650-pegaso-strada-2008.jpg}', '2008', 170, NULL, 6800, NULL, 5, 116, 116, 116, 116, 116, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (117, '650 PEGASO TRAIL ', '{http://www.motoplanete.com/aprilia/650-pegaso-trail-2008.jpg}', '2008', 160, NULL, 6499, NULL, 5, 117, 117, 117, 117, 117, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (118, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2008.jpg}', '2008', 220, NULL, 11499, NULL, 5, 118, 118, 118, 118, 118, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (119, 'SMV 750 DORSODURO ', '{http://www.motoplanete.com/aprilia/SVM-750-dorsoduro-2008.jpg}', '2008', 200, 3.8999999999999999, 8849, 9499, 6, 119, 119, 119, 119, 119, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (120, 'RS 125 ', '{http://www.motoplanete.com/aprilia/RS-125_2008.jpg}', '2008', 170, NULL, 5399, NULL, 3, 120, 120, 120, 120, 120, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (121, 'RSV-R 1000 BOL D OR Replica ', '{http://www.motoplanete.com/aprilia/RSV-R-1000-2007-bol-d-or.jpg}', '2007', 280, 3.3999999999999999, 15000, NULL, 8, 121, 121, 121, 121, 121, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (122, 'RSV 1000 R HAGA REPLICA ', '{http://www.motoplanete.com/aprilia/rsvr-haga.jpg}', '2007', 280, NULL, 16990, NULL, 8, 122, 122, 122, 122, 122, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (123, 'RSV 1000 SP ', '{http://www.motoplanete.com/aprilia/RSV-00-SP.jpg}', '2007', 280, 3.2000000000000002, 30490, NULL, 8, 123, 123, 123, 123, 123, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (124, 'RSV-R 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2007.jpg}', '2007', 280, 3.3999999999999999, 13999, NULL, 1, 124, 124, 124, 124, 124, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (125, 'RSV-R 1000 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-factory-2007.jpg}', '2007', 280, 3.3999999999999999, 15900, NULL, 1, 125, 125, 125, 125, 125, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (126, 'Mana 850 NA ', '{http://www.motoplanete.com/aprilia/Aprilia-Mana-850-2007.jpg}', '2007', 200, NULL, 9399, NULL, 2, 126, 126, 126, 126, 126, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (127, 'SHIVER 750 SL ', '{http://www.motoplanete.com/aprilia/SL-750-Shiver-2007.jpg}', '2007', 220, NULL, 8399, 8999, 2, 127, 127, 127, 127, 127, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (128, 'TUONO 1000 R ', '{http://www.motoplanete.com/aprilia/tuono-1000-R-2007.jpg}', '2007', 240, NULL, 11491, NULL, 2, 128, 128, 128, 128, 128, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (129, 'TUONO 1000 R FACTORY ', '{http://www.motoplanete.com/aprilia/1000-tuono-R-factory-2007.jpg}', '2007', 250, 3.5, 14589, NULL, 2, 129, 129, 129, 129, 129, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (130, '650 PEGASO FACTORY ', '{http://www.motoplanete.com/aprilia/650-pegaso-factory-2007.jpg}', '2007', 160, NULL, 7549, NULL, 5, 130, 130, 130, 130, 130, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (131, '650 PEGASO STRADA ', '{http://www.motoplanete.com/aprilia/650-pegaso-strada-2007.jpg}', '2007', 170, NULL, 7000, NULL, 5, 131, 131, 131, 131, 131, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (132, '650 PEGASO TRAIL ', '{http://www.motoplanete.com/aprilia/650-pegaso-trail-2007.jpg}', '2007', 160, NULL, 6499, NULL, 5, 132, 132, 132, 132, 132, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (133, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2007.jpg}', '2007', 220, NULL, 11499, NULL, 5, 133, 133, 133, 133, 133, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (134, 'RS 125 ', '{http://www.motoplanete.com/aprilia/RS-125_2007.jpg}', '2007', 170, NULL, 5399, NULL, 3, 134, 134, 134, 134, 134, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (135, 'RSV-R 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2006.jpg}', '2006', 280, 3.3999999999999999, 13999, NULL, 1, 135, 135, 135, 135, 135, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (136, 'RSV-R 1000 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-factory-2006.jpg}', '2006', 280, 3.3999999999999999, 15900, NULL, 1, 136, 136, 136, 136, 136, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (137, 'TUONO 1000 R ', '{http://www.motoplanete.com/aprilia/tuono-1000-R-2006.jpg}', '2006', 240, NULL, 11491, NULL, 2, 137, 137, 137, 137, 137, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (138, '650 PEGASO STRADA ', '{http://www.motoplanete.com/aprilia/650-pegaso-strada-2006.jpg}', '2006', 170, NULL, 7160, NULL, 5, 138, 138, 138, 138, 138, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (139, '650 PEGASO TRAIL ', '{http://www.motoplanete.com/aprilia/650-pegaso-trail-2006.jpg}', '2006', 160, NULL, 6499, NULL, 5, 139, 139, 139, 139, 139, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (140, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2006.jpg}', '2006', 220, NULL, 11499, NULL, 5, 140, 140, 140, 140, 140, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (141, 'RS 125 ', '{http://www.motoplanete.com/aprilia/RS-125_2006.jpg}', '2006', 170, NULL, 5399, NULL, 3, 141, 141, 141, 141, 141, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (142, 'RSV-R 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2005.jpg}', '2005', 280, 3.3999999999999999, 13789, NULL, 1, 142, 142, 142, 142, 142, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (143, 'RSV-R 1000 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-factory-2005.jpg}', '2005', 280, 3.3999999999999999, 17878, NULL, 1, 143, 143, 143, 143, 143, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (144, '1000 TUONO FIGHTER ', '{http://www.motoplanete.com/aprilia/1000-tuono-2005.jpg}', '2005', 240, NULL, 10799, NULL, 2, 144, 144, 144, 144, 144, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (145, '650 PEGASO STRADA ', '{http://www.motoplanete.com/aprilia/650-pegaso-strada-2005.jpg}', '2005', 170, NULL, 7160, NULL, 5, 145, 145, 145, 145, 145, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (146, '650 PEGASO TRAIL ', '{http://www.motoplanete.com/aprilia/650-pegaso-trail-2005.jpg}', '2005', 160, NULL, 6499, NULL, 5, 146, 146, 146, 146, 146, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (147, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2005.jpg}', '2005', 220, NULL, 11499, NULL, 5, 147, 147, 147, 147, 147, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (148, 'CAPONORD RALLY RAID 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-rally-raid-2005.jpg}', '2005', 220, NULL, 13492, NULL, 5, 148, 148, 148, 148, 148, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (149, 'SL 1000 FALCO ', '{http://www.motoplanete.com/aprilia/SL-1000-falco-2005.jpg}', '2005', 240, NULL, 9999, NULL, 9, 149, 149, 149, 149, 149, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (150, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2005.jpg}', '2005', 160, NULL, 5189, NULL, 3, 150, 150, 150, 150, 150, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (151, '125 TUONO ', '{http://www.motoplanete.com/aprilia/aprilia-125-tuono-2005.jpg}', '2005', 150, NULL, 4569, NULL, 4, 151, 151, 151, 151, 151, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (152, 'RS 250 PISTA ', '{http://www.motoplanete.com/aprilia/aprilia-RS-250-pista-2004.jpg}', '2004', 210, NULL, 8000, NULL, 1, 152, 152, 152, 152, 152, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (153, 'RSV-R 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2004.jpg}', '2004', 280, 3.3999999999999999, 13789, NULL, 1, 153, 153, 153, 153, 153, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (154, 'RSV-R 1000 Factory ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-factory-2004.jpg}', '2004', 280, 3.3999999999999999, 17878, NULL, 1, 154, 154, 154, 154, 154, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (155, 'RSV-R 1000 Factory Pista ', '{http://www.motoplanete.com/aprilia/rsvr-factory-pista-2004.jpg}', '2004', 280, 3.3999999999999999, 14000, NULL, 1, 155, 155, 155, 155, 155, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (156, 'RSV-R 1000 NERA ', '{http://www.motoplanete.com/aprilia/RSV-R-2004-nera.jpg}', '2004', 280, 3.3999999999999999, 24990, NULL, 1, 156, 156, 156, 156, 156, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (157, '1000 TUONO FIGHTER ', '{http://www.motoplanete.com/aprilia/1000-tuono-2004.jpg}', '2004', 240, NULL, 10799, NULL, 2, 157, 157, 157, 157, 157, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (158, '650 Pegaso ie ', '{http://www.motoplanete.com/aprilia/Aprilia-650-Pegaso-ie-2001.jpg}', '2004', 170, 5.5, 6549, NULL, 5, 158, 158, 158, 158, 158, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (159, '650 PEGASO TUSCANY TIBET ', '{http://www.motoplanete.com/aprilia/aprilia-650-pegaso-tuscany-tibet-2004.jpg}', '2004', 160, NULL, 7090, NULL, 5, 159, 159, 159, 159, 159, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (160, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2004.jpg}', '2004', 220, NULL, 11499, NULL, 5, 160, 160, 160, 160, 160, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (161, 'CAPONORD RALLY RAID 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-rally-raid-2004.jpg}', '2004', 220, NULL, 13492, NULL, 5, 161, 161, 161, 161, 161, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (162, 'RST 1000 FUTURA ', '{http://www.motoplanete.com/aprilia/RST-1000-FUTURA-2004.jpg}', '2004', 235, NULL, 10229, NULL, 9, 162, 162, 162, 162, 162, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (163, 'SL 1000 FALCO ', '{http://www.motoplanete.com/aprilia/SL-1000-falco-2004.jpg}', '2004', 240, NULL, 9999, NULL, 9, 163, 163, 163, 163, 163, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (164, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2004.jpg}', '2004', 160, NULL, 5189, NULL, 3, 164, 164, 164, 164, 164, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (165, '125 TUONO ', '{http://www.motoplanete.com/aprilia/aprilia-125-tuono-2004.jpg}', '2004', 150, NULL, 4569, NULL, 4, 165, 165, 165, 165, 165, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (166, 'RSV 1000 R EDWARDS REPLICA ', '{http://www.motoplanete.com/aprilia/rsvr-edwards.jpg}', '2003', 270, NULL, 17999, NULL, 8, 166, 166, 166, 166, 166, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (167, 'RSV 1000 R HAGA REPLICA ', '{http://www.motoplanete.com/aprilia/rsvr-haga.jpg}', '2003', 280, NULL, 16990, NULL, 8, 167, 167, 167, 167, 167, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (168, 'RSV 1000 SP ', '{http://www.motoplanete.com/aprilia/RSV-00-SP.jpg}', '2003', 280, 3.2000000000000002, 30490, NULL, 8, 168, 168, 168, 168, 168, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (169, 'RSV 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-1000-2003.jpg}', '2003', 270, NULL, 12649, NULL, 1, 169, 169, 169, 169, 169, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (170, 'RSV 1000 R ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2003.jpg}', '2003', 270, NULL, 15999, NULL, 1, 170, 170, 170, 170, 170, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (171, '1000 TUONO FIGHTER ', '{http://www.motoplanete.com/aprilia/1000-tuono-2003.jpg}', '2003', 240, NULL, 10799, NULL, 2, 171, 171, 171, 171, 171, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (172, '650 Pegaso ie ', '{http://www.motoplanete.com/aprilia/Aprilia-650-Pegaso-ie-2003.jpg}', '2003', 170, 5.5, 6549, NULL, 5, 172, 172, 172, 172, 172, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (173, '650 PEGASO TUSCANY TIBET ', '{http://www.motoplanete.com/aprilia/aprilia-650-pegaso-tuscany-tibet-2003.jpg}', '2003', 160, NULL, 7090, NULL, 5, 173, 173, 173, 173, 173, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (174, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2003.jpg}', '2003', 220, NULL, 11499, NULL, 5, 174, 174, 174, 174, 174, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (175, 'CAPONORD RALLY RAID 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-rally-raid-2003.jpg}', '2003', 220, NULL, 13492, NULL, 5, 175, 175, 175, 175, 175, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (176, 'RST 1000 FUTURA ', '{http://www.motoplanete.com/aprilia/RST-1000-FUTURA-2003.jpg}', '2003', 235, NULL, 10229, NULL, 9, 176, 176, 176, 176, 176, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (177, 'SL 1000 FALCO ', '{http://www.motoplanete.com/aprilia/SL-1000-falco-2003.jpg}', '2003', 240, NULL, 9999, NULL, 9, 177, 177, 177, 177, 177, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (178, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2003.jpg}', '2003', 160, NULL, 5189, NULL, 3, 178, 178, 178, 178, 178, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (179, '125 TUONO ', '{http://www.motoplanete.com/aprilia/aprilia-125-tuono-2003.jpg}', '2003', 150, NULL, 4569, NULL, 4, 179, 179, 179, 179, 179, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (180, 'RSV 1000 R HAGA REPLICA ', '{http://www.motoplanete.com/aprilia/rsvr-haga.jpg}', '2002', 280, NULL, 16990, NULL, 8, 180, 180, 180, 180, 180, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (181, 'RSV 1000 SP ', '{http://www.motoplanete.com/aprilia/RSV-00-SP.jpg}', '2002', 280, 3.2000000000000002, 30490, NULL, 8, 181, 181, 181, 181, 181, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (182, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-2002.jpg}', '2002', 208, 4.2999999999999998, 7164, NULL, 1, 182, 182, 182, 182, 182, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (183, 'RSV 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-1000-2002.jpg}', '2002', 270, NULL, 12855, NULL, 1, 183, 183, 183, 183, 183, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (184, 'RSV 1000 R ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2002.jpg}', '2002', 270, NULL, 15242, NULL, 1, 184, 184, 184, 184, 184, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (185, '1000 TUONO R Limited ', '{http://www.motoplanete.com/aprilia/1000-tuono-R-limited-2002.jpg}', '2002', 250, NULL, 18000, NULL, 2, 185, 185, 185, 185, 185, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (186, '650 Pegaso ie ', '{http://www.motoplanete.com/aprilia/Aprilia-650-Pegaso-ie-2002.jpg}', '2002', 170, 5.5, 6549, NULL, 5, 186, 186, 186, 186, 186, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (187, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2002.jpg}', '2002', 220, NULL, 11499, NULL, 5, 187, 187, 187, 187, 187, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (188, 'RST 1000 FUTURA ', '{http://www.motoplanete.com/aprilia/RST-1000-FUTURA-2002.jpg}', '2002', 235, NULL, 10229, NULL, 9, 188, 188, 188, 188, 188, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (189, 'SL 1000 FALCO ', '{http://www.motoplanete.com/aprilia/SL-1000-falco-2002.jpg}', '2002', 240, NULL, 9999, NULL, 9, 189, 189, 189, 189, 189, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (190, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2002.jpg}', '2002', 160, NULL, 5189, NULL, 3, 190, 190, 190, 190, 190, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (191, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-2001.jpg}', '2001', 208, 4.2999999999999998, 7164, NULL, 1, 191, 191, 191, 191, 191, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (192, 'RSV 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-1000-2001.jpg}', '2001', 270, NULL, 12855, NULL, 1, 192, 192, 192, 192, 192, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (193, 'RSV 1000 R ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2001.jpg}', '2001', 270, NULL, 15242, NULL, 1, 193, 193, 193, 193, 193, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (194, '650 Pegaso ie ', '{http://www.motoplanete.com/aprilia/Aprilia-650-Pegaso-ie-2001.jpg}', '2001', 170, 5.5, 6549, NULL, 5, 194, 194, 194, 194, 194, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (195, 'CAPONORD 1000 ETV ', '{http://www.motoplanete.com/aprilia/ETV-1000-caponord-2001.jpg}', '2001', 220, NULL, 11499, NULL, 5, 195, 195, 195, 195, 195, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (196, 'RST 1000 FUTURA ', '{http://www.motoplanete.com/aprilia/RST-1000-FUTURA-2001.jpg}', '2001', 235, NULL, 10229, NULL, 9, 196, 196, 196, 196, 196, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (197, 'SL 1000 FALCO ', '{http://www.motoplanete.com/aprilia/SL-1000-falco-2001.jpg}', '2001', 240, NULL, 9999, NULL, 9, 197, 197, 197, 197, 197, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (198, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2001.jpg}', '2001', 160, NULL, 5189, NULL, 3, 198, 198, 198, 198, 198, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (199, '125 ETX ', '{http://www.motoplanete.com/aprilia/aprilia-125-ETX.jpg}', '2001', 100, 16.699999999999999, 3400, NULL, 10, 199, 199, 199, 199, 199, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (200, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '2001', 120, 16.699999999999999, 3000, NULL, 11, 200, 200, 200, 200, 200, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (201, 'RSV 1000 R HAGA REPLICA ', '{http://www.motoplanete.com/aprilia/rsvr-haga.jpg}', '2000', 280, NULL, 16990, NULL, 8, 201, 201, 201, 201, 201, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (202, 'RSV 1000 SP ', '{http://www.motoplanete.com/aprilia/RSV-00-SP.jpg}', '2000', 280, 3.2000000000000002, 30490, NULL, 8, 202, 202, 202, 202, 202, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (203, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-2000.jpg}', '2000', 208, 4.2999999999999998, 7164, NULL, 1, 203, 203, 203, 203, 203, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (204, 'RSV 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-1000-2000.jpg}', '2000', 270, NULL, 12855, NULL, 1, 204, 204, 204, 204, 204, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (205, 'RSV 1000 R ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-R-1000-2000.jpg}', '2000', 270, NULL, 15242, NULL, 1, 205, 205, 205, 205, 205, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (206, 'SL 1000 FALCO ', '{http://www.motoplanete.com/aprilia/SL-1000-falco-2000.jpg}', '2000', 240, NULL, 9999, NULL, 9, 206, 206, 206, 206, 206, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (207, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-2000.jpg}', '2000', 160, NULL, 5189, NULL, 3, 207, 207, 207, 207, 207, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (208, '125 ETX ', '{http://www.motoplanete.com/aprilia/aprilia-125-ETX.jpg}', '2000', 100, 16.699999999999999, 3400, NULL, 10, 208, 208, 208, 208, 208, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (209, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '2000', 120, 16.699999999999999, 3000, NULL, 11, 209, 209, 209, 209, 209, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (210, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-1999.jpg}', '1999', 208, 4.2999999999999998, 7164, NULL, 1, 210, 210, 210, 210, 210, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (211, 'RSV 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-1000-1999.jpg}', '1999', 270, NULL, 12855, NULL, 1, 211, 211, 211, 211, 211, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (212, 'RS 125 ', '{http://www.motoplanete.com/aprilia/aprilia-RS-125-1999.jpg}', '1999', 160, NULL, 5189, NULL, 3, 212, 212, 212, 212, 212, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (213, '125 ETX ', '{http://www.motoplanete.com/aprilia/aprilia-125-ETX.jpg}', '1999', 100, 16.699999999999999, 3400, NULL, 10, 213, 213, 213, 213, 213, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (214, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '1999', 120, 16.699999999999999, 3000, NULL, 11, 214, 214, 214, 214, 214, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (215, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-1998.jpg}', '1998', 208, 4.2999999999999998, 7164, NULL, 1, 215, 215, 215, 215, 215, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (216, 'RSV 1000 ', '{http://www.motoplanete.com/aprilia/aprilia-RSV-1000-1998.jpg}', '1998', 270, NULL, 12855, NULL, 1, 216, 216, 216, 216, 216, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (217, '125 ETX ', '{http://www.motoplanete.com/aprilia/aprilia-125-ETX.jpg}', '1998', 100, 16.699999999999999, 3400, NULL, 10, 217, 217, 217, 217, 217, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (218, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '1998', 120, 16.699999999999999, 3000, NULL, 11, 218, 218, 218, 218, 218, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (219, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-1997.jpg}', '1997', 208, 4.2999999999999998, 7164, NULL, 1, 219, 219, 219, 219, 219, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (220, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '1997', 120, 16.699999999999999, 3000, NULL, 11, 220, 220, 220, 220, 220, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (221, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-1996.jpg}', '1996', 208, 4.2999999999999998, 7164, NULL, 1, 221, 221, 221, 221, 221, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (222, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '1996', 120, 16.699999999999999, 3000, NULL, 11, 222, 222, 222, 222, 222, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (223, '250 RS ', '{http://www.motoplanete.com/aprilia/aprilia-250-RS-1995.jpg}', '1995', 208, 4.2999999999999998, 7164, NULL, 1, 223, 223, 223, 223, 223, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (224, '125 Classic ', '{http://www.motoplanete.com/aprilia/aprilia-125-classic.jpg}', '1995', 120, 16.699999999999999, 3000, NULL, 11, 224, 224, 224, 224, 224, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (225, 'Pegaso 600 ', '{http://www.motoplanete.com/aprilia/Aprilia-Pegaso-600-1989-380px.jpg}', '1994', NULL, NULL, NULL, NULL, 5, 225, 225, 225, 225, 225, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (226, 'Pegaso 600 ', '{http://www.motoplanete.com/aprilia/Aprilia-Pegaso-600-1989-380px.jpg}', '1993', NULL, NULL, NULL, NULL, 5, 226, 226, 226, 226, 226, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (227, 'Europa 125 ', '{http://www.motoplanete.com/aprilia/Aprilia-125-europa-1992-380px.jpg}', '1992', 175, NULL, NULL, NULL, 2, 227, 227, 227, 227, 227, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (228, 'Pegaso 600 ', '{http://www.motoplanete.com/aprilia/Aprilia-Pegaso-600-1989-380px.jpg}', '1992', NULL, NULL, NULL, NULL, 5, 228, 228, 228, 228, 228, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (229, 'Europa 125 ', '{http://www.motoplanete.com/aprilia/Aprilia-125-europa-1991-380px.jpg}', '1991', 175, NULL, NULL, NULL, 2, 229, 229, 229, 229, 229, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (230, 'Pegaso 600 ', '{http://www.motoplanete.com/aprilia/Aprilia-Pegaso-600-1989-380px.jpg}', '1991', NULL, NULL, NULL, NULL, 5, 230, 230, 230, 230, 230, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (231, 'Pegaso 600 ', '{http://www.motoplanete.com/aprilia/Aprilia-Pegaso-600-1989-380px.jpg}', '1990', NULL, NULL, NULL, NULL, 5, 231, 231, 231, 231, 231, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (232, 'ETX 350 ', '{http://www.motoplanete.com/aprilia/Aprilia-ETX-350-1987.jpg}', '1989', 145, NULL, NULL, NULL, 5, 232, 232, 232, 232, 232, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (233, 'Pegaso 600 ', '{http://www.motoplanete.com/aprilia/Aprilia-Pegaso-600-1989-380px.jpg}', '1989', NULL, NULL, NULL, NULL, 5, 233, 233, 233, 233, 233, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (234, 'ETX 350 ', '{http://www.motoplanete.com/aprilia/Aprilia-ETX-350-1987.jpg}', '1988', 145, NULL, NULL, NULL, 5, 234, 234, 234, 234, 234, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (235, 'ETX 350 ', '{http://www.motoplanete.com/aprilia/Aprilia-ETX-350-1987.jpg}', '1987', 145, NULL, NULL, NULL, 5, 235, 235, 235, 235, 235, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (236, 'ETX 350 ', '{http://www.motoplanete.com/aprilia/Aprilia-ETX-350-1985.jpg}', '1986', 135, NULL, NULL, NULL, 5, 236, 236, 236, 236, 236, 1);
INSERT INTO bike_general_information (id, name, images_url, year, max_speed, zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame, id_manufacturer) VALUES (237, 'ETX 350 ', '{http://www.motoplanete.com/aprilia/Aprilia-ETX-350-1985.jpg}', '1985', 135, NULL, NULL, NULL, 5, 237, 237, 237, 237, 237, 1);


--
-- TOC entry 2170 (class 0 OID 84152)
-- Dependencies: 181
-- Data for Name: bike_manufacturers; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (1, 'Aprilia', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985}', '', 'http://www.motoplanete.com/aprilia/aprilia.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (2, 'Benelli', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002}', '', 'http://www.motoplanete.com/benelli/benelli_logo.gif', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (3, 'Bmw', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983,1982,1981,1980,1979,1978,1973,1972,1971,1970,1969,1960,1959,1958,1957,1956,1955,1954,1953,1952,1951,1950,1949,1948,1941,1940,1939,1938,1937,1936,1935,1934,1928,1927,1926,1925,1924,1923}', '', 'http://www.motoplanete.com/bmw/bmw.gif', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (4, 'Ducati', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1992,1991,1990,1989,1988}', '', 'http://www.motoplanete.com/ducati/ducati-logo-3.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (5, 'Harley Davidson', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998}', '', 'http://www.motoplanete.com/harley-davidson/harley-logo.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (6, 'Honda', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983,1982}', '', 'http://www.motoplanete.com/honda/honda.gif', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (7, 'Husqvarna', '{2017,2016,2013,2012,2011}', '', 'http://www.motoplanete.com/husqvarna/husqvarna.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (8, 'Indian', '{2017,2016,2015,2014,2013,2012,2011,2010,2009}', '', 'http://www.motoplanete.com/indian/indian-logo.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (9, 'Kawasaki', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1984,1983,1982,1981,1980,1979,1978,1977,1976,1975,1974,1973,1972,1969}', '', 'http://www.motoplanete.com/kawasaki/kawasaki.gif', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (10, 'Ktm', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997}', '', 'http://www.motoplanete.com/ktm/ktm.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (11, 'Moto Guzzi', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1992}', '', 'http://www.motoplanete.com/moto-guzzi/MotoGuzzi_logo.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (12, 'Mv Agusta', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000}', '', 'http://www.motoplanete.com/mv-agusta/mv-agusta.gif', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (13, 'Suzuki', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983}', '', 'http://www.motoplanete.com/suzuki/suzuki.gif', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (14, 'Triumph', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993}', '', 'http://www.motoplanete.com/triumph/triumph-logo-2005.jpg', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (15, 'Victory', '{2017,2016,2015,2014,2013,2012,2011,2010}', '', 'http://www.motoplanete.com/victory/victory-logo-2013.png', '{}');
INSERT INTO bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (16, 'Yamaha', '{2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983,1982,1981}', '', 'http://www.motoplanete.com/yamaha/yamahalogo.jpg', '{}');


--
-- TOC entry 2172 (class 0 OID 84178)
-- Dependencies: 183
-- Data for Name: bike_rear_axle; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (1, 'Mono-amortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (2, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (3, 'Mono-amortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (4, 'Mono-amortisseur Sachs, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (5, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (6, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (7, 'Mono-amortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (8, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (9, 'Mono-amortisseur Öhlins', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (10, 'Mono-amortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (11, 'Mono-amortisseur Sachs, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (12, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (13, 'Mono-amortisseur latéral, déb : 150 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (14, 'Mono-amortisseur latéral', '1 disque Ø 240 mm, étrier 1 piston', '170 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (15, 'Mono-amortisseur, déb : 155 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (16, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (17, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (18, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (19, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (20, 'Mono-amortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (21, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (22, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (23, 'Mono-amortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (24, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (25, 'Mono-amortisseur latéral, déb : 150 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (26, 'Mono-amortisseur latéral', '1 disque Ø 240 mm, étrier 1 piston', '170 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (27, 'Mono-amortisseur, déb : 155 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (28, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (29, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (30, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (31, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (32, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '200/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (33, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (34, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (35, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (36, 'Mono-amortisseur latéral, déb : 150 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (37, 'Mono-amortisseur, déb : 155 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (38, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (39, 'Mono-amortisseur, déb : 130 mm', 'Simple disque Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (40, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (41, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (42, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (43, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (44, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (45, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (46, 'Mono-amortisseur latéral, déb : 150 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (47, 'Mono-amortisseur, déb : 155 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (48, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (49, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (50, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (51, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (52, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (53, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (54, 'Monoamortisseur, déb : 120 mm', 'Simple disque Ø 245mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (55, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (56, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (57, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (58, 'Mono-amortisseur, déb : 155 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (59, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (60, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (61, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (62, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (63, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (64, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (65, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '200 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (66, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (67, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (68, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (69, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (70, 'Monoamortisseur, déb : 120 mm', 'Simple disque Ø 245mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (71, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (72, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (73, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (74, 'Mono-amortisseur, déb : 155 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (75, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (76, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (77, 'Mono-amortisseur, déb : 130 mm', 'Simple disquede Ø 218 mm, étrier 1 piston', '130 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (78, 'Monoamortisseur Öhlins TTX36, déb : 120 mm', '1 disque Ø 220 mm, étrier 1 piston', '190 / 65 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (79, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 1 piston', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (80, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190/55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (81, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (82, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (83, 'Monoamortisseur, déb : 120 mm', 'Simple disque Ø 245mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (84, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (85, 'Mono-amortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier à 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (86, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (87, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240 mm, étrier 2 pistons', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (88, 'Mono-amortisseur, déb : 170 mm', '1 disque Ø 240 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (89, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (90, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (91, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (92, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (93, 'Monoamortisseur Öhlins TTX25', '1 disque Ø 220 mm, étrier 2 pistons', NULL, NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (94, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (95, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (96, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (97, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (98, 'Monoamortisseur, déb : 120 mm', 'Simple disque Ø 245mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (99, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (100, 'Mono-amortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier à 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (101, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (102, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240mm, étrier 1 piston', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (103, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240 mm, étrier 2 pistons', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (104, 'Mono-amortisseur, déb : 170 mm', '1 disque Ø 240 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (105, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (106, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (107, 'Monoamortisseur Öhlins TTX25', '1 disque Ø 220 mm, étrier 2 pistons', NULL, NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (108, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (109, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (110, 'Mono-amortisseur Öhlins', '1 disque Ø nc, étrier 2 pistons', '190 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (111, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (112, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (113, 'Mono-amortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier à 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (114, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (115, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240mm, étrier 1 piston', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (116, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240 mm, étrier 2 pistons', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (117, 'Mono-amortisseur, déb : 170 mm', '1 disque Ø 240 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (118, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (119, 'Mono-amortisseur, déb : 160 mm', '1 disque Ø 240 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (120, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (121, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (122, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (123, 'Monoamortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (124, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (125, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (126, 'Monoamortisseur, déb : 125 mm', 'Simple disque Ø 260mm, étriers 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (127, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 245 mm, étrier 1 piston', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (128, 'Mono-amortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier à 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (129, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (130, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240mm, étrier 1 piston', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (131, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240 mm, étrier 2 pistons', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (132, 'Mono-amortisseur, déb : 170 mm', '1 disque Ø 240 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (133, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (134, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (135, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (136, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (137, 'Mono-amortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier à 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (138, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240 mm, étrier 2 pistons', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (139, 'Mono-amortisseur, déb : 170 mm', '1 disque Ø 240 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (140, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (141, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (142, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (143, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (144, 'Mono-amortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (145, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 240 mm, étrier 2 pistons', '160 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (146, 'Mono-amortisseur, déb : 170 mm', '1 disque Ø 240 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (147, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (148, 'Mono-amortisseur, déb : 200 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (149, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (150, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (151, 'Mono-amortisseur, déb : 120 mm', '1 disque 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (152, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (153, 'Monoamortisseur, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (154, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (155, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (156, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (157, 'Mono-amortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (158, 'Mono-amortisseur, déb : 165 mm', '1 disque Ø 240 mm, étrier 2 pistons', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (159, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 240 mm, étrier 2 pistons', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (160, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (161, 'Mono-amortisseur, déb : 200 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (162, 'monoamortisseur, déb : 120 mm', '1 disque Ø 255 mm, étrier 2 pistons', '180/ 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (163, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (164, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (165, 'Mono-amortisseur, déb : 120 mm', '1 disque 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (166, 'Monoamortisseur Öhlins, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (167, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (168, 'Monoamortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (169, 'Monoamortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (170, 'Monoamortisseur Öhlins, déb : 133 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (171, 'Mono-amortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (172, 'Mono-amortisseur, déb : 165 mm', '1 disque Ø 240 mm, étrier 2 pistons', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (173, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 240 mm, étrier 2 pistons', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (174, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (175, 'Mono-amortisseur, déb : 200 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (176, 'monoamortisseur, déb : 120 mm', '1 disque Ø 255 mm, étrier 2 pistons', '180/ 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (177, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (178, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (179, 'Mono-amortisseur, déb : 120 mm', '1 disque 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (180, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (181, 'Monoamortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (182, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (183, 'Monoamortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (184, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (185, 'Mono-amortisseur Öhlins, déb : 135 mm', '1 disque Ø 220 mm, étrier à 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (186, 'Mono-amortisseur, déb : 165 mm', '1 disque Ø 240 mm, étrier 2 pistons', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (187, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (188, 'monoamortisseur, déb : 120 mm', '1 disque Ø 255 mm, étrier 2 pistons', '180/ 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (189, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (190, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (191, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (192, 'Monoamortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (193, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (194, 'Mono-amortisseur, déb : 165 mm', '1 disque Ø 240 mm, étrier 2 pistons', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (195, 'Mono-amortisseur, déb : 175 mm', '1 disque Ø 270 mm, étrier 2 pistons', '150 / 70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (196, 'monoamortisseur, déb : 120 mm', '1 disque Ø 255 mm, étrier 2 pistons', '180/ 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (197, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (198, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (199, 'Mono-amortisseur, déb : 260 mm', '1 disque Ø 220mm, étrier 1 piston', '120 / 80 - 18"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (200, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (201, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (202, 'Monoamortisseur Öhlins, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (203, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (204, 'Monoamortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (205, 'Monoamortisseur Öhlins, déb : 120 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (206, 'Monoamortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '180 / 55 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (207, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (208, 'Mono-amortisseur, déb : 260 mm', '1 disque Ø 220mm, étrier 1 piston', '120 / 80 - 18"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (209, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (210, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (211, 'Monoamortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (212, 'Mono-amortisseur, déb : 120 mm', '1 disque Ø 220mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (213, 'Mono-amortisseur, déb : 260 mm', '1 disque Ø 220mm, étrier 1 piston', '120 / 80 - 18"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (214, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (215, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (216, 'Monoamortisseur, déb : 135 mm', '1 disque Ø 220 mm, étrier 2 pistons', '190 / 50 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (217, 'Mono-amortisseur, déb : 260 mm', '1 disque Ø 220mm, étrier 1 piston', '120 / 80 - 18"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (218, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (219, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (220, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (221, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (222, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (223, 'Mono-amortisseur, déb : 130 mm', '1 disque Ø 220 mm, étrier 2 pistons', '150 / 60 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (224, '2 combinés latéraux, déb : 100 mm', '1 tambour Ø 160 mm', '130 / 90 - 16"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (225, 'Mono-amortisseur APS, déb : 220 mm', 'Un disque Ø 220 mm, étrier simple piston', '130/80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (226, 'Mono-amortisseur APS, déb : 220 mm', 'Un disque Ø 220 mm, étrier simple piston', '130/80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (227, 'mono-amortisseur, déb : 120 mm', '1 disque Ø 240mm, étrier 2 pistons', '130/70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (228, 'Mono-amortisseur APS, déb : 220 mm', 'Un disque Ø 220 mm, étrier simple piston', '130/80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (229, 'mono-amortisseur, déb : 120 mm', '1 disque Ø 240mm, étrier 2 pistons', '130/70 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (230, 'Mono-amortisseur APS, déb : 220 mm', 'Un disque Ø 220 mm, étrier simple piston', '130/80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (231, 'Mono-amortisseur APS, déb : 220 mm', 'Un disque Ø 220 mm, étrier simple piston', '130/80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (232, 'Mono-amortisseur', '1 disque Ø 230 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (233, 'Mono-amortisseur APS, déb : 220 mm', 'Un disque Ø 220 mm, étrier simple piston', '130/80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (234, 'Mono-amortisseur', '1 disque Ø 230 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (235, 'Mono-amortisseur', '1 disque Ø 230 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (236, 'Mono-amortisseur', '1 disque Ø 230 mm, étrier 1 piston', '130 / 80 - 17"', NULL);
INSERT INTO bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) VALUES (237, 'Mono-amortisseur', '1 disque Ø 230 mm, étrier 1 piston', '130 / 80 - 17"', NULL);


--
-- TOC entry 2175 (class 0 OID 84211)
-- Dependencies: 186
-- Data for Name: bike_transmission; Type: TABLE DATA; Schema: data_bikes; Owner: motorcycleportal
--

INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (1, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (2, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (3, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (4, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (5, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (6, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (7, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (8, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (9, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (10, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (11, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (12, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (13, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (14, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (15, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (16, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (17, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (18, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (19, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (20, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (21, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (22, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (23, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (24, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (25, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (26, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (27, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (28, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (29, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (30, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (31, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (32, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (33, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (34, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (35, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (36, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (37, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (38, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (39, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (40, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (41, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (42, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (43, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (44, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (45, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (46, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (47, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (48, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (49, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (50, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (51, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (52, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (53, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (54, '6 vitesses', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (55, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (56, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (57, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (58, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (59, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (60, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (61, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (62, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (63, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (64, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (65, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (66, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (67, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (68, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (69, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (70, '6 vitesses', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (71, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (72, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (73, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (74, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (75, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (76, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (77, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (78, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (79, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (80, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (81, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (82, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (83, '6 vitesses', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (84, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (85, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (86, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (87, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (88, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (89, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (90, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (91, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (92, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (93, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (94, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (95, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (96, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (97, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (98, '6 vitesses', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (99, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (100, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (101, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (102, '5 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (103, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (104, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (105, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (106, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (107, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (108, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (109, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (110, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (111, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (112, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (113, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (114, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (115, '5 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (116, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (117, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (118, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (119, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (120, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (121, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (122, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (123, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (124, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (125, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (126, '7 rapports', 'séquentielle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (127, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (128, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (129, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (130, '5 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (131, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (132, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (133, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (134, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (135, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (136, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (137, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (138, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (139, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (140, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (141, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (142, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (143, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (144, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (145, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (146, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (147, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (148, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (149, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (150, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (151, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (152, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (153, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (154, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (155, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (156, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (157, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (158, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (159, '5 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (160, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (161, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (162, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (163, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (164, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (165, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (166, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (167, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (168, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (169, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (170, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (171, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (172, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (173, '5 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (174, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (175, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (176, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (177, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (178, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (179, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (180, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (181, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (182, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (183, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (184, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (185, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (186, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (187, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (188, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (189, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (190, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (191, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (192, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (193, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (194, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (195, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (196, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (197, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (198, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (199, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (200, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (201, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (202, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (203, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (204, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (205, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (206, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (207, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (208, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (209, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (210, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (211, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (212, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (213, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (214, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (215, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (216, '6 vitesses', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (217, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (218, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (219, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (220, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (221, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (222, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (223, '6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (224, '6 rapports', 'manuelle', 'chaîne', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (225, 'à 5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (226, 'à 5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (227, 'à 6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (228, 'à 5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (229, 'à 6 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (230, 'à 5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (231, 'à 5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (232, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (233, 'à 5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (234, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (235, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (236, '5 rapports', 'manuelle', 'chaine', NULL);
INSERT INTO bike_transmission (id, gearbox_speeds, geerbox_type, secondary_transmission, type) VALUES (237, '5 rapports', 'manuelle', 'chaine', NULL);


--
-- TOC entry 2026 (class 2606 OID 84247)
-- Name: couple_name_bike_year_unique; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT couple_name_bike_year_unique UNIQUE (name, year);


--
-- TOC entry 2047 (class 2606 OID 84357)
-- Name: feature_value_bike_features_dictionary_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_features_dictionary
    ADD CONSTRAINT feature_value_bike_features_dictionary_pk PRIMARY KEY (feature, value);


--
-- TOC entry 2041 (class 2606 OID 84204)
-- Name: id_bike_engine_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_engine
    ADD CONSTRAINT id_bike_engine_pk PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 84226)
-- Name: id_bike_frame_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_frame
    ADD CONSTRAINT id_bike_frame_pk PRIMARY KEY (id);


--
-- TOC entry 2035 (class 2606 OID 84169)
-- Name: id_bike_general_information_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_bike_general_information_pk PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 84215)
-- Name: id_bike_transmission_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_transmission
    ADD CONSTRAINT id_bike_transmission_pk PRIMARY KEY (id);


--
-- TOC entry 2018 (class 2606 OID 84148)
-- Name: id_category_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_categories
    ADD CONSTRAINT id_category_pk PRIMARY KEY (id);


--
-- TOC entry 2039 (class 2606 OID 84193)
-- Name: id_front_axle_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_front_axle
    ADD CONSTRAINT id_front_axle_pk PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 84159)
-- Name: id_manufacturer_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_manufacturers
    ADD CONSTRAINT id_manufacturer_pk PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 84182)
-- Name: id_rear_axle_pk; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_rear_axle
    ADD CONSTRAINT id_rear_axle_pk PRIMARY KEY (id);


--
-- TOC entry 2020 (class 2606 OID 84150)
-- Name: name_category_unique; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_categories
    ADD CONSTRAINT name_category_unique UNIQUE (name);


--
-- TOC entry 2024 (class 2606 OID 84161)
-- Name: name_manufacturer_unique; Type: CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_manufacturers
    ADD CONSTRAINT name_manufacturer_unique UNIQUE (name);


--
-- TOC entry 2027 (class 1259 OID 84177)
-- Name: fki_id_category_bike_general_information_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_category_bike_general_information_fk ON bike_general_information USING btree (id_category);


--
-- TOC entry 2028 (class 1259 OID 84210)
-- Name: fki_id_engine_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_engine_fk ON bike_general_information USING btree (id_engine);


--
-- TOC entry 2029 (class 1259 OID 84232)
-- Name: fki_id_frame_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_frame_fk ON bike_general_information USING btree (id_frame);


--
-- TOC entry 2030 (class 1259 OID 84199)
-- Name: fki_id_front_axle_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_front_axle_fk ON bike_general_information USING btree (id_front_axle);


--
-- TOC entry 2031 (class 1259 OID 84253)
-- Name: fki_id_manufacturer_bike_general_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_manufacturer_bike_general_fk ON bike_general_information USING btree (id_manufacturer);


--
-- TOC entry 2032 (class 1259 OID 84188)
-- Name: fki_id_rear_axle_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_rear_axle_fk ON bike_general_information USING btree (id_rear_axle);


--
-- TOC entry 2033 (class 1259 OID 84221)
-- Name: fki_id_transmission_fk; Type: INDEX; Schema: data_bikes; Owner: motorcycleportal
--

CREATE INDEX fki_id_transmission_fk ON bike_general_information USING btree (id_transmission);


--
-- TOC entry 2048 (class 2606 OID 84172)
-- Name: id_category_bike_general_information_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_category_bike_general_information_fk FOREIGN KEY (id_category) REFERENCES bike_categories(id);


--
-- TOC entry 2051 (class 2606 OID 84205)
-- Name: id_engine_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_engine_fk FOREIGN KEY (id_engine) REFERENCES bike_engine(id);


--
-- TOC entry 2053 (class 2606 OID 84227)
-- Name: id_frame_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_frame_fk FOREIGN KEY (id_frame) REFERENCES bike_frame(id);


--
-- TOC entry 2050 (class 2606 OID 84194)
-- Name: id_front_axle_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_front_axle_fk FOREIGN KEY (id_front_axle) REFERENCES bike_front_axle(id);


--
-- TOC entry 2054 (class 2606 OID 84248)
-- Name: id_manufacturer_bike_general_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_manufacturer_bike_general_fk FOREIGN KEY (id_manufacturer) REFERENCES bike_manufacturers(id);


--
-- TOC entry 2049 (class 2606 OID 84183)
-- Name: id_rear_axle_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_rear_axle_fk FOREIGN KEY (id_rear_axle) REFERENCES bike_rear_axle(id);


--
-- TOC entry 2052 (class 2606 OID 84216)
-- Name: id_transmission_fk; Type: FK CONSTRAINT; Schema: data_bikes; Owner: motorcycleportal
--

ALTER TABLE ONLY bike_general_information
    ADD CONSTRAINT id_transmission_fk FOREIGN KEY (id_transmission) REFERENCES bike_transmission(id);


-- Completed on 2016-11-28 15:14:44

--
-- PostgreSQL database dump complete
--

