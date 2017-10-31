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

INSERT OR REPLACE INTO Items (nr, type, q, stat_a, stat_b, stat_a_value, stat_b_value)
 VALUES
 (5160938, 4, 4, 5, 4, 3.64, 3.42),
 (5164855, 2, 1, 4, 7, 0.42, 28);


SELECT * FROM Items;
