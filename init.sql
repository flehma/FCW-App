USE database;

-- init all tables
CREATE TABLE IF NOT EXISTS kader (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS spieltag (
    spielerId INT NOT NULL UNIQUE,
    FOREIGN KEY (spielerID) REFERENCES kader(id)
);

CREATE TABLE IF NOT EXISTS training (
    spielerId INT NOT NULL UNIQUE,
    FOREIGN KEY (spielerID) REFERENCES kader(id)
);

CREATE TABLE IF NOT EXISTS tunnel (
    spielerId INT NOT NULL UNIQUE,
    tunnel INT,
    FOREIGN KEY (spielerID) REFERENCES kader(id)
);

CREATE TABLE IF NOT EXISTS material (
    spielerId INT,
    flaschen INT,
    musikbox INT,
    bälle INT,
    jacken INT,
    FOREIGN KEY (spielerID) REFERENCES kader(id)
);

INSERT INTO `kader` (`id`, `name`) VALUES (1, 'Boy Bröckler');
INSERT INTO `kader` (`id`, `name`) VALUES (2, 'Dominic Günther');
INSERT INTO `kader` (`id`, `name`) VALUES (3, 'Fabian Lehmann');
INSERT INTO `kader` (`id`, `name`) VALUES (4, 'Falk Jörns-Anders');
INSERT INTO `kader` (`id`, `name`) VALUES (5, 'Finn Bargiel');
INSERT INTO `kader` (`id`, `name`) VALUES (6, 'Hauke Güntrath-Lorenzen');
INSERT INTO `kader` (`id`, `name`) VALUES (7, 'Jakob Lange');
INSERT INTO `kader` (`id`, `name`) VALUES (8, 'Jan Lindhorst');
INSERT INTO `kader` (`id`, `name`) VALUES (9, 'Jan Pohlke');
INSERT INTO `kader` (`id`, `name`) VALUES (10, 'Joe Hoffmann');
INSERT INTO `kader` (`id`, `name`) VALUES (11, 'Kevin Raabe');
INSERT INTO `kader` (`id`, `name`) VALUES (12, 'Kim Bischoff');
INSERT INTO `kader` (`id`, `name`) VALUES (13, 'Kjell Boiesen');
INSERT INTO `kader` (`id`, `name`) VALUES (14, 'Lasse Assenheimer');
INSERT INTO `kader` (`id`, `name`) VALUES (15, 'Lasse Petersen');
INSERT INTO `kader` (`id`, `name`) VALUES (16, 'Mads Möller');
INSERT INTO `kader` (`id`, `name`) VALUES (17, 'Malte Klang');
INSERT INTO `kader` (`id`, `name`) VALUES (18, 'Mattes Nissen');
INSERT INTO `kader` (`id`, `name`) VALUES (19, 'Mick Degering');
INSERT INTO `kader` (`id`, `name`) VALUES (20, 'Nik Plöger');
INSERT INTO `kader` (`id`, `name`) VALUES (21, 'Ole Kreuter');
INSERT INTO `kader` (`id`, `name`) VALUES (22, 'Patrick Arndt');
INSERT INTO `kader` (`id`, `name`) VALUES (23, 'Paul Pompetzki');
INSERT INTO `kader` (`id`, `name`) VALUES (24, 'Peer Hoffmann');
INSERT INTO `kader` (`id`, `name`) VALUES (25, 'Steffen Schmück');
INSERT INTO `kader` (`id`, `name`) VALUES (26, 'Stephan Wendel');
INSERT INTO `kader` (`id`, `name`) VALUES (27, 'Sven Andresen');
INSERT INTO `kader` (`id`, `name`) VALUES (28, 'Tade Bendsen');
INSERT INTO `kader` (`id`, `name`) VALUES (29, 'Thies Freese');
INSERT INTO `kader` (`id`, `name`) VALUES (30, 'Thomas Erichsen');
INSERT INTO `kader` (`id`, `name`) VALUES (31, 'Thomas Schulz');
INSERT INTO `kader` (`id`, `name`) VALUES (32, 'Tim Hinrichsen');
INSERT INTO `kader` (`id`, `name`) VALUES (33, 'Timo Stroschein');
INSERT INTO `kader` (`id`, `name`) VALUES (34, 'Tjark Stroschein');
INSERT INTO `kader` (`id`, `name`) VALUES (35, 'Tobi Kufer');
INSERT INTO `kader` (`id`, `name`) VALUES (36, 'Yannik Mahler');

INSERT INTO `tunnel` (spielerId, tunnel) VALUES 
    (1, 2),
    (2, 0),
    (3, 4),
    (4, 10),
    (5, 1),
    (6, 20),
    (7, 3),
    (8, 3),
    (9, 5),
    (10, 7),
    (11, 1),
    (12, 0),
    (13, 10),
    (14, 0),
    (15, 3),
    (16, 10),
    (17, 4),
    (18, 3),
    (19, 4),
    (20, 6),
    (21, 0),
    (22, 2),
    (23, 4),
    (24, 0),
    (25, 0),
    (26, 0),
    (27, 9),
    (28, 0),
    (29, 4),
    (30, 0),
    (31, 0),
    (32, 5),
    (33, 6),
    (34, 1),
    (35, 0),
    (36, 3);