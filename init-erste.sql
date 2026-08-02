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
    wert_kiste INT,
    reihenfolge INT NOT NULL DEFAULT 0
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
    einmal ENUM('TRUE', 'FALSE'),
    reihenfolge INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS strafkisten_log (
    spielerId INT,
    strafkistenId INT,
    FOREIGN KEY (spielerID) REFERENCES kader(id),
    FOREIGN KEY (strafkistenId) REFERENCES strafkisten(id)
);

CREATE TABLE IF NOT EXISTS kasse (
  id INT AUTO_INCREMENT PRIMARY KEY,
  spieler_id INT NOT NULL,
  halbjahr ENUM('sommer', 'winter') NOT NULL,
  bezahlt BOOLEAN DEFAULT FALSE,
  UNIQUE KEY unique_spieler_halbjahr (spieler_id, halbjahr)
);

CREATE TABLE IF NOT EXISTS activity_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  typ ENUM('strafe', 'bier', 'material') NOT NULL,
  spieler_name VARCHAR(255) NOT NULL,
  beschreibung VARCHAR(500) NOT NULL,
  erstellt_am DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- NEU: generische Einstellungen pro Team (z.B. Kassenbeitrag)
CREATE TABLE IF NOT EXISTS einstellungen (
    `key` VARCHAR(100) PRIMARY KEY,
    `value` VARCHAR(255)
);

INSERT INTO `einstellungen` (`key`, `value`) VALUES ('kassenbeitrag_sommer', '25');
INSERT INTO `einstellungen` (`key`, `value`) VALUES ('kassenbeitrag_winter', '25');

-- Kader: bewusst leer, wird von euch befuellt.

-- Strafkatalog: PLATZHALTER (Kopie der 2. Mannschaft) - bitte an die tatsaechlichen Werte der 1. Mannschaft anpassen!
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (1, 'zu spät beim Training', 'pro 5 min', 2, NULL, 1);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (2, 'zu spät beim Spiel', 'pro 5 min', 3, NULL, 2);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (3, 'unentschuldigtes Fehlen beim Training', NULL, 15, NULL, 3);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (4, 'unentschuldigtes Fehlen beim Spiel', NULL, 25, 1, 4);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (5, 'unnötige gelbe Karte', NULL, 5, NULL, 5);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (6, 'unnötige gelb-rote Karte', NULL, 15, NULL, 6);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (7, 'unnötige rote Karte', NULL, 50, 1, 7);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (8, 'Sachen am Spieltag vergessen', 'pro Teil', NULL, 1, 8);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (9, 'Material vergessen', 'pro Teil', 5, NULL, 9);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (10, 'Kiste oder Softdrinks vergessen', NULL, NULL, 1, 10);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (11, 'Während der Trainersprache am Handy', NULL, 2, NULL, 11);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (12, 'Vereinskleidung wird zu Spielen nicht getragen', 'pro Teil', 2, NULL, 12);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (13, 'Spielkleidung wird zum Training getragen', 'pro Teil', 2, NULL, 13);
INSERT INTO `strafen` (`id`, `strafe`, `pro_x_text`, `wert_geld`, `wert_kiste`, `reihenfolge`) VALUES (14, 'Rauchen im Trikot', NULL, 2, NULL, 14);

-- Bier-Gruende: ebenfalls PLATZHALTER, bitte anpassen!
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (1, '1. mal Kapitän', 'TRUE', 1);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (2, '1. Tor in Blau', 'TRUE', 2);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (3, '1. Tor in Rot', 'TRUE', 3);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (4, '1. Tor in Weiß', 'TRUE', 4);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (5, 'Doppelpack', 'FALSE', 5);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (6, 'Hattrick', 'FALSE', 6);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (7, 'Neue Bolzer', 'FALSE', 7);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (8, 'Geburtstag', 'TRUE', 8);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (9, 'Zu früh Bier geöffnet', 'FALSE', 9);
INSERT INTO `strafkisten` (`id`, `strafe`, `einmal`, `reihenfolge`) VALUES (10, 'Bier verschüttet', 'FALSE', 10);
