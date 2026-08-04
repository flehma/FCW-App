-- Führt die Unterscheidung zwischen 1. und 2. Mannschaft ein (kader_modus)
-- und setzt den Mannschaftskassenbeitrag der 1. Mannschaft auf 30€.
--
-- NUR auf der DB der 1. Mannschaft (mariadb-1) ausführen!
-- Die 2. Mannschaft (mariadb-2) braucht keine Änderung, da 'opt_in' der
-- Standard ist, wenn kein Eintrag für kader_modus existiert.
--
-- Anwendung:
--   docker exec -i mariadb-1 mariadb -uroot -p<PASSWORT> database < migrations/2026-08-04_kader_modus_erste.sql

INSERT INTO `einstellungen` (`key`, `value`) VALUES ('kader_modus', 'opt_out')
    ON DUPLICATE KEY UPDATE `value` = 'opt_out';

UPDATE `einstellungen` SET `value` = '30' WHERE `key` = 'kassenbeitrag_sommer';
UPDATE `einstellungen` SET `value` = '30' WHERE `key` = 'kassenbeitrag_winter';

-- Spieltag-Kader der 1. Mannschaft direkt einmal mit allen Spielern befüllen,
-- damit der neue "opt_out"-Modus sofort einen sinnvollen Ausgangszustand hat.
INSERT INTO `spieltag` (`spielerId`)
    SELECT id FROM `kader` WHERE id NOT IN (SELECT spielerId FROM `spieltag`);
