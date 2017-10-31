/*
** Date Time functions:
** http://www.sqlite.org/lang_datefunc.html
** Math:
** http://www.sqlite.org/lang_aggfunc.html
**
** View:
** https://sqlite.org/lang_createview.html
*/
-- datetime start of given month
sqlite> SELECT datetime('now','start of year','+5 month');
2017-06-01 00:00:00

-- datetime end of given month
sqlite> SELECT datetime('now','start of year','+6 month', '-1 second');
2017-06-30 23:59:59

-- unix start of given month
sqlite> SELECT strftime('%s','now','start of year','+5 month');
1496275200

-- datetime end of given month
sqlite> SELECT datetime('now','start of year','+6 month', '-1 second');
2017-06-30 23:59:59

-- unix start of previous month
sqlite> SELECT strftime('%s','now','start of month','-1 month');
1504224000

-- unix end of previous month
sqlite> SELECT strftime('%s','now','start of month','-1 second');
1506815999

-- list of Players ids successfully buying in current month:
SELECT Auctions.nr_top_bidder FROM Auctions
WHERE Auctions.unix > strftime('%s','now','start of month')
GROUP BY Auctions.nr_top_bidder ORDER BY Auctions.nr_top_bidder ASC;

-- as above, with Player name:
SELECT Players.nr, Players.name FROM Auctions INNER JOIN Players
ON Players.nr = Auctions.nr_top_bidder
WHERE Auctions.unix > strftime('%s','now','start of month')
GROUP BY Auctions.nr_top_bidder ORDER BY Players.name ASC;

-- ...as above: named Best Buyers in current month sorted by Gold spend:
SELECT Players.nr, Players.name, sum(Auctions.sell_price) AS sell_total_value
FROM Auctions INNER JOIN Players
ON Players.nr = Auctions.nr_top_bidder
WHERE Auctions.unix > strftime('%s','now','start of month')
GROUP BY Auctions.nr_top_bidder ORDER BY sell_total_value DESC;

-- named TOP10 Best Sellers in current month sorted by Total Gold Gain:
SELECT Players.nr, Players.name, sum(Auctions.sell_price) AS sell_total_value
FROM Auctions INNER JOIN Players
ON Players.nr = Auctions.nr_issuer
WHERE (Auctions.unix > strftime('%s','now','start of month') AND Auctions.nr_top_bidder IS NOT NULL)
GROUP BY Auctions.nr_top_bidder ORDER BY sell_total_value DESC
LIMIT 10;

-- named TOP Best Sellers in current month sorted by Auctions amount, Total Gold Gain (just for ref):
SELECT count(*) AS auctions_amount, Players.name, sum(Auctions.sell_price) AS sell_total_value
FROM Auctions INNER JOIN Players
ON Players.nr = Auctions.nr_issuer
WHERE (Auctions.unix > strftime('%s','now','start of month') AND Auctions.nr_top_bidder IS NOT NULL)
GROUP BY Auctions.nr_top_bidder ORDER BY auctions_amount DESC;

-- total Market Gold circulation in current month:
SELECT sum(Auctions.sell_price) AS total_circulation
FROM Auctions
WHERE (Auctions.unix > strftime('%s','now','start of month') AND Auctions.nr_top_bidder IS NOT NULL);

-- total Items sold in current month:
SELECT count(*) AS total_sold_items
FROM Auctions
WHERE (Auctions.unix > strftime('%s','now','start of month') AND Auctions.nr_top_bidder IS NOT NULL);

-- total items on Market in current month:
SELECT count(*)
FROM Auctions INNER JOIN Items
ON Items.nr = Auctions.nr_item
WHERE Auctions.unix > strftime('%s','now','start of month')
GROUP BY Items.nr;

-- total Auctions in current month:
SELECT count(*)
FROM Auctions
WHERE Auctions.unix > strftime('%s','now','start of month');
