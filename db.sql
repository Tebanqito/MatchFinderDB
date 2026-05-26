CREATE DATABASE tournament_db;
USE tournament_db;

CREATE TABLE User (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(150) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL
);

CREATE TABLE Team_5 (
    id_team INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT NOT NULL,
    team_name VARCHAR(100) NOT NULL,
    team_description TEXT,

    id_player2 INT,
    id_player3 INT,
    id_player4 INT,

    FOREIGN KEY (id_admin) REFERENCES User(id_user),
    FOREIGN KEY (id_player2) REFERENCES User(id_user),
    FOREIGN KEY (id_player3) REFERENCES User(id_user),
    FOREIGN KEY (id_player4) REFERENCES User(id_user)
);

CREATE TABLE Team_11 (
    id_team INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT NOT NULL,
    team_name VARCHAR(100) NOT NULL,
    team_description TEXT,

    id_player2 INT,
    id_player3 INT,
    id_player4 INT,
    id_player5 INT,
    id_player6 INT,
    id_player7 INT,
    id_player8 INT,
    id_player9 INT,
    id_player10 INT,

    FOREIGN KEY (id_admin) REFERENCES User(id_user),
    FOREIGN KEY (id_player2) REFERENCES User(id_user),
    FOREIGN KEY (id_player3) REFERENCES User(id_user),
    FOREIGN KEY (id_player4) REFERENCES User(id_user),
    FOREIGN KEY (id_player5) REFERENCES User(id_user),
    FOREIGN KEY (id_player6) REFERENCES User(id_user),
    FOREIGN KEY (id_player7) REFERENCES User(id_user),
    FOREIGN KEY (id_player8) REFERENCES User(id_user),
    FOREIGN KEY (id_player9) REFERENCES User(id_user),
    FOREIGN KEY (id_player10) REFERENCES User(id_user)
);

CREATE TABLE Friend (
    id_user INT NOT NULL,
    id_friend INT NOT NULL,

    PRIMARY KEY (id_user, id_friend),

    FOREIGN KEY (id_user) REFERENCES User(id_user),
    FOREIGN KEY (id_friend) REFERENCES User(id_user)
);

CREATE TABLE Request (
    id_request INT AUTO_INCREMENT PRIMARY KEY,
    request_status VARCHAR(50) NOT NULL,
    request_description TEXT
);

CREATE TABLE Match_Table (
    id_match INT AUTO_INCREMENT PRIMARY KEY,
    id_team1 INT NOT NULL,
    id_team2 INT NOT NULL
);

CREATE TABLE Tournament (
    id_tournament INT AUTO_INCREMENT PRIMARY KEY,
    teams_quantity INT NOT NULL,
    tournament_type VARCHAR(50) NOT NULL
);

CREATE TABLE Tournament_match (
    id_match INT NOT NULL,
    id_tournament INT NOT NULL,
    id_team1 INT NOT NULL,
    id_team2 INT NOT NULL,

    PRIMARY KEY (id_match, id_tournament),

    FOREIGN KEY (id_match) REFERENCES Match_Table(id_match),
    FOREIGN KEY (id_tournament) REFERENCES Tournament(id_tournament)
);