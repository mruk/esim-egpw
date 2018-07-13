/*
** SQLite
** run after Stats and Types,
** run before Auctions.
*/

DROP TABLE IF EXISTS Consumables;

CREATE TABLE IF NOT EXISTS Consumables (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL
);

INSERT OR REPLACE INTO Consumables
(id, name) VALUES
 (1, "Medkit"),
 (2, "Steroids"),
 (3, "Extra vacations"),
 (4, "Extra spa"),
 (5, "Tank"),
 (6, "Bunker"),
 (7, "Sewer guide"),
 (8, "Pain dealer - one hour"),
 (9, "Pain dealer - ten hours"),
 (10, "Pain dealer - twenty five hours"),
 (11, "Bandage size A"),
 (12, "Bandage size B"),
 (13, "Bandage size C"),
 (14, "Bandage size D"),
 (15, "Bandage size E"),
 (16, "Bandage size F"),
 (17, "Camouflage 1st class"),
 (18, "Camouflage 2nd class"),
 (19, "Camouflage 3rd class"),
 (20, "Equipment parameter reshuffle"),
 (21, "Equipment parameter upgrade");

SELECT * FROM Consumables;
