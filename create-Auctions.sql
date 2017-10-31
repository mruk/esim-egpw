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

INSERT OR REPLACE INTO Auctions (nr, nr_item, nr_issuer, nr_top_bidder, sell_price, unix)
 VALUES
 (2142691, 5164855, 257416, 363449, 0.10, 1509440520),
 (2142893, 5160938, 121459, NULL , NULL, 1509447900);

SELECT * FROM Auctions;
