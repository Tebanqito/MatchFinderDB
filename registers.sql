INSERT INTO User (useNme, userEmail, userPassword) VALUES
('Carlos García', 'carlos@gmail.com', 'hashed_password_1'),
('María López', 'maria@gmail.com', 'hashed_password_2'),
('Juan Pérez', 'juan@gmail.com', 'hashed_password_3'),
('Ana Martínez', 'ana@gmail.com', 'hashed_password_4'),
('Luis Rodríguez', 'luis@gmail.com', 'hashed_password_5');

INSERT INTO Team5 (idAdmin, teamName, teamDescription) VALUES
(1, 'Los Tigres', 'Equipo de fútbol 5 del barrio'),
(2, 'Las Águilas', 'Equipo competitivo de fútbol 5');

INSERT INTO Team11 (idAdmin, teamName, teamDescription) VALUES
(3, 'Real Buenos Aires', 'Equipo de fútbol 11 amateur'),
(4, 'Atlético Sur', 'Equipo de fútbol 11 de la liga local');

UPDATE Team5 SET idPlayer2 = 2 WHERE idTeam = 1;
UPDATE Team5 SET idPlayer3 = 3 WHERE idTeam = 1;
UPDATE Team5 SET idPlayer4 = 4 WHERE idTeam = 1;

UPDATE Team11 SET idPlayer2 = 1 WHERE idTeam = 1;
UPDATE Team11 SET idPlayer3 = 2 WHERE idTeam = 1;
UPDATE Team11 SET idPlayer4 = 3 WHERE idTeam = 1;
UPDATE Team11 SET idPlayer5 = 4 WHERE idTeam = 1;
UPDATE Team11 SET idPlayer6 = 5 WHERE idTeam = 1;

INSERT INTO Friend (idUser, idFriend) VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO Request (idSender, idReceiver, requestDescription) VALUES
(1, 4, 'Quiero agregarte como amigo'),
(2, 5, 'Te invito a unirte a mi equipo'),
(3, 1, 'Solicitud de amistad');

INSERT INTO MatchTable (idTeam1, idTeam2) VALUES
(1, 2),
(3, 4);

INSERT INTO MatchTable (idTeam1, idTeam2) VALUES (1, NULL);

INSERT INTO Tournament (teamsQuantity, tournamentType) VALUES
(8, 'Eliminación directa'),
(4, 'Liga'),
(16, 'Copa');

INSERT INTO TournamentMatch (idMatch, idTournament) VALUES
(1, 1),
(2, 1),
(1, 2);