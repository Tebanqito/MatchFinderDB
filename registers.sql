INSERT INTO equipos (nombre, descripcion, tipo)
VALUES
('Los Tigres', 'Equipo de amigos del barrio', 'FUTBOL_5'),
('Los Galácticos', 'Equipo amateur de fútbol 5', 'FUTBOL_5'),
('Racing del Sur', 'Equipo competitivo de fútbol 11', 'FUTBOL_11'),
('Deportivo Central', 'Equipo amateur de fútbol 11', 'FUTBOL_11');

INSERT INTO usuarios (nombre, email, password, rol, equipo_id)
VALUES
('esteban', 'esteban@gmail.com', '123456', 'OWNER', NULL),

('juan', 'juan@gmail.com', '123456', 'USUARIO',
    (SELECT id FROM equipos WHERE nombre = 'Los Tigres')),

('pedro', 'pedro@gmail.com', '123456', 'USUARIO',
    (SELECT id FROM equipos WHERE nombre = 'Los Tigres')),

('lucas', 'lucas@gmail.com', '123456', 'USUARIO',
    (SELECT id FROM equipos WHERE nombre = 'Los Galácticos')),

('martin', 'martin@gmail.com', '123456', 'USUARIO',
    (SELECT id FROM equipos WHERE nombre = 'Racing del Sur')),

('facundo', 'facundo@gmail.com', '123456', 'USUARIO',
    (SELECT id FROM equipos WHERE nombre = 'Deportivo Central'));

INSERT INTO solicitudes_amistad
(remitente_id, destinatario_id, estado)
VALUES
(
    (SELECT id FROM usuarios WHERE nombre = 'juan'),
    (SELECT id FROM usuarios WHERE nombre = 'pedro'),
    'PENDIENTE'
),
(
    (SELECT id FROM usuarios WHERE nombre = 'lucas'),
    (SELECT id FROM usuarios WHERE nombre = 'juan'),
    'PENDIENTE'
);

INSERT INTO solicitudes_amistad
(remitente_id, destinatario_id, estado)
VALUES
(
    (SELECT id FROM usuarios WHERE nombre = 'martin'),
    (SELECT id FROM usuarios WHERE nombre = 'facundo'),
    'ACEPTADA'
);

INSERT INTO amistades (usuario_id, amigo_id)
VALUES
(
    (SELECT id FROM usuarios WHERE nombre = 'martin'),
    (SELECT id FROM usuarios WHERE nombre = 'facundo')
);

INSERT INTO amistades (usuario_id, amigo_id)
VALUES
(
    (SELECT id FROM usuarios WHERE nombre = 'facundo'),
    (SELECT id FROM usuarios WHERE nombre = 'martin')
);

CREATE UNIQUE INDEX uq_un_torneo_activo
ON torneos ((1))
WHERE estado = 'ACTIVO';

INSERT INTO torneos
(nombre, tipo, cantidad_equipos, estado)
VALUES
(
    'Copa MatchFinder',
    'FUTBOL_5',
    2,
    'ACTIVO'
);

INSERT INTO torneo_equipos (torneo_id, equipo_id)
VALUES
(
    (SELECT id FROM torneos WHERE nombre = 'Copa MatchFinder'),
    (SELECT id FROM equipos WHERE nombre = 'Los Tigres')
),
(
    (SELECT id FROM torneos WHERE nombre = 'Copa MatchFinder'),
    (SELECT id FROM equipos WHERE nombre = 'Los Galácticos')
);

INSERT INTO partidos
(torneo_id, equipo_uno_id, equipo_dos_id, ganador_id)
VALUES
(
    (SELECT id FROM torneos WHERE nombre = 'Copa MatchFinder'),

    (SELECT id FROM equipos WHERE nombre = 'Los Tigres'),

    (SELECT id FROM equipos WHERE nombre = 'Los Galácticos'),

    (SELECT id FROM equipos WHERE nombre = 'Los Tigres')
);