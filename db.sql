CREATE DATABASE MatchFinderDB;
USE MatchFinderDB;

CREATE TABLE User (
    idUser INT AUTO_INCREMENT PRIMARY KEY,
    useName VARCHAR(100) NOT NULL,
    userEmail VARCHAR(150) NOT NULL UNIQUE,
    userPassword VARCHAR(255) NOT NULL
);

CREATE TABLE Team5 (
    idTeam INT AUTO_INCREMENT PRIMARY KEY,
    idAdmin INT NOT NULL,
    teamName VARCHAR(100) NOT NULL,
    teamDescription TEXT,

    idPlayer2 INT,
    idPlayer3 INT,
    idPlayer4 INT,

    FOREIGN KEY (idAdmin) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer2) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer3) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer4) REFERENCES User(idUser)
);

CREATE TABLE Team11 (
    idTeam INT AUTO_INCREMENT PRIMARY KEY,
    idAdmin INT NOT NULL,
    teamName VARCHAR(100) NOT NULL,
    teamDescription TEXT,

    idPlayer2 INT,
    idPlayer3 INT,
    idPlayer4 INT,
    idPlayer5 INT,
    idPlayer6 INT,
    idPlayer7 INT,
    idPlayer8 INT,
    idPlayer9 INT,
    idPlayer10 INT,
    idPlayer11 INT,

    FOREIGN KEY (idAdmin) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer2) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer3) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer4) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer5) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer6) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer7) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer8) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer9) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer10) REFERENCES User(idUser),
    FOREIGN KEY (idPlayer11) REFERENCES User(idUser)
);

CREATE TABLE Friend (
    idUser INT NOT NULL,
    idFriend INT NOT NULL,

    PRIMARY KEY (idUser, idFriend),

    FOREIGN KEY (idUser) REFERENCES User(idUser),
    FOREIGN KEY (idFriend) REFERENCES User(idUser)
);

CREATE TABLE Request (
    idRequest INT AUTO_INCREMENT PRIMARY KEY,
    idSender INT NOT NULL,
    idReceiver INT NOT NULL,
    requestStatus BOOLEAN DEFAULT FALSE,
    requestDescription TEXT,
    FOREIGN KEY (idSender) REFERENCES User(idUser),
    FOREIGN KEY (idReceiver) REFERENCES User(idUser)
);

CREATE TABLE MatchTable (
    idMatch INT AUTO_INCREMENT PRIMARY KEY,
    idTeam1 INT NOT NULL,
    idTeam2 INT
);

CREATE TABLE Tournament (
    idTournament INT AUTO_INCREMENT PRIMARY KEY,
    teamsQuantity INT NOT NULL,
    tournamentType VARCHAR(50) NOT NULL
);

CREATE TABLE TournamentMatch (
    idMatch INT NOT NULL,
    idTournament INT NOT NULL,
    
    PRIMARY KEY (idMatch, idTournament),
    
    FOREIGN KEY (idMatch) REFERENCES MatchTable(idMatch),
    FOREIGN KEY (idTournament) REFERENCES Tournament(idTournament)
);