-- Fügt eine sortierbare Reihenfolge für den Strafen- und Bier-Katalog hinzu.
-- Muss einmalig auf JEDER bestehenden DB ausgeführt werden (erste + zweite Mannschaft),
-- da die Container-Volumes bereits existieren und init-*.sql nicht erneut läuft.
--
-- Anwendung z.B.:
--   docker exec -i mariadb-1 mariadb -uroot -p<PASSWORT> database < migrations/2026-08-02_add_reihenfolge.sql
--   docker exec -i mariadb-2 mariadb -uroot -p<PASSWORT> database < migrations/2026-08-02_add_reihenfolge.sql

ALTER TABLE strafen ADD COLUMN IF NOT EXISTS reihenfolge INT NOT NULL DEFAULT 0;
ALTER TABLE strafkisten ADD COLUMN IF NOT EXISTS reihenfolge INT NOT NULL DEFAULT 0;

-- Bestehende Einträge behalten ihre bisherige Anzeige-Reihenfolge (nach id)
UPDATE strafen SET reihenfolge = id WHERE reihenfolge = 0;
UPDATE strafkisten SET reihenfolge = id WHERE reihenfolge = 0;
