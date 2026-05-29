```sql
DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;

\c universe

-- =========================
-- TABLE: galaxy
-- =========================
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  age_in_millions_of_years INT,
  distance_from_earth INT,
  description TEXT UNIQUE,
  density NUMERIC(4,3),
  galaxy_type VARCHAR(30),
  life_index NUMERIC(5,3)
);

-- =========================
-- TABLE: star
-- =========================
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  age_in_millions_of_years INT,
  distance_from_earth INT,
  description TEXT UNIQUE,
  has_life BOOLEAN,
  galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- =========================
-- TABLE: planet
-- =========================
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  age_in_millions_of_years INT,
  distance_from_earth INT,
  description TEXT UNIQUE,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  planet_type VARCHAR(30),
  star_id INT REFERENCES star(star_id)
);

-- =========================
-- TABLE: moon
-- =========================
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  age_in_millions_of_years INT,
  distance_from_earth INT,
  description TEXT UNIQUE,
  has_life BOOLEAN,
  planet_id INT REFERENCES planet(planet_id)
);

-- =========================
-- TABLE: galaxy_star
-- =========================
CREATE TABLE galaxy_star (
  galaxy_star_id VARCHAR(30) PRIMARY KEY,
  name VARCHAR(30),
  accessibility BOOLEAN NOT NULL,
  route VARCHAR(30) UNIQUE,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  star_id INT REFERENCES star(star_id)
);

-- =========================
-- TABLE: star_planet
-- =========================
CREATE TABLE star_planet (
  star_planet_id VARCHAR(30) PRIMARY KEY,
  name VARCHAR(30),
  accessibility BOOLEAN NOT NULL,
  route VARCHAR(30) UNIQUE
);

-- =========================
-- TABLE: planet_moon
-- =========================
CREATE TABLE planet_moon (
  planet_moon_id VARCHAR(30) PRIMARY KEY,
  name VARCHAR(30),
  accessibility BOOLEAN NOT NULL,
  route VARCHAR(30) UNIQUE
);

-- =========================
-- INSERT GALAXIES
-- =========================
INSERT INTO galaxy(name) VALUES
('G1'),
('G2'),
('G3'),
('G4'),
('G5'),
('G6'),
('G7');

-- =========================
-- INSERT STARS
-- =========================
INSERT INTO star(name, galaxy_id) VALUES
('S1',1),
('S2',2),
('S3',3),
('S4',4),
('S5',5),
('S6',6),
('S7',7);

-- =========================
-- INSERT PLANETS
-- =========================
INSERT INTO planet(name, star_id) VALUES
('P1',7),
('P2',2),
('P3',2),
('P4',2),
('P5',2),
('P6',3),
('P7',3),
('P8',3),
('P9',3),
('P10',3),
('P11',4),
('P12',4);

-- =========================
-- INSERT MOONS
-- =========================
INSERT INTO moon(name, planet_id) VALUES
('M1',1),
('M2',1),
('M3',1),
('M4',4),
('M5',4),
('M6',4),
('M7',4),
('M8',4),
('M9',4),
('M10',4),
('M11',4),
('M12',4),
('M22',4),
('M32',4),
('M42',4),
('M52',4),
('M62',4),
('M72',4),
('M28',4),
('M92',4),
('M102',4),
('M112',4),
('M122',4);

-- =========================
-- INSERT galaxy_star
-- =========================
INSERT INTO galaxy_star
(galaxy_star_id, name, accessibility)
VALUES
('1','GS1',TRUE),
('2','GS2',TRUE),
('3','GS3',TRUE);

-- =========================
-- INSERT star_planet
-- =========================
INSERT INTO star_planet
(star_planet_id, name, accessibility)
VALUES
('1','SP1',TRUE),
('2','SP2',TRUE),
('3','SP3',TRUE);

-- =========================
-- INSERT planet_moon
-- =========================
INSERT INTO planet_moon
(planet_moon_id, name, accessibility)
VALUES
('1','PM1',TRUE),
('2','PM2',TRUE),
('3','PM3',TRUE);
```




