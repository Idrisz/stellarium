create table logbook_system (last_script_run INT NOT NULL);
create table observers (observer_id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, surname VARCHAR NOT NULL);
create table sites (site_id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, longitude DOUBLE, latitude DOUBLE, elevation INT, timezone_offset FLOAT);
create table sessions (session_id INTEGER PRIMARY KEY, begin VARCHAR, end VARCHAR, site_id INT REFERENCES sites(site_id) NOT NULL, observer_id INT REFERENCES observers(observer_id), weather TEXT, comments TEXT);
create table target_types (target_type_id INTEGER PRIMARY KEY, type VARCHAR NOT NULL);
create table targets (target_id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, alias VARCHAR, right_ascension DOUBLE NOT NULL, declination DOUBLE NOT NULL, constellation VARCHAR, target_type_id INT NOT NULL REFERENCES target_types(target_type_id), magnitude DOUBLE, size DOUBLE, distance DOUBLE, catalog_number VARCHAR, notes TEXT);
create table optics (optic_id INTEGER PRIMARY KEY, model VARCHAR NOT NULL, vendor VARCHAR, type VARCHAR, focal_length FLOAT NOT NULL, aperture FLOAT NOT NULL, hFlip BOOLEAN, vFlip BOOLEAN, light_transmission FLOAT);
create table oculars (ocular_id INTEGER PRIMARY KEY, model VARCHAR NOT NULL, vendor VARCHAR, focal_length FLOAT NOT NULL, apparent_fov INT NOT NULL);
create table barlows (barlow_id INTEGER PRIMARY KEY, model VARCHAR NOT NULL, vendor VARCHAR, factor FLOAT NOT NULL);
create table filters (filter_id INTEGER PRIMARY KEY, type VARCHAR NOT NULL, vendor VARCHAR NOT NULL, model VARCHAR, color VARCHAR);
create table imagers (imager_id INTEGER PRIMARY KEY, model VARCHAR NOT NULL, vendor VARCHAR, notes TEXT);
create table observations (observation_id INTEGER PRIMARY KEY, observer_id INT NOT NULL REFERENCES observers(observer_id), session_id INT NOT NULL REFERENCES sessions(session_id), target_id INT NOT NULL REFERENCES targets(target_id), begin VARCHAR, end VARCHAR, limiting_magnitude FLOAT, seeing VARCHAR, optics_id INT NOT NULL REFERENCES optics(optic_id), ocular_id INT REFERENCES oculars(ocular_id), barlow_id INT REFERENCES barlows(barlow_id), filter_id INT REFERENCES filters(filter_id), imager_id INT REFERENCES imagers(imager_id), accessories TEXT, notes TEXT, image_filename VARCHAR);
INSERT INTO target_types (type) VALUES('Diffuse Nebula');
INSERT INTO target_types (type) VALUES('Double Star');
INSERT INTO target_types (type) VALUES('Emission Nebula');
INSERT INTO target_types (type) VALUES('Galaxy');
INSERT INTO target_types (type) VALUES('Globular Cluster');
INSERT INTO target_types (type) VALUES('Multipule Star');
INSERT INTO target_types (type) VALUES('Open Cluster');
INSERT INTO target_types (type) VALUES('Planet');
INSERT INTO target_types (type) VALUES('Planetary Nebula');
INSERT INTO target_types (type) VALUES('Star');
INSERT INTO target_types (type) VALUES('Supernova Remnant');
