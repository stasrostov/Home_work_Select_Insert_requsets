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


