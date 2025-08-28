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

INSERT INTO `kader` (`id`, `name`) VALUES (1, 'Abdullah Alsalloum');
INSERT INTO `kader` (`id`, `name`) VALUES (2, 'Amer Ramadhan Omar');
INSERT INTO `kader` (`id`, `name`) VALUES (3, 'Andy Schulz');
INSERT INTO `kader` (`id`, `name`) VALUES (4, 'Boy Bröckler');
INSERT INTO `kader` (`id`, `name`) VALUES (5, 'Fabian Lehmann');
INSERT INTO `kader` (`id`, `name`) VALUES (6, 'Falk Jöns-Anders');
INSERT INTO `kader` (`id`, `name`) VALUES (7, 'Finn Bargiel');
INSERT INTO `kader` (`id`, `name`) VALUES (8, 'Hauke Güntrath-Lorenzen');
INSERT INTO `kader` (`id`, `name`) VALUES (9, 'Ismail Bakkar');
INSERT INTO `kader` (`id`, `name`) VALUES (10, 'Jakob Lange');
INSERT INTO `kader` (`id`, `name`) VALUES (11, 'Jan Pohlke');
INSERT INTO `kader` (`id`, `name`) VALUES (12, 'Joe Hoffmann');
INSERT INTO `kader` (`id`, `name`) VALUES (13, 'Kevin Raabe');
INSERT INTO `kader` (`id`, `name`) VALUES (14, 'Kjell Boiesen');
INSERT INTO `kader` (`id`, `name`) VALUES (15, 'Lasse Petersen');
INSERT INTO `kader` (`id`, `name`) VALUES (16, 'Leon Henning');
INSERT INTO `kader` (`id`, `name`) VALUES (17, 'Malte Klang');
INSERT INTO `kader` (`id`, `name`) VALUES (18, 'Mario Perivolaris');
INSERT INTO `kader` (`id`, `name`) VALUES (19, 'Mattes Nissen');
INSERT INTO `kader` (`id`, `name`) VALUES (20, 'Nick Nerenberg');
INSERT INTO `kader` (`id`, `name`) VALUES (21, 'Nik Plöger');
INSERT INTO `kader` (`id`, `name`) VALUES (22, 'Paul Pompetzki');
INSERT INTO `kader` (`id`, `name`) VALUES (23, 'Peer Hoffmann');
INSERT INTO `kader` (`id`, `name`) VALUES (24, 'Steffen Schmück');
INSERT INTO `kader` (`id`, `name`) VALUES (25, 'Sven Andresen');
INSERT INTO `kader` (`id`, `name`) VALUES (26, 'Thies Freese');
INSERT INTO `kader` (`id`, `name`) VALUES (27, 'Thomas Erichsen');
INSERT INTO `kader` (`id`, `name`) VALUES (28, 'Thomas Schulz');
INSERT INTO `kader` (`id`, `name`) VALUES (29, 'Tim Hinrichsen');
INSERT INTO `kader` (`id`, `name`) VALUES (30, 'Timo Stroschein');
INSERT INTO `kader` (`id`, `name`) VALUES (31, 'Tjark Stroschein');
INSERT INTO `kader` (`id`, `name`) VALUES (32, 'Yannik Mahler');
INSERT INTO `kader` (`id`, `name`) VALUES (98, 'Marc Stroschein');
INSERT INTO `kader` (`id`, `name`) VALUES (99, 'Carlo Secci');

INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (1, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (2, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (3, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (4, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (5, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (6, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (7, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (8, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (9, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (10, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (11, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (12, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (13, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (14, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (15, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (16, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (17, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (18, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (19, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (20, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (21, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (22, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (23, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (24, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (25, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (26, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (27, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (28, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (29, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (30, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (31, 0);
INSERT INTO `tunnel` (`spielerId`, `tunnel`) VALUES (32, 0);

INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (1, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (2, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (3, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (4, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (5, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (6, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (7, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (8, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (9, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (10, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (11, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (12, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (13, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (14, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (15, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (16, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (17, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (18, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (19, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (20, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (21, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (22, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (23, NULL, 1, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (24, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (25, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (26, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (27, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (28, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (29, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (30, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (31, NULL, NULL, NULL, NULL);
INSERT INTO `material` (`spielerId`, `flaschen`, `musikbox`, `bälle`, `jacken`) VALUES (32, NULL, NULL, NULL, NULL);

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

INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (1, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (2, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (3, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (4, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (5, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (6, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (7, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (8, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (9, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (10, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (11, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (12, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (13, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (14, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (15, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (16, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (17, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (18, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (19, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (20, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (21, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (22, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (23, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (24, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (25, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (26, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (27, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (28, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (29, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (30, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (31, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (32, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (98, 0, 0);
INSERT INTO `spieler_strafen` (`spielerId`, `geld`, `kiste`) VALUES (99, 0, 0);
