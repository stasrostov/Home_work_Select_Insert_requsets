CREATE TABLE IF NOT EXISTS Jenres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL,
	YEAR SMALLINT NOT NULL CHECK(YEAR > 2000)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL,
	duration INTEGER NOT NULL CHECK(duration > 60),
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);


CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL,
	YEAR SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS JenreArtist (
	PRIMARY KEY(artist_id, jenre_id),
	artist_id INTEGER NOT NULL REFERENCES Artists(id),
	jenre_id INTEGER NOT NULL REFERENCES Jenres(id)
);

CREATE TABLE IF NOT EXISTS AlbumArtist (
	PRIMARY KEY(artist_id, album_id),
	artist_id INTEGER NOT NULL REFERENCES Artists(id),
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	PRIMARY KEY(collection_id, track_id),
	collection_id INTEGER NOT NULL REFERENCES Collections(id),
	track_id INTEGER NOT NULL REFERENCES Tracks(id)
);


INSERT INTO Artists(name)
	VALUES('Prodigy'), ('Armin van Buuren'), ('Баста'), ('Rammstein'), 
	('Ludacris'), ('Miyagi'), ('Duwayne Motley'), ('Tiesto');


INSERT INTO Jenres(name)
	VALUES('Rock'), ('Techno'), ('Rap'), ('Hip-Hop'), ('Chillhouse');


INSERT INTO Albums(name, year)
	VALUES('No Tourists', 2018), ('Radio', 2022), ('Баста 4', 2015), ('Back For The First Time', 2017), 
('Balance', 2019), ('The London sessions', 2020), ('Keep Talking', 2021), ('Hattori', 2022);


INSERT INTO Tracks(name, duration, album_id)
	VALUES('Need Some', 144, 1), ('We live forever', 177, 1), ('Deutschland', 323, 2), ('Zeig Dich', 211, 2),
	('Райские Яблоки', 240, 3), ('Одна любовь', 323, 3), ('Game Got Switched', 249, 4), ('What is Your Fantasy', 275, 4),
	('Something Real', 299, 5), ('Blah Blah Blah', 183, 5), ('God Is A Dancer', 188, 6), ('Nothing Really Matters', 216, 6),
	('Keep Talking', 174, 7), ('My love', 253, 7), ('Ночь', 277, 8), ('Need Me', 277, 8);


INSERT INTO collections(name, year)
	VALUES('Collection_1', 2019), ('Collection_2', 2014), ('Collection_3', 2020), ('Collection_4', 2019), ('Collection_5', 2015),
	('Collection_6', 2022), ('Collection_7', 2009), ('Collection_8', 2017)
	

INSERT INTO jenreartist
	VALUES(1, 1), (2, 2), (3, 3), (4, 1), 
	(5, 4), (6, 3), (7, 5), (8, 2);

INSERT INTO albumartist
	VALUES(1, 1), (2, 5), (3, 3), (4, 2), (5, 4), (6, 8), (7, 7), (8, 6);

INSERT INTO collectiontrack
	VALUES(1, 1), (1, 2), (2, 3), (2, 4), 
	(3, 5), (3, 6), (4, 7), (4, 8), 
	(5, 9), (5, 10), (6, 11), (6, 12), 
	(7, 13), (7, 14), (8, 15), (8, 16);



-- Название и год выхода альбомов, вышедших в 2018 году
SELECT name, year FROM albums
WHERE "year" = 2018

-- Название и продолжительность самого длительного трека
SELECT * FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name FROM tracks
WHERE duration >= 210

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name FROM collections
WHERE "year" BETWEEN 2018 AND 2020;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT * FROM artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT name FROM tracks
WHERE "name" LIKE '%My%' OR "name" LIKE '%my%' OR "name" LIKE '%Мой%' OR "name" LIKE '%мой%';


