/*
** SQLite
** run before Auctions.
*/

DROP TABLE IF EXISTS Players;

CREATE TABLE IF NOT EXISTS Players (
nr INTEGER PRIMARY KEY,
name TEXT NOT NULL);

INSERT OR REPLACE INTO Players (nr, name)
 VALUES
 (42371, 'BUcER'),
 (121459, 'gerulis6'),
 (257416, 'Item vendor'),
 (342870, 'ExSPer'),
 (363449, 'SHlaotan'),
 (672164, 'Xsaris'),
 (745992, 'aljosa2323');

SELECT * FROM Players;
