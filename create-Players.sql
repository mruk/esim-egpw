/*
** SQLite
** run before Auctions.
*/

DROP TABLE IF EXISTS Players;

CREATE TABLE IF NOT EXISTS Players (
nr INTEGER PRIMARY KEY,
name TEXT NOT NULL);

SELECT * FROM Players;
