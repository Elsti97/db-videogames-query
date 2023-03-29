-- SELECT

-- 1
SELECT *
FROM software_houses
WHERE country = 'United States';

-- 2
SELECT *
FROM players
WHERE city = 'Rogahnland';

-- 3
SELECT *
FROM players
WHERE name LIKE '%a';

-- 4
SELECT *
FROM reviews
WHERE player_id = 800;

-- 5
SELECT *
FROM tournaments
WHERE year = 2015;

-- 6
SELECT *
FROM awards
WHERE description LIKE '%facere%';

-- 7
SELECT DISTINCT videogame_id
FROM category_videogame
WHERE category_id = 2 or category_id = 6;

-- 8
SELECT *
FROM reviews
WHERE rating BETWEEN 2 AND 4;

-- 9
SELECT *
FROM videogames
WHERE release_date LIKE '2020%';

-- 10
SELECT DISTINCT videogame_id, rating
FROM reviews
WHERE rating = 5;


--GROUP BY

-- 1
SELECT country, COUNT(*) as numero_per_paese
FROM software_houses
GROUP BY country;

-- 2
SELECT videogame_id, COUNT(*) as numero_per_videogioco
FROM reviews
GROUP BY videogame_id;

-- 3
SELECT pegi_label_id, COUNT(*) as videogiochi_per_pegi
FROM pegi_label_videogame
GROUP BY pegi_label_id;

-- 4
SELECT YEAR(release_date) as anno, COUNT(*) as numero_videogiochi
FROM videogames
GROUP BY YEAR(release_date);

-- 5
SELECT device_id, COUNT(*) as numero_videogiochi
FROM device_videogame
GROUP BY device_id;

-- 6 
SELECT AVG(rating) as media, videogame_id
FROM reviews
GROUP BY videogame_id
ORDER BY AVG(rating);