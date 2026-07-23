-- Einmaliges Reset-Skript fuer den Kader + alle spielerbezogenen Werte
-- der 2. Mannschaft auf der BESTEHENDEN Produktions-DB (Container "mariadb",
-- wird im Zuge des Umbaus zu "mariadb-2").
-- Strafkatalog (`strafen`) und Bier-Gruende (`strafkisten`) bleiben erhalten.
--
-- Ausfuehren VOR dem Umbau auf docker-compose.yml mit 2 Instanzen, z.B.:
-- docker exec -i mariadb mysql -u <user> -p<password> <database> < reset_kader_zweite.sql

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE spieltag;
TRUNCATE TABLE training;
TRUNCATE TABLE tunnel;
TRUNCATE TABLE material;
TRUNCATE TABLE spieler_strafen;
TRUNCATE TABLE strafkisten_log;
TRUNCATE TABLE kasse;
TRUNCATE TABLE activity_log;
TRUNCATE TABLE kader;

-- Neue Tabelle fuer Einstellungen (Kassenbeitrag etc.) nachziehen,
-- falls die DB schon vor diesem Update existierte:
CREATE TABLE IF NOT EXISTS einstellungen (
    `key` VARCHAR(100) PRIMARY KEY,
    `value` VARCHAR(255)
);
INSERT IGNORE INTO `einstellungen` (`key`, `value`) VALUES ('kassenbeitrag_sommer', '25');
INSERT IGNORE INTO `einstellungen` (`key`, `value`) VALUES ('kassenbeitrag_winter', '25');

SET FOREIGN_KEY_CHECKS = 1;
