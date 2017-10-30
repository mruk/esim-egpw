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

SELECT * FROM Items;
