/*
** SQLite
** run after all.
*/

DROP TABLE IF EXISTS Auctions;

CREATE TABLE IF NOT EXISTS Auctions (
nr INTEGER PRIMARY KEY,
nr_item INTEGER NOT NULL,
nr_issuer INTEGER NOT NULL,
nr_top_bidder INTEGER,
sell_price REAL,
unix INTEGER,
FOREIGN KEY(nr_item) REFERENCES Items(nr),
FOREIGN KEY(nr_issuer) REFERENCES Players(nr));

SELECT * FROM Auctions;
