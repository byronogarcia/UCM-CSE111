CREATE TABLE IF NOT EXISTS 'Game Series' (
	'gsID' int(10) NOT NULL,
	'gsName' varchar(20) NOT NULL,
	'gsDateOrigin' date NOT NULL,
	PRIMARY KEY ('gsID')
);

CREATE TABLE IF NOT EXISTS 'Character' (
	'charID' int(10) NOT NULL,
	'charName' varchar(20) NOT NULL,
	'charColor' varchar(10) NOT NULL,
	'charGameSeries' varchar(20) NOT NULL,
	--'charDateOrigin' date NOT NULL,
	'gsID' int(10) NOT NULL,
	PRIMARY KEY ('charID')
	CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

/*
INSERT INTO 'character' ('charID', 'charName', 'charColor', 'charGameSeries', 'gsID') VALUES
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
(12, 'Jigglypuff', 'PINK', 'Pokemon', 8);*/

CREATE TABLE IF NOT EXISTS 'Stages' (
	'stageID' int(10) NOT NULL,
	'stageName' varchar(25) NOT NULL,
	'stageGameSeries' varchar(20) NOT NULL,
	'stageHazard' boolean NOT NULL, 
	'stageViable' boolean NOT NULL,
	'stageMove' boolean NOT NULL,
	'gsID' int(10) NOT NULL,
	PRIMARY KEY ('stageID')
	CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

CREATE TABLE IF NOT EXISTS 'Items' (
	'itemID' int(10) NOT NULL,
	'itemName' varchar(20) NOT NULL,
	'itemGameSeries' varchar(20) NOT NULL,
	'itemType' varchar(20) NOT NULL,
	'gsID' int(10) NOT NULL,
	PRIMARY KEY ('itemID')
	CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
);

CREATE TABLE IF NOT EXISTS 'Pokeball' (
	'pokeID' int(10) NOT NULL,
	'pokePkmn' varchar(20) NOT NULL,
	'pokePkmnType1' varchar(15) NOT NULL,
	'pokePkmnType2' varchar(15) NOT NULL,
	'pokeGen' varchar(20) NOT NULL
	'itemID' int(10) NOT NULL,
	PRIMARY KEY ('pokeID')
	CONSTRAINT 'FK2' FOREIGN KEY ('itemID') REFERENCES 'Items'('ID')
);

CREATE TABLE IF NOT EXISTS 'Music' (
	'musID' int (10) NOT NULL,
	'musName' varchar(25) NOT NULL,
	'musGameSeries' varchar(20) NOT NULL,
	'musStage' varchar(20) NOT NULL,
	'gsID' int(10) NOT NULL,
	PRIMARY KEY ('musID')
	CONSTRAINT 'FK2' FOREIGN KEY ('gsID') REFERENCES 'Game Series'('ID')
)



