-- Entering GameSeries Table
CREATE TABLE IF NOT EXISTS 'GameSeries' (
	'gsID' int(10) NOT NULL,
	'gsName' varchar(20) NOT NULL,
	'gsDateOrigin' date NOT NULL,
	PRIMARY KEY ('gsID')
);

-- Entering Character Table
CREATE TABLE IF NOT EXISTS 'Character' (
	'charID' int(10) NOT NULL,
	'charName' varchar(20) NOT NULL,
	'charColor' varchar(10) NOT NULL,
	'charGameSeries' varchar(20) NOT NULL,
	--'charDateOrigin' date NOT NULL,
	'gsID' int(10) NOT NULL REFERENCES [GameSeries](gsID) ON DELETE CASCADE,
	PRIMARY KEY ('charID')
	--CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

-- Entering ColorScheme Table
CREATE TABLE IF NOT EXISTS 'ColorScheme' (
	'colorID' int(10) NOT NULL,
	'color1' varchar(10) NOT NULL,
	'color2' varchar(10) NOT NULL,
	'color3' varchar(10) NOT NULL,
	'color4' varchar(10) NOT NULL,
	'color5' varchar(10),
	'color6' varchar(10),
	'charID' int(10) NOT NULL REFERENCES [Character](charID),
	PRIMARY KEY ('colorID')
);

-- Entering Move Table
CREATE TABLE IF NOT EXISTS 'Moves' (
	'moveID' int(10) NOT NULL,
	'moveB' varchar(20) NOT NULL,
	'moveUpB' varchar(20) NOT NULL,
	'moveDownB' varchar(20) NOT NULL,
	'charID' int(10) NOT NULL REFERENCES [Character] (charID),
	PRIMARY KEY ('moveID')
);

-- Entering Stages Table
CREATE TABLE IF NOT EXISTS 'Stages' (
	'stageID' int(10) NOT NULL,
	'stageName' varchar(25) NOT NULL,
	'stageGameSeries' varchar(20) NOT NULL,
	'stageHazard' char(10) NOT NULL, 
	'stageViable' char(10) NOT NULL,
	'stageMove' char(10) NOT NULL,
	'gsID' int(10) NOT NULL REFERENCES [GameSeries](gsID),
	PRIMARY KEY ('stageID')
	-- CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

-- Entering Items Table
CREATE TABLE IF NOT EXISTS 'Items' (
	'itemID' int(10) NOT NULL,
	'itemName' varchar(20) NOT NULL,
	'itemGameSeries' varchar(20) NOT NULL,
	--'itemType' char(10) NOT NULL,
	'gsID' int(10) NOT NULL REFERENCES [GameSeries](gsID),
	PRIMARY KEY ('itemID')
	-- CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

-- Entering Pokeball Table
CREATE TABLE IF NOT EXISTS 'Pokeball' (
	'pokeID' int(10) NOT NULL,
	'pokePkmn' varchar(20) NOT NULL,
	'pokePkmnType1' char(10) NOT NULL,
	'pokePkmnType2' char(10),
	'pokeGen' int(5) NOT NULL,
	'pokeGenName' varchar(20) NOT NULL,
	'itemID' int(10) NOT NULL REFERENCES [Items](itemID),
	PRIMARY KEY ('pokeID')
	-- CONSTRAINT 'FK2' FOREIGN KEY ('itemID') REFERENCES 'Items'('ID')
);

-- Inserting all data into GameSeries
INSERT INTO 'GameSeries' ('gsID', 'gsName', 'gsDateOrigin') VALUES
(1, 'Super Mario', '1981-07-09'),
(2, 'Donkey Kong', '1981-07-09'),
(3, 'The Legend of Zelda', '1986-02-21'),
(4, 'Metroid', '1986-08-06'),
(5, 'Yoshi', '1991-12-04'),
(6, 'Kirby', '1992-04-27'),
(7, 'Star Fox', '1993-02-21'),
(8, 'Pokemon', '1996-02-27'),
(9, 'Earthbound', '1989-07-27'),
(10, 'F-Zero', '1990-11-21'),
(11, 'Super Smash Bros.', '1999-01-21');

-- Inserting all data into Character
INSERT INTO 'Character' ('charID', 'charName', 'charColor', 'charGameSeries', 'gsID') VALUES
(1, 'Mario', 'RED', 'Super Mario', 1),
(2, 'Donkey Kong', 'BROWN', 'Donkey Kong', 2),
(3, 'Link', 'GREEN', 'The Legend of Zelda', 3),
(4, 'Samus', 'ORANGE', 'Metroid', 4),
(5, 'Yoshi', 'GREEN', 'Yoshi', 5),
(6, 'Kirby', 'PINK', 'Kirby', 6),
(7, 'Fox', 'BROWN', 'Star Fox', 7),
(8, 'Pikachu', 'YELLOW', 'Pokemon', 8),
(9, 'Luigi', 'GREEN', 'Super Mario', 1),
(10, 'Ness', 'YELLOW', 'Earthbound', 9),
(11, 'Captain Falcon', 'BLUE', 'F-Zero', 10),
(12, 'Jigglypuff', 'PINK', 'Pokemon', 8);

-- Inserting all data into ColorScheme
INSERT INTO 'ColorScheme' ('colorID', 'color1', 'color2', 'color3', 'color4', 'color5', 'color6', 'charID') VALUES
(1, 'PURPLE', 'GREY', 'RED', 'WHITE', 'GREEN', 'BLUE', 11),
(2, 'BROWN', 'BLACK', 'RED', 'BLUE', 'BLUE', 'GREEN', 2),
(3, 'GREY', 'RED', 'BLUE', 'GREEN', NULL, NULL, 7),
(4, 'PINK', 'RED', 'BLUE', 'GREEN', NULL, NULL, 12),
(5, 'PINK', 'YELLOW', 'BLUE', 'RED', 'GREEN', NULL, 6),
(6, 'GREEN', 'RED', 'BLUE', 'LAVENDER', NULL, NULL, 3),
(7, 'GREEN', 'WHITE', 'BLUE', 'PINK', NULL, NULL, 9),
(8, 'RED', 'YELLOW', 'BROWN', 'BLUE', 'GREEN', NULL, 1),
(9, 'RED', 'YELLOW', 'BLUE', 'GREEN', NULL, NULL, 10),
(10, 'YELLOW', 'RED', 'BLUE', 'GREEN', NULL, NULL, 8),
(11, 'RED', 'PINK', 'BLACK', 'GREEN', 'BLUE', NULL, 4),
(12, 'GREEN', 'RED', 'CYAN', 'YELLOW', 'PINK', 'BLUE', 5);

-- Inserting all data into Moves
INSERT INTO 'Moves' ('moveID', 'moveB', 'moveUpB', 'moveDownB', 'charID') VALUES
(1, 'Fireball', 'Super Jump Punch', 'Mario Tornado', 1),
(2, 'Giant Punch', 'Spinning Kong', 'Hand Slap', 2),
(3, 'Boomerang', 'Spinning Slash', 'Bomb', 3),
(4, 'Charge Shot', 'Screw Attack', 'Bomb', 4),
(5, 'Lay Egg', 'Throw Egg', 'Hip Drop', 5),
(6, 'Inhale', 'Final Cutter', 'Stone', 6),
(7, 'Blastor Shot', 'Fire Fox', 'Reflector', 7),
(8, 'Thunder Jolt', 'Quick Attack', 'Thunder', 8),
(9, 'Fieball', 'Super Jump Punch', 'Luigi Tornado', 9),
(10, 'PK Fire', 'PK Thunder', 'PSI Magnet', 10),
(11, 'Falcon Punch', 'Falcon Dive', 'Falcon Kick', 11),
(12, 'Pound', 'Sing', 'Rest', 12);

-- Inserting all data into Stages
INSERT INTO 'Stages' ('stageID', 'stageName', 'stageGameSeries', 'stageHazard', 'stageViable', 'stageMove', 'gsID') VALUES
(1, 'Peach''s Castle', 'Super Mario', 'BUMPER', 'UNVIABLE', 'NO', 1),
(2, 'Congo Jungle', 'Donkey Kong', 'CANNON', 'UNVIABLE', 'YES', 2),
(3, 'Hyrule Castle', 'The Legend of Zelda', 'TORNADO', 'UNVIABLE', 'NO', 3),
-- Check Planet Zebes, might not be FLOOR, might not be YES
(4, 'Planet Zebes', 'Metroid', 'FLOOR', 'UNVIABLE', 'YES', 4),
(5, 'Mushroom Kingdom', 'Super Mario', 'PLATFORMS', 'UNVIABLE', 'NO', 1),
(6, 'Yoshi''s Island', 'Yoshi', 'CLOUDS', 'UNVIABLE', 'NO', 5),
(7, 'Dream Land', 'Kirby', 'NONE', 'VIABLE', 'NO', 6),
--check Sector Z
(8, 'Sector Z', 'Star Fox', 'BLASTERS', 'UNVIABLE', 'NO', 7),
(9, 'Saffron City', 'Pokemon', 'POKEMON', 'UNVIABLE', 'YES', 8);

-- Inserting all data into Items
INSERT INTO 'Items' ('itemID', 'itemName', 'itemGameSeries', 'gsID') VALUES
(1, 'Beam Sword', 'Super Smash Bros.', 11),
(2, 'Bob-omb', 'Super Mario', 1),
(3, 'Bumper', 'Super Smash Bros.', 11),
(4, 'Fan', 'Super Smash Bros.', 11),
(5, 'Fire Flower', 'Super Mario', 1),
(6, 'Green Shell', 'Super Mario', 1),
(7, 'Home-Run Bat', 'Earthbound', 9),
(8, 'Maxim Tomato', 'Kirby', 6),
(9, 'Motion-Sensor Bomb', 'Super Smash Bros.', 11),
(10, 'Poke Ball', 'Pokemon', 8),
(11, 'Ray Gun', 'Super Smash Bros.', 11),
(12, 'Starman', 'Super Mario', 1);

-- Inserting all data into Pokeball
INSERT INTO 'Pokeball' ('pokeID', 'pokePKMN', 'pokePkmnType1', 'pokePkmnType2', 'pokeGen', 'pokeGenName', 'itemID') VALUES
(6, 'Charizard', 'FIRE', 'FLYING', 1, 'Kanto', 10),
(9, 'Blaistoise', 'WATER', NULL, 1, 'Kanto', 10),
(15, 'Beedrill', 'BUG', 'FLYING', 1, 'Kanto', 10),
(35, 'Clefairy', 'FAIRY', NULL, 1, 'Kanto', 10),
(52, 'Meowth', 'NORMAL', NULL, 1, 'Kanto', 10),
(95, 'Onix', 'ROCK', NULL, 1, 'Kanto', 10),
(106, 'Hitmonlee', 'FIGHTING', NULL, 1, 'Kanto', 10),
(109, 'Koffing', 'POISING', NULL, 1, 'Kanto', 10),
(113, 'Chansey', 'NORMAL', NULL, 1, 'Kanto', 10),
(118, 'Goldeen', 'WATER', NULL, 1, 'Kanto', 10),
(121, 'Starmie', 'WATER', NULL, 1, 'Kanto', 10),
(143, 'Snorlax', 'NORMAL', NULL, 1, 'Kanto', 10),
(151, 'Mew', 'PSYCHIC', NULL, 1, 'Kanto', 10);

-- 20 Queries
-- 1 - Getting all characters moves who have their first color as red
SELECT DISTINCT charName, moveB, moveUpB, moveDownB
FROM Moves, Character, ColorScheme
WHERE color1 = 'RED'
    AND Character.charID = ColorScheme.charID
    AND Character.charID = Moves.charID;
    
-- 2 - Getting all the items from the Super Smash Bros Series, descending order
SELECT itemName
FROM Items AS A
WHERE A.gsID = 11
ORDER BY itemID DESC;

-- 3 - Counting the amount of games released after 1990
SELECT COUNT(gsName)
FROM GameSeries
WHERE gsDateOrigin > '1990-%-%';

-- 4 - Selecting the pokemon with only 1 type
SELECT pokePKMN
FROM Pokeball
WHERE pokePkmnType2 IS NULL;

-- 5 - Getting all the items from game series released after 1990, in descending order
SELECT itemID, itemName
FROM Items, (SELECT gsID as lessThan1990
            FROM GameSeries
            WHERE gsDateOrigin < '1990-%-%')
WHERE Items.gsID = lessThan1990
ORDER BY itemID DESC;

--6-- Grab the IDs of all rock type pokemon from the region kanto in Ascending Order

Select pokeID 
FROM Pokeball as P
WHERE P.pokePkmnType1='ROCK' AND pokeGenName='Kanto'
ORDER BY pokeID ASC;

--7-- General format to grab origin date of a given Character(swap out for Mario)

SELECT gsDateOrigin 
from GameSeries  as G, Character as C
WHERE G.gsID= C.gsID AND C.charName='Mario';

--8 -- Select all the maps available with a Platform stage hazard

SELECT stageID, stageName
FROM Stages as S
WHERE S.stageHazard='PLATFORMS';


--9-- General Format to grab the map of a particular character
-- Didn't work in SQLite
SELECT stageName as OriginMap
from Character as C, GameSeries  as G, Stages as S
WHERE G.GameSeries= C.GameSeries AND S.stageGameSeries=C.GameSeries AND C.charName='FOX';

--10-- Select All stages that move by Stage Name

Select stageName
FROM STAGES as S
WHERE stageMove='YES';

--11-- Select all the items Associated with a given Game Series 

SELECT DISTINCT itemName
FROM Items I, Character as C
Where I.gsID = C.gsID 
ORDER BY C.gsID;

--12-- Example of Update a certain Pokemon's name based on ID
-- Didn't work in SQLite
UPDATE POKEBALL
SET pokePKMN='Pikachu'
WHERE pokeID=9;

-- 13 - Deleting itemID 8 (Maxim Tomato) from the Item table
DELETE 
FROM Items
WHERE itemID = 8;

-- 14 - Inserting the deleted table back in (Maxim Tomato)
INSERT INTO 'Items' ('itemID', 'itemName', 'itemGameSeries', 'gsID') VALUES
(8, 'Maxim Tomato', 'Kirby', 6);

-- 15 -  Listing all the characters moves who's first game was released prior to 1990
SELECT DISTINCT charName, moveB, moveUpB, moveDownB
FROM Character AS c, Moves AS m, GameSeries AS g
WHERE gsDateOrigin < '1990-%-%'
    AND c.charID = m.charID
    AND c.gsID = g.gsID;

-- 16 - Getting the characters with the max amount of colors
SELECT charName
FROM Character as c, ColorScheme as cs
WHERE c.charID = cs.charID
	AND color5 IS NULL
	AND color6 IS NULL

-- 17 - Counting how many characters have 5 colors
SELECT COUNT(charName)
FROM (SELECT DISTINCT charName
    FROM Character AS c, ColorScheme AS cs
    WHERE c.charID = cs.charID
        AND color5 IS NULL);

-- 18 - Getting all the characters from the series that has the stage with a tornado hazard
SELECT charName, moveB, moveUpB, moveDownB
FROM Character AS c, Moves AS m, Stages AS s
WHERE c.charID = m. charID
    AND c.gsID = s.gsID
    AND s.stageHazard LIKE '%TORNADO%';
    
-- 19 - Getting all viable stages with the series name
SELECT DISTINCT stageName, stageViable, gsName
FROM Stages AS s, GameSeries AS gs
WHERE stageViable = 'VIABLE'
    AND s.gsID = gs.gsID;

-- 20 - Counting how many characters have only 4 colors
SELECT COUNT(charName)
FROM (SELECT charName
	FROM Character as c, ColorScheme as cs
	WHERE c.charID = cs.charID
		AND color5 IS NULL
		AND color6 IS NULL); 

