---- SELECT

---- 1
--SELECT *
--FROM software_houses
--WHERE country = 'United States';

---- 2
--SELECT *
--FROM players
--WHERE city = 'Rogahnland';

---- 3
--SELECT *
--FROM players
--WHERE name LIKE '%a';

---- 4
--SELECT *
--FROM reviews
--WHERE player_id = 800;

---- 5
--SELECT *
--FROM tournaments
--WHERE year = 2015;

---- 6
--SELECT *
--FROM awards
--WHERE description LIKE '%facere%';

---- 7
--SELECT DISTINCT videogame_id
--FROM category_videogame
--WHERE category_id = 2 or category_id = 6;

---- 8
--SELECT *
--FROM reviews
--WHERE rating BETWEEN 2 AND 4;

---- 9
--SELECT *
--FROM videogames
--WHERE release_date LIKE '2020%';

---- 10
--SELECT DISTINCT videogame_id, rating
--FROM reviews
--WHERE rating = 5;


---- GROUP BY

---- 1
--SELECT country, COUNT(*) as numero_per_paese
--FROM software_houses
--GROUP BY country;

---- 2
--SELECT videogame_id, COUNT(*) as numero_per_videogioco
--FROM reviews
--GROUP BY videogame_id;

---- 3
--SELECT pegi_label_id, COUNT(*) as videogiochi_per_pegi
--FROM pegi_label_videogame
--GROUP BY pegi_label_id;

---- 4
--SELECT YEAR(release_date) as anno, COUNT(*) as numero_videogiochi
--FROM videogames
--GROUP BY YEAR(release_date);

---- 5
--SELECT device_id, COUNT(*) as numero_videogiochi
--FROM device_videogame
--GROUP BY device_id;

---- 6 
--SELECT AVG(rating) as media, videogame_id
--FROM reviews
--GROUP BY videogame_id
--ORDER BY AVG(rating);


---- JOIN

---- 1
--SELECT DISTINCT players.*
--FROM players
--INNER JOIN reviews
--ON players.id = reviews.player_id;

---- 2
--SELECT DISTINCT videogames.name, videogames.id
--FROM videogames 
--INNER JOIN tournament_videogame 
--ON videogame_id = videogames.id 
--INNER JOIN tournaments 
--ON tournaments.id = tournament_id 
--WHERE tournaments.year = 2016;

---- 3
--SELECT categories.name, videogames.name
--FROM categories 
--INNER JOIN category_videogame 
--ON category_id = categories.id 
--INNER JOIN videogames 
--ON videogames.id = category_id;

---- 4
--SELECT DISTINCT software_houses.name
--FROM software_houses
--INNER JOIN videogames
--ON software_house_id = software_houses.id
--WHERE YEAR(release_date) > 2020;

---- 5
--SELECT awards.name, software_houses.name
--FROM awards
--INNER JOIN award_videogame
--ON award_id = awards.id
--INNER JOIN videogames
--ON videogames.id = videogame_id
--INNER JOIN software_houses
--ON software_houses.id = software_house_id

---- 6
--SELECT DISTINCT categories.name as categoria, pegi_labels.name as pegi, videogames.name
--FROM categories
--INNER JOIN category_videogame
--ON category_videogame.category_id = categories.id
--INNER JOIN videogames
--ON videogames.id = category_videogame.videogame_id
--INNER JOIN pegi_label_videogame
--ON pegi_label_videogame.videogame_id = videogames.id
--INNER JOIN pegi_labels
--ON pegi_labels.id = pegi_label_videogame.pegi_label_id
--INNER JOIN reviews
--ON reviews.videogame_id = videogames.id
--WHERE rating >= 4;

---- 7
--SELECT DISTINCT videogames.name, videogames.id
--FROM videogames
--INNER JOIN tournament_videogame
--ON tournament_videogame.videogame_id = videogames.id
--INNER JOIN tournaments
--ON tournaments.id = tournament_videogame.tournament_id
--INNER JOIN player_tournament
--ON player_tournament.tournament_id = tournaments.id
--INNER JOIN players
--ON players.id = player_tournament.player_id
--WHERE players.name LIKE 'S%';

---- 8
--SELECT tournaments.city
--FROM tournaments
--INNER JOIN tournament_videogame
--ON tournament_videogame.tournament_id = tournaments.id
--INNER JOIN videogames
--ON videogames.id = tournament_videogame.videogame_id
--INNER JOIN award_videogame
--ON videogames.id = award_videogame.videogame_id 
--INNER JOIN awards
--ON award_videogame.award_id = awards.id
--WHERE awards.name LIKE '%anno' AND award_videogame.year = 2018;

---- 9
--SELECT players.name, players.lastname, players.nickname
--FROM players
--INNER JOIN player_tournament 
--ON player_tournament.player_id = players.id
--INNER JOIN tournaments
--ON tournaments.id = player_tournament.tournament_id
--INNER JOIN tournament_videogame
--ON tournament_videogame.tournament_id = tournaments.id
--INNER JOIN videogames
--ON videogames.id = tournament_videogame.videogame_id
--INNER JOIN award_videogame
--ON award_videogame.videogame_id = videogames.id
--INNER JOIN awards
--ON awards.id = award_videogame.award_id
--WHERE awards.name = 'Gioco più atteso' AND award_videogame.year = 2018 AND tournaments.year = 2019;


---- BONUS JOIN

---- 10
SELECT software_houses.id, software_houses.name
FROM software_houses
INNER JOIN videogames
ON videogames.software_house_id = software_houses.id
WHERE videogames.release_date = (SELECT MIN (videogames.release_date) FROM videogames);
