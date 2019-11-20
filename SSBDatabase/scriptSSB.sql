SELECT charName
from character, Game Series


INSERT INTO Game Series
SELECT *
FROM character;
 

CREATE TABLE IF NOT EXISTS 'GameSeries' (
	'gsID' int(10) NOT NULL,
	'gsName' varchar(20) NOT NULL,
	'gsDateOrigin' date NOT NULL
	PRIMARY KEY ('gsID')
);

CREATE TABLE IF NOT EXISTS 'Character' (
	'charID' int(10) NOT NULL,
	'charName' varchar(20) NOT NULL,
	'charColor' varchar(10) NOT NULL,
	'charGameSeries' varchar(20) NOT NULL,
	--'charDateOrigin' date NOT NULL,
	'gsID' int(10) NOT NULL REFERENCES [GameSeries](gsID),
	PRIMARY KEY ('charID')
	--CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

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

CREATE TABLE IF NOT EXISTS 'Moves' (
	'moveID' int(10) NOT NULL,
	'moveB' varchar(20) NOT NULL,
	'moveUp-B' varchar(20) NOT NULL,
	'moveDown-B' varchar(20) NOT NULL,
	'charID' int(10) NOT NULL REFERENCES [Character] (charID),
	PRIMARY KEY ('moveID')
);

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

CREATE TABLE IF NOT EXISTS 'Items' (
	'itemID' int(10) NOT NULL,
	'itemName' varchar(20) NOT NULL,
	'itemGameSeries' varchar(20) NOT NULL,
	'itemType' char(10) NOT NULL,
	'gsID' int(10) NOT NULL REFERENCES [GameSeries](gsID),
	PRIMARY KEY ('itemID')
	-- CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

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

-- CREATE TABLE IF NOT EXISTS 'Music' (
-- 	'musID' int (10) NOT NULL,
-- 	'musName' varchar(25) NOT NULL,
-- 	'musGameSeries' varchar(20) NOT NULL,
-- 	'musStage' varchar(20) NOT NULL,
-- 	'gsID' int(10) NOT NULL,
-- 	PRIMARY KEY ('musID')
-- 	-- CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
-- )

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

INSERT INTO 'Stages' ('stageID', 'stageName', 'stageGameSeries', 'stageHazard', 'stageViable', 'stageMove', 'gsID') VALUES
(1, 'Peach\'s Castle', 'Super Mario', 'BUMPER', 'UNVIABLE', 'NO', 1),
(2, 'Congo Jungle', 'Donkey Kong', 'CANNON', 'UNVIABLE', 'YES', 2),
(3, 'Hyrule Castle', 'The Legend of Zelda', 'TORNADO', 'UNVIABLE', 3),
-- Check Planet Zebes, might not be FLOOR, might not be YES
(4, 'Planet Zebes', 'Metroid', 'FLOOR', 'UNVIABLE', 'YES', 4),
(5, 'Mushroom Kingdom', 'Super Mario', 'PLATFORMS', 'UNVIABLE', 'NO', 1),
(6, 'Yoshi\'s Island', 'Yoshi', 'CLOUDS', 'UNVIABLE', 'NO', 5),
(7, 'Dream Land', 'Kirby', 'NONE', 'VIABLE', 'NO', 6),
--check Sector Z
(8, 'Sector Z', 'Star Fox', 'BLASTERS', 'UNVIABLE', 'NO', 7),
(9, 'Saffron City', 'Pokemon', 'POKEMON', 'UNVIABLE', 'YES', 8);

INSERT INTO 'Items' ('itemID', 'itemName', 'itemGameSeries', 'gsID') VALUES
--INSERT INTO 'Items' ('itemID', 'itemName', 'itemGameSeries', 'itemType', 'gsID') VALUES
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

INSERT INTO 'Pokeball' ('pokeID', 'pokePKMN', 'pokePkmnType1', 'pokePkmnType2', 'pokeGen', 'pokeGenName', 'itemID') VALUES
(6, 'Charizard', 'FIRE', 'FLYING', 1, 'Kanto', 10),
(9, 'Blaistoise', 'WATER', NULL, 1, 'Kanto', 10),
(15, 'Beedrill', 'BUG', 'FLYING', 1, 'Kanto', 10),
(35, 'Clefairy',)
(52, 'Meowth', 'NORMAL', NULL, 1, 'Kanto', 10),
(95, 'Onix', 'ROCK', NULL, 1, 'Kanto', 10),
(106, 'Hitmonlee', 'FIGHTING', NULL, 1, 'Kanto', 10),
(109, 'Koffing', 'POISING', NULL, 1, 'Kanto', 10),
(113, 'Chansey', 'NORMAL', NULL, 1, 'Kanto', 10),
(118, 'Goldeen', 'WATER', NULL, 1, 'Kanto', 10),
(121, 'Starmie', 'WATER', NULL, 1, 'Kanto', 10),
(143, 'Snorlax', 'NORMAL', NULL, 1, 'Kanto', 10),
(151, 'Mew', 'PSYCHIC', NULL, 1, 'Kanto', 10);






-- 'musID' int (10) NOT NULL,
-- 	'musName' varchar(25) NOT NULL,
-- 	'musGameSeries' varchar(20) NOT NULL,
-- 	'musStage' varchar(20) NOT NULL,
-- 	'gsID' int(10) NOT NULL,
-- INSERT INTO 'Music' ('musID', 'musName', 'musGameSeries', 'musStage', 'gsID') VALUES
-- (1, 'Peach\'s Castle', 'Super Mario', '' )


