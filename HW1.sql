DROP DATABASE IF EXISTS Playerstats;

CREATE DATABASE PlayerStats;

DROP TABLE IF EXISTS Playerstats.StatTypes;
CREATE TABLE Playerstats.StatTypes(
	StatCode VARCHAR(3) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(StatCode)
);

DROP TABLE IF EXISTS Playerstats.Positions;
CREATE TABLE Playerstats.Positions(
	PositionCode VARCHAR(2) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(PositionCode)
);

DROP TABLE IF EXISTS PlayerStats.Players;
CREATE TABLE PlayerStats.Players(
	Id INTEGER NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Num INTEGER NOT NULL,
    PositionCode VARCHAR(2) NOT NULL,
    
    FOREIGN KEY(PositionCode) REFERENCES Playerstats.Positions(PositionCode),
    PRIMARY KEY(Id)
);

DROP TABLE IF EXISTS PlayerStats.Tournaments;
CREATE TABLE PlayerStats.Tournaments(
	Id INTEGER NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(Id)
);

DROP TABLE IF EXISTS PlayerStats.Matches;
CREATE TABLE PlayerStats.Matches(
	Id INTEGER NOT NULL AUTO_INCREMENT,
    MatchDate DATE,
    TournamentId INTEGER NOT NULL,
    
    FOREIGN KEY(TournamentId) REFERENCES PlayerStats.Tournaments(Id),
    PRIMARY KEY(Id)
);

DROP TABLE IF EXISTS PlayerStats.MatchStats;
CREATE TABLE PlayerStats.MatchStats(
	Id INTEGER NOT NULL AUTO_INCREMENT,
    MatchId INTEGER NOT NULL,
    PlayerId INTEGER NOT NULL,
    EventMinute TIME NOT NULL,
    StatCode VARCHAR(3) NOT NULL,
    
    FOREIGN KEY(MatchId) REFERENCES PlayerStats.Matches(Id),
    FOREIGN KEY(PlayerId) REFERENCES PlayerStats.Players(Id),
    FOREIGN KEY(StatCode) REFERENCES PlayerStats.StatTypes(StatCode),
    
    PRIMARY KEY(Id)
);

-- StatType input
INSERT INTO PlayerStats.StatTypes
VALUES("G", "Гол");

INSERT INTO PlayerStats.StatTypes
VALUES("A", "Асистенция");

INSERT INTO PlayerStats.StatTypes
VALUES("R", "Червен картон");

INSERT INTO PlayerStats.StatTypes
VALUES("Y", "Жълт картон");

INSERT INTO PlayerStats.StatTypes
VALUES("OG", "Автогол");

INSERT INTO PlayerStats.StatTypes
VALUES("IN", "Смяна влиза");

INSERT INTO PlayerStats.StatTypes
VALUES("OUT", "Смяна излиза");

-- Position input

INSERT INTO Playerstats.Positions
VALUES("GK", "Вратар");

INSERT INTO Playerstats.Positions
VALUES("RB", "Десен защитник");

INSERT INTO Playerstats.Positions
VALUES("LB", "Ляв защитник");

INSERT INTO Playerstats.Positions
VALUES("CB", "Централен защитник");

INSERT INTO Playerstats.Positions
VALUES("RM", "Десен полузащитник");

INSERT INTO Playerstats.Positions
VALUES("LM", "Ляв полузащитник");

INSERT INTO Playerstats.Positions
VALUES("CM", "Полузащитник");

INSERT INTO Playerstats.Positions
VALUES("CF", "Централен нападател");


-- PlayerStats.Players Input
INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Ivaylo Trifonov", 1, "GK");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Valko Trifonov", 2, "RB");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Ognyan Yanev", 3, "CB");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Zahary Dragomirov", 4, "CB");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Bozhidar Chilikov", 5, "LB");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Timotei Zahariev", 6, "CM");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Marin Valentinov", 7, "CM");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Mitre Cvetkov", 99, "CF");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Zlatko Genov", 9, "CF");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Matey Goranov", 10, "RM");

INSERT INTO PlayerStats.Players (Name, Num, PositionCode)
VALUES("Sergei Zhivkov", 11, "LM");


-- PlayerStats.Tournaments Input
INSERT INTO PlayerStats.Tournaments(Name)
VALUES ("Шампионска лига");

INSERT INTO PlayerStats.Tournaments(Name)
VALUES ("Първа лига");

INSERT INTO PlayerStats.Tournaments(Name)
VALUES ("Купа на България");

INSERT INTO PlayerStats.Tournaments(Name)
VALUES ("Суперкупа на България");


-- PlayerStats.Matches Input
INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2017-04-08", 2);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2017-04-13", 2);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2017-04-21", 2);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2017-04-28", 2);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2017-05-06", 2);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2017-05-11", 2);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2016-09-21", 3);

INSERT INTO PlayerStats.Matches(MatchDate, TournamentId)
VALUES ("2016-10-26", 3);


-- PlayerStats.MachStats
INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(8, 9, "00:14:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(8, 8, "00:14:00", "A");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(8, 3, "00:43:00", "Y");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(7, 2, "00:28:00", "Y");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(7, 10, "00:45:00", "Y");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(7, 10, "01:15", "R");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(1, 10, "00:23:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(1, 9, "00:23:00", "A");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(1, 9, "00:43:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(2, 4, "00:33:00", "OG");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(2, 9, "01:18", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(2, 1, "01:18", "A");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(3, 3, "00:35:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(3, 4, "00:35:00", "A");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(3, 8, "00:55:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(3, 11, "00:55:00", "A");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(4, 3, "00:09:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(4, 8, "00:09:00", "G");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(4, 8, "00:56:00", "OG");

INSERT INTO PlayerStats.MatchStats(MatchId, PlayerId, EventMinute, StatCode)
VALUES(5, 8, "01:15", "G");


-- заявка за името и номера на фланелката на всички защитници от отбора
SELECT Name, Num
FROM PlayerStats.Players
WHERE PositionCode="RB" OR PositionCode="LB" OR PositionCode="CB";

-- заявка за мачовете на отбора през месец април 2017 г. с две колони: дата на мача и име на турнира
SELECT m.MatchDate, t.Name
FROM PlayerStats.Matches AS m
INNER JOIN PlayerStats.Tournaments AS t
ON m.TournamentId=t.Id AND MONTH(m.MatchDate)="04" AND YEAR(m.MatchDate)="2017";

/* заявка за статистиките на играч с номер на фланелката 99 със следните колони:
	Дата на мача
	Име на играча
	Номер на фланелката на играча
	Минута на събитието
	Четимият текст за събитието в мача
*/
SELECT m.MatchDate, p.Name, p.Num, ms.EventMinute, st.Name
FROM PlayerStats.Players AS p
INNER JOIN PlayerStats.MatchStats AS ms
ON p.Id=ms.PlayerId AND p.Num=99
INNER JOIN PlayerStats.Matches AS m
ON ms.MatchId = m.Id
INNER JOIN PlayerStats.StatTypes AS st
ON ms.StatCode = st.StatCode;


-- заявка за общия брой автоголове на отбора
SELECT COUNT(*) AS `Goals`
FROM PlayerStats.MatchStats AS ms
WHERE ms.StatCode="OG";


/*
	заявка за броя на вкараните голове във всеки един мач преди 2017-05-01, в който е вкаран поне 1 гол, със следните колони:
	Дата на мача
	Брой вкарани голове в този мач
*/
SELECT m.MatchDate, COUNT(*) AS `Goals`
FROM PlayerStats.Matches AS m
INNER JOIN PlayerStats.MatchStats AS ms
ON (ms.StatCode="G" OR ms.StatCode="OG") AND m.Id = ms.MatchId
GROUP BY
m.MatchDate;


/*
	заявка за броя на головете според позицията на играчите със следните колони:
	Позиция в отбора като четим текст
	Брой вкарани голове от играчи на тази позиция
*/
SELECT pstn.Name, COUNT(ms.StatCode) AS `Goals`
FROM PlayerStats.Players AS p
LEFT JOIN PlayerStats.MatchStats AS ms
ON ms.PlayerId = p.ID AND (ms.StatCode="G" OR ms.StatCode="OG")
LEFT JOIN PlayerStats.Positions AS pstn
ON pstn.PositionCode=p.PositionCode
GROUP BY pstn.Name;


/*
	заявка за общия брой на картоните (жълти и червени) за всеки играч, който има такива, сортирана по брой картони в низходящ ред, със следните колони:
	Име на играча
	Номер на фланелката на играча
	Позиция в отбора като четим текст
	Брой получени картони
*/
SELECT p.Name, p.Num, pstn.Name, COUNT(ms.StatCode) AS `Cards`
FROM PlayerStats.Players AS p
LEFT JOIN PlayerStats.MatchStats AS ms
ON ms.PlayerId = p.ID AND (ms.StatCode="R" OR ms.StatCode="Y")
LEFT JOIN PlayerStats.Positions AS pstn
ON pstn.PositionCode=p.PositionCode
GROUP BY pstn.Name;
