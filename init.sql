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

INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (1, 2);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (2, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (3, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (4, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (5, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (6, 20);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (7, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (8, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (9, 5);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (10, 7);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (11, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (12, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (13, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (14, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (15, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (16, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (17, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (18, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (19, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (20, 6);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (21, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (22, 2);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (23, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (24, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (25, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (26, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (27, 9);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (28, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (29, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (30, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (31, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (32, 5);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (33, 6);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (34, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (35, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (36, 3);


INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (1, NULL, NULL, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (2, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (3, 1, 2, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (4, 2, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (5, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (6, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (7, 1, NULL, NULL, 2);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (8, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (9, NULL, NULL, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (10, 2, NULL, 3, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (11, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (12, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (13, NULL, NULL, 2, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (14, NULL, 1, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (15, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (16, NULL, NULL, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (17, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (18, NULL, 4, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (19, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (20, NULL, NULL, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (21, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (22, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (23, NULL, NULL, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (24, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (25, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (26, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (27, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (28, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (29, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (30, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (31, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (32, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (33, 1, NULL, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (34, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (35, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (36, NULL, NULL, 1, NULL);
