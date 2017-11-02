/*
** SQLite
** run after Stats and Types,
** run before Auctions.
*/

DROP TABLE IF EXISTS Items;

CREATE TABLE IF NOT EXISTS Items (
nr INTEGER PRIMARY KEY,
type INTEGER NOT NULL,
q INTEGER NOT NULL,
stat_a INTEGER,
stat_b INTEGER,
stat_a_value REAL,
stat_b_value REAL,
FOREIGN KEY(type) REFERENCES ItemTypes(nr),
FOREIGN KEY(stat_a) REFERENCES ItemStats(nr),
FOREIGN KEY(stat_b) REFERENCES ItemStats(nr)
);

INSERT OR REPLACE INTO Items
(nr, type, q, stat_a, stat_b, stat_a_value, stat_b_value) VALUES
 (5160938, 4, 4, 5, 4, 3.64, 3.42),
 (5164780, 2, 2, 7, 7, 46, 47),
 (5164848, 2, 1, 3, 1, 0.59, 0.65),
 (5164855, 2, 1, 4, 7, 0.42, 28),
 (5164891, 2, 1, 4, 5, 0.71, 0.46),
 (5165770, 2, 1, 2, 6, 0.72, 13),
 (5166669, 1, 3, 2, 1, 2.68, 3.50);

SELECT * FROM Items;
