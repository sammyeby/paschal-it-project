DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS StaffMemberRole;
DROP TABLE IF EXISTS StaffMember;
DROP TABLE IF EXISTS CupCompetitionClub;
DROP TABLE IF EXISTS FootballLeagueClub;
DROP TABLE IF EXISTS LeagueManagement;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS CountryOfOrigin;
DROP TABLE IF EXISTS CupCompetition;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS FootballLeague;

DROP SCHEMA IF EXISTS football;
CREATE SCHEMA IF NOT EXISTS football;
USE football;

CREATE TABLE football.FootballLeague(
footballLeagueId int PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE,
revenue int
);

CREATE TABLE football.Club(
clubId int PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE,
houseNumber varchar(20) NOT NULL,
city varchar(100) NOT NULL,
street varchar(100) NOT NULL,
postalCode varchar(100) NOT NULL
);

CREATE TABLE football.CupCompetition(
cupCompetitionId int PRIMARY KEY,
name varchar(50) NOT NULL,
startDate date NOT NULL,
endDate date,
CONSTRAINT UQ_CupCompetition UNIQUE(name,startDate)
);

CREATE TABLE football.CountryOfOrigin(
countryOfOriginId int PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE
);

CREATE TABLE football.Role(
roleId int PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE
);

CREATE TABLE football.LeagueManagement(
leagueManagementId int PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE,
footballLeagueId int,
CONSTRAINT FK_LeagueManagement_FootballLeague FOREIGN KEY(footballLeagueId)
REFERENCES FootballLeague(footballLeagueId)
);

CREATE TABLE football.FootballLeagueClub(
clubId int,
footballLeagueId int,
CONSTRAINT PK_FootballLeagueClub PRIMARY KEY (clubId,footballLeagueId),
CONSTRAINT FK_FootballLeagueClub_Club FOREIGN KEY (clubId)
REFERENCES Club(clubId),
CONSTRAINT FK_FootballLeagueClub_FootballLeague FOREIGN KEY (footballLeagueId)
REFERENCES FootballLeague(footballLeagueId)
);

CREATE TABLE football.CupCompetitionClub(
clubId int,
cupCompetitionId int,
CONSTRAINT PK_CupCompetitionClub PRIMARY KEY(clubId,cupCompetitionId),
CONSTRAINT FK_cupCompetionClub_CupCompetition FOREIGN KEY(cupCompetitionId)
REFERENCES CupCompetition(cupCompetitionId),
CONSTRAINT FK_cupCompetionClub_Club FOREIGN KEY(clubId)
REFERENCES Club(clubId)
);

CREATE TABLE football.StaffMember(
staffMemberId int PRIMARY KEY,
firstName varchar(100) NOT NULL,
secondName varchar(100) NOT NULL,
clubId int NOT NULL,
CONSTRAINT FK_StaffMember_Club FOREIGN KEY(clubId)
REFERENCES Club(clubId)
);

CREATE TABLE football.StaffMemberRole(
roleId int,
staffMemberId int,
CONSTRAINT PK_StaffMemberRole PRIMARY KEY(roleId,staffMemberId),
CONSTRAINT FK_StaffMemberRole_Role FOREIGN KEY(roleId)
REFERENCES Role(roleId),
CONSTRAINT FK_StaffMemberRole_StaffMember FOREIGN KEY (staffMemberId)
REFERENCES StaffMember(staffMemberId)
);

CREATE TABLE football.Player(
playerId int PRIMARY KEY,
firstName varchar(100) NOT NULL,
surName varchar(100) NOT NULL,
address varchar(100),
dateOfBirth date NOT NULL,
municipality varchar(100) NOT NULL,
countryOfOriginId int NOT NULL,
clubId int NOT NULL,
CONSTRAINT UQ_Player UNIQUE(firstName,surName,dateOfBirth),
CONSTRAINT FK_Player_CountryOfOrigin FOREIGN KEY(countryOfOriginId)
REFERENCES CountryOfOrigin(countryOfOriginId),
CONSTRAINT FK_Player_Club FOREIGN KEY(clubId)
REFERENCES Club(clubId)
);

INSERT INTO FootballLeague (footballLeagueId, name, revenue) VALUES
(1, 'Premier League', 500000000.00),
(2, 'La Liga', 400000000.00),
(3, 'Bundesliga', 300000000.00),
(4, 'Serie A', NULL),
(5, 'Ligue 1', 200000000.00),
(6, 'Eredivisie', NULL),
(7, 'Primeira Liga', 100000000.00),
(8, 'Russian Premier League', NULL),
(9, 'Scottish Premiership', 80000000.00),
(10, 'Major League Soccer', 150000000.00),
(11, 'Brasileirão Série A', NULL),
(12, 'Argentine Primera División', 120000000.00),
(13, 'Chinese Super League', NULL),
(14, 'J1 League', 90000000.00),
(15, 'Australian A-League', NULL),
(16, 'Mexican Liga MX', 180000000.00);

INSERT INTO club (clubId, name, houseNumber, city, street, postalCode) VALUES
(1, 'Manchester United', '123', 'Manchester', 'Old Trafford', 'M16 0RA'),
(2, 'Real Madrid', '456', 'Madrid', 'Santiago Bernabeu', '28036'),
(3, 'Bayern Munich', '789', 'Munich', 'Allianz Arena', '80939'),
(4, 'AC Milan', '101', 'Milan', 'San Siro', '20151'),
(5, 'Paris Saint-Germain', '234', 'Paris', 'Parc des Princes', '75016'),
(6, 'Ajax', '567', 'Amsterdam', 'Johan Cruyff Arena', '1101 DJ'),
(7, 'Porto', '890', 'Porto', 'Estádio do Dragão', '4350-415'),
(8, 'CSKA Moscow', '111', 'Moscow', 'VEB Arena', '111141'),
(9, 'Celtic', '222', 'Glasgow', 'Celtic Park', 'G40 3RE'),
(10, 'LA Galaxy', '333', 'Los Angeles', 'Dignity Health Sports Park', '90746'),
(11, 'Flamengo', '444', 'Rio de Janeiro', 'Maracanã', '20271-130'),
(12, 'Boca Juniors', '555', 'Buenos Aires', 'La Bombonera', '1165'),
(13, 'Shanghai SIPG', '666', 'Shanghai', 'Shanghai Stadium', '200030'),
(14, 'Urawa Reds', '777', 'Saitama', 'Saitama Stadium', '330-0081'),
(15, 'Melbourne Victory', '888', 'Melbourne', 'Marvel Stadium', '3000');

INSERT INTO CountryOfOrigin (countryOfOriginId, name) VALUES
(1, 'England'),
(2, 'Spain'),
(3, 'Germany'),
(4, 'Italy'),
(5, 'France'),
(6, 'Netherlands'),
(7, 'Portugal'),
(8, 'Russia'),
(9, 'Scotland'),
(10, 'United States'),
(11, 'Brazil'),
(12, 'Argentina'),
(13, 'China'),
(14, 'Japan'),
(15, 'Australia'),
(16, 'South Korea'),
(17, 'Mexico'),
(18, 'Sweden'),
(19, 'Norway'),
(20, 'Canada'),
(21, 'India'),
(22, 'South Africa');

INSERT INTO CupCompetition (cupCompetitionId, name, startDate, endDate) VALUES
(1, 'FIFA World Cup', '2022-11-21', '2022-12-18'),
(2, 'UEFA Champions League', '2023-02-14', '2023-05-29'),
(3, 'Copa America', '2023-06-13', '2023-07-10'),
(4, 'AFC Asian Cup', '2023-01-05', '2023-01-30'),
(5, 'CONCACAF Gold Cup', '2023-07-02', '2023-07-25'),
(6, 'Africa Cup of Nations', '2023-01-09', '2023-02-06'),
(7, 'Copa del Rey', '2023-08-15', '2023-04-30'),
(8, 'DFB-Pokal', '2023-08-21', '2023-05-13'),
(9, 'Coppa Italia', '2023-08-28', '2023-05-20'),
(10, 'FA Cup', '2023-09-02', '2023-05-27'),
(11, 'CAF Champions League', '2023-09-10', '2023-05-26'),
(12, 'AFC Champions League', '2023-08-30', '2023-11-23'),
(13, 'Copa Libertadores', '2023-02-07', '2023-11-30'),
(14, 'MLS Cup', '2023-12-01', '2023-12-10'),
(15, 'FIFA Club World Cup', '2023-12-12', NULL);

INSERT INTO Role (roleId, name) VALUES
(1, 'Manager'),
(2, 'Assistant Manager'),
(3, 'Head Coach'),
(4, 'Goalkeeping Coach'),
(5, 'Defensive Coach'),
(6, 'Midfield Coach'),
(7, 'Striker Coach'),
(8, 'Fitness Coach'),
(9, 'Team Doctor'),
(10, 'Physiotherapist'),
(11, 'Sports Scientist'),
(12, 'Head Scout'),
(13, 'Scout'),
(14, 'Kit Manager'),
(15, 'Academy Director');

INSERT INTO CupCompetitionClub (clubId, cupCompetitionId) VALUES
(1, 1),  -- FIFA World Cup - Manchester United
(1, 2),  -- FIFA World Cup - Real Madrid
(2, 3),  -- UEFA Champions League - Bayern Munich
(2, 4),  -- UEFA Champions League - AC Milan
(3, 5),  -- Copa America - Paris Saint-Germain
(3, 6),  -- Copa America - Ajax
(4, 7),  -- AFC Asian Cup - Porto
(4, 8),  -- AFC Asian Cup - CSKA Moscow
(5, 9),  -- CONCACAF Gold Cup - Celtic
(5, 10), -- CONCACAF Gold Cup - LA Galaxy
(6, 11), -- Africa Cup of Nations - Flamengo
(6, 12), -- Africa Cup of Nations - Boca Juniors
(7, 13), -- Copa del Rey - Shanghai SIPG
(7, 14), -- Copa del Rey - Urawa Reds
(8, 15); -- DFB-Pokal - Melbourne Victory

INSERT INTO FootballLeagueClub (footballLeagueId, clubId) VALUES
(1, 1),  -- Premier League - Manchester United
(1, 2),  -- Premier League - Real Madrid
(2, 3),  -- La Liga - Bayern Munich
(2, 4),  -- La Liga - AC Milan
(3, 5),  -- Bundesliga - Paris Saint-Germain
(3, 6),  -- Bundesliga - Ajax
(4, 7),  -- Serie A - Porto
(4, 8),  -- Serie A - CSKA Moscow
(5, 9),  -- Ligue 1 - Celtic
(5, 10), -- Ligue 1 - LA Galaxy
(6, 11), -- Eredivisie - Flamengo
(6, 12), -- Eredivisie - Boca Juniors
(7, 13), -- Primeira Liga - Shanghai SIPG
(7, 14), -- Primeira Liga - Urawa Reds
(8, 15); -- Russian Premier League - Melbourne Victory

INSERT INTO LeagueManagement (leagueManagementId, name, footballLeagueId) VALUES
(1, 'Premier League Management', 1),
(2, 'La Liga Management', 2),
(3, 'Bundesliga Management', 3),
(4, 'Unspecified League Management 1', NULL),
(5, 'Serie A Management', 4),
(6, 'Ligue 1 Management', 5),
(7, 'Eredivisie Management', 6),
(8, 'Unspecified League Management 2', NULL),
(9, 'Primeira Liga Management', 7),
(10, 'Russian Premier League Management', 8),
(11, 'Unspecified League Management 3', NULL),
(12, 'Scottish Premiership Management', 9),
(13, 'Major League Soccer Management', 10),
(14, 'Brasileirão Série A Management', 11),
(15, 'Unspecified League Management 4', NULL);

INSERT INTO Player (playerId, firstName, surName, address, dateOfBirth, municipality, countryOfOriginId, clubId) VALUES
(1, 'Lionel', 'Messi', '123 Main St', '1987-06-24', 'Barcelona', 11, 1),
(2, 'Cristiano', 'Ronaldo', '456 Oak Ave', '1985-02-05', 'Lisbon', 4, 2),
(3, 'Neymar', 'Jr', '789 Pine Rd', '1992-02-05', 'Santos', 11, 5),
(4, 'Kylian', 'Mbappé', NULL, '1998-12-20', 'Bondy', 5, 6),
(5, 'Robert', 'Lewandowski', '101 Cedar Blvd', '1988-08-21', 'Warsaw', 3, 3),
(6, 'Mohamed', 'Salah', '222 Spruce Ln', '1992-06-15', 'Nagrig', 19, 4),
(7, 'Kevin', 'De Bruyne', NULL, '1991-06-28', 'Drongen', 1, 7),
(8, 'Harry', 'Kane', '333 Elm St', '1993-07-28', 'London', 1, 8),
(9, 'Luka', 'Modric', '444 Birch Ave', '1985-09-09', 'Zadar', 21, 2),
(10, 'Sadio', 'Mane', '555 Oak St', '1992-04-10', 'Bambali', 19, 5),
(11, 'Erling', 'Haaland', '666 Maple Rd', '2000-07-21', 'Leeds', 22, 9),
(12, 'Bruno', 'Fernandes', '777 Pine Ln', '1994-09-08', 'Maia', 7, 10),
(13, 'Gianluigi', 'Donnarumma', NULL, '1999-02-25', 'Castellammare di Stabia', 4, 4),
(14, 'Joshua', 'Kimmich', '888 Cedar Rd', '1995-02-08', 'Rottweil', 3, 11),
(15, 'Vinícius', 'Júnior', '999 Elm Ave', '2000-07-12', 'São Gonçalo', 11, 6);

INSERT INTO StaffMember (staffMemberId, firstName, secondName, clubId) VALUES
(1, 'Alex', 'Ferguson', 1),
(2, 'Zinedine', 'Zidane', 2),
(3, 'Pep', 'Guardiola', 3),
(4, 'Jurgen', 'Klopp', 4),
(5, 'Carlo', 'Ancelotti', 5),
(6, 'Erik', 'Ten Hag', 6),
(7, 'Sergio', 'Conceição', 7),
(8, 'Igor', 'Tudor', 8),
(9, 'Steven', 'Gerrard', 9),
(10, 'Greg', 'Vanney', 10),
(11, 'Renato', 'Portaluppi', 11),
(12, 'Marcelo', 'Gallardo', 12),
(13, 'Antonio', 'Conte', 4),
(14, 'Hansi', 'Flick', 3),
(15, 'Diego', 'Simeone', 13);

INSERT INTO StaffMemberRole (staffMemberId, roleId) VALUES
(1, 1),  -- Alex Ferguson - Manager
(2, 2),  -- Zinedine Zidane - Assistant Manager
(3, 3),  -- Pep Guardiola - Head Coach
(4, 4),  -- Jurgen Klopp - Goalkeeping Coach
(5, 5),  -- Carlo Ancelotti - Defensive Coach
(6, 6),  -- Erik Ten Hag - Midfield Coach
(7, 7),  -- Sergio Conceição - Striker Coach
(8, 8),  -- Igor Tudor - Fitness Coach
(9, 9),  -- Steven Gerrard - Team Doctor
(10, 10), -- Greg Vanney - Physiotherapist
(11, 11), -- Renato Portaluppi - Sports Scientist
(12, 12), -- Marcelo Gallardo - Head Scout
(13, 13), -- Antonio Conte - Scout
(14, 14), -- Hansi Flick - Kit Manager
(15, 15); -- Diego Simeone - Academy Director