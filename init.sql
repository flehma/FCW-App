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

CREATE TABLE IF NOT EXISTS strafen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    strafe VARCHAR(255),
    pro_x_text VARCHAR(255),
    wert_geld INT,
    wert_kiste INT
);

CREATE TABLE IF NOT EXISTS spieler_strafen (
    spielerId INT,
    geld INT,
    kiste INT,
    FOREIGN KEY (spielerID) REFERENCES kader(id)
);

CREATE TABLE IF NOT EXISTS strafkisten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    strafe VARCHAR(255),
    einmal ENUM('TRUE', 'FALSE')
);

CREATE TABLE IF NOT EXISTS strafkisten_log (
    spielerId INT,
    strafkistenId INT,
    FOREIGN KEY (spielerID) REFERENCES kader(id),
    FOREIGN KEY (strafkistenId) REFERENCES strafkisten(id)
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
INSERT INTO `kader` (`id`, `name`) VALUES (37, 'Christoph Wollatz');
INSERT INTO `kader` (`id`, `name`) VALUES (38, 'Nick Nerenberg');
INSERT INTO `kader` (`id`, `name`) VALUES (39, 'Lukas Klingebiel');
INSERT INTO `kader` (`id`, `name`) VALUES (40, 'Tom Meyer');

INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (1, 2);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (2, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (3, 5);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (4, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (5, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (6, 24);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (7, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (8, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (9, 8);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (10, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (11, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (12, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (13, 11);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (14, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (15, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (16, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (17, 6);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (18, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (19, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (20, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (21, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (22, 2);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (23, 5);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (24, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (25, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (26, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (27, 10);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (28, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (29, 4);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (30, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (31, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (32, 9);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (33, 9);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (34, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (35, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (36, 3);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (37, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (38, 1);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (39, 2);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (40, 1);

INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (1, NULL, 3, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (2, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (3, 3, 2, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (4, 2, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (5, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (6, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (7, 1, NULL, 2, 2);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (8, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (9, NULL, NULL, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (10, 2, NULL, 3, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (11, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (12, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (13, NULL, NULL, 2, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (14, NULL, 1, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (15, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (16, NULL, NULL, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (17, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (18, NULL, 4, NULL, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (19, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (20, NULL, NULL, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (21, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (22, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (23, NULL, NULL, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (24, 1, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (25, 1, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (26, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (27, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (28, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (29, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (30, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (31, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (32, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (33, 1, NULL, 1, 1);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (34, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (35, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (36, NULL, NULL, 1, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (37, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (38, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (39, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (40, NULL, NULL, NULL, NULL);

INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (1, 'zu spät beim Training', 'pro 5 min', 2, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (2, 'zu spät beim Spiel', 'pro 5 min', 5, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (3, 'unentschuldigtes Fehlen beim Training', NULL, 10, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (4, 'unentschuldigtes Fehlen beim Spiel', NULL, 25, 1);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (5, 'unnötige gelbe Karte', NULL, 5, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (6, 'gelb-rote Karte nach unnötiger 1. gelben Karte', NULL, 15, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (7, 'gelb-rote Karte nach 2 unnötigen gelben Karten', NULL, 25, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (8, 'unnötige rote Karte', NULL, 50, 1);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (9, 'Sachen vergessen', 'pro Teil', 2, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (10, 'Handy klingelt während Besprechungen', NULL, 2, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (11, 'Vereinskleidung wird zu Spielen nicht getragen', 'pro Teil', 2, NULL);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`) VALUES (12, 'Spielkleidung wird zum Training getragen', 'pro Teil', 2, NULL);

INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (1, '1. mal Kapitän', 'TRUE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (2, '1. Tor in Blau', 'TRUE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (3, '1. Tor in Rot', 'TRUE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (4, '1. Tor in Weiß', 'TRUE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (5, 'Doppelpack', 'FALSE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (6, 'Hattrick', 'FALSE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (7, 'Neue Bolzer', 'FALSE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (8, 'Geburtstag', 'TRUE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (9, 'Zu früh Bier geöffnet', 'FALSE');
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`) VALUES (10, 'Bier verschüttet', 'FALSE');

INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (1, 0, 1);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (2, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (3, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (4, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (5, 0, 1);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (6, 5, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (7, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (8, 15, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (9, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (10, 44, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (11, 2, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (12, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (13, 0, 1);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (14, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (15, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (16, 4, 1);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (17, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (18, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (19, 2, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (20, 12, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (21, 5, 1);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (22, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (23, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (24, 5, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (25, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (26, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (27, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (28, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (29, 2, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (30, 15, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (31, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (32, 5, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (33, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (34, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (35, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (36, 10, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (37, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (38, 0, 0);
