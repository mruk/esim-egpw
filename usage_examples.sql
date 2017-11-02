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
SELECT Players.nr, Players.name
FROM Auctions INNER JOIN Players
  ON Players.nr = Auctions.nr_top_bidder
WHERE Auctions.unix > strftime('%s','now','start of month')
GROUP BY Auctions.nr_top_bidder ORDER BY Players.name ASC;

-- ...as above: named Best Buyers in current month sorted by Gold spend:
SELECT Players.nr,
       Players.name,
       sum(Auctions.sell_price) AS sell_total_value
FROM   Auctions
       INNER JOIN Players
               ON Players.nr = Auctions.nr_top_bidder
WHERE  Auctions.unix > strftime('%s', 'now', 'start of month')
GROUP  BY Auctions.nr_top_bidder
ORDER  BY sell_total_value DESC;

-- named TOP10 Best Sellers in current year sorted by Total Gold Gain:
SELECT Players.nr,
       Players.name,
       sum(Auctions.sell_price) AS sell_total_value
FROM   Auctions
       INNER JOIN Players
               ON Players.nr = Auctions.nr_issuer
WHERE  ( Auctions.unix > strftime('%s', 'now', 'start of year')
         AND Auctions.nr_top_bidder IS NOT NULL )
GROUP  BY Auctions.nr_issuer
ORDER  BY sell_total_value DESC
LIMIT  10;

-- named TOP Best Sellers in current year sorted by Auctions amount, Total Gold Gain (just for ref):
SELECT count(*) AS auctions_amount,
       Players.name,
       sum(Auctions.sell_price) AS sell_total_value
FROM   Auctions
       INNER JOIN Players
               ON Players.nr = Auctions.nr_issuer
WHERE  ( Auctions.unix > strftime('%s', 'now', 'start of year')
         AND Auctions.nr_top_bidder IS NOT NULL )
GROUP  BY Players.nr
ORDER  BY auctions_amount DESC;

-- total Market Gold circulation in current month:
SELECT sum(Auctions.sell_price) AS total_circulation
FROM Auctions
WHERE (Auctions.unix > strftime('%s','now','start of month') AND Auctions.nr_top_bidder IS NOT NULL);

-- total Items sold in current month:
SELECT count(*) AS total_sold_items
FROM Auctions
WHERE (Auctions.unix > strftime('%s','now','start of month') AND Auctions.nr_top_bidder IS NOT NULL);

-- total items circulated on Market in current month:
SELECT count(*)
FROM Auctions INNER JOIN Items
  ON Items.nr = Auctions.nr_item
WHERE Auctions.unix > strftime('%s','now','start of month')
GROUP BY Items.nr;

-- total Auctions in current month:
SELECT count(*)
FROM Auctions
WHERE Auctions.unix > strftime('%s','now','start of month');

-- counting Items Qualities from beginning of the server,
-- INNER JOIN with Auctions is neccessary for optional Auction.unix
SELECT     Count(items.q) AS item_qualities,
           items.q
FROM       auctions
INNER JOIN items
where      auctions.nr_item = items.nr
GROUP BY   items.q;

-- looking for MAX Stat of Increase damage (stat nr:4):
SELECT Items.nr,
       Items.type,
       Items.q,
       CASE
         WHEN (Items.stat_a = 4 AND Items.stat_b <> 4) THEN Items.stat_a_value
         WHEN (Items.stat_a = 4 AND Items.stat_b  = 4) THEN (Items.stat_a_value + Items.stat_b_value)
         ELSE Items.stat_b_value
       end AS item_concrete_value
FROM   Items
WHERE  ( Items.stat_a = 4
          OR Items.stat_b = 4 )
ORDER  BY item_concrete_value DESC;

-- looking for MAX Stat of 'Increase damage' (stat nr:4) with named Items:
SELECT Items.nr,
       ItemTypes.type,
       Items.q,
       CASE
         WHEN (Items.stat_a = 4 AND Items.stat_b <> 4) THEN Items.stat_a_value
         WHEN (Items.stat_a = 4 AND Items.stat_b  = 4) THEN (Items.stat_a_value + Items.stat_b_value)
         ELSE Items.stat_b_value
       end AS item_concrete_value
FROM   Items
       INNER JOIN Itemtypes
               ON Items.type = ItemTypes.nr
WHERE  ( Items.stat_a = 4
          OR Items.stat_b = 4 )
ORDER  BY item_concrete_value DESC;

-- counting types of exposed named Items:
SELECT ItemTypes.type,
       Count(*) AS occurencies
FROM   Auctions
       INNER JOIN Items
               ON Auctions.nr_item = Items.nr
       INNER JOIN Itemtypes
               ON Items.type = ItemTypes.nr
GROUP  BY Itemtypes.type
ORDER  BY occurencies DESC;

-- counting types of circulated named Items:
SELECT ItemTypes.type,
       Count(*) AS occurencies
FROM   Auctions
       INNER JOIN Items
               ON Auctions.nr_item = Items.nr
       INNER JOIN Itemtypes
               ON Items.type = ItemTypes.nr
WHERE  Auctions.nr_top_bidder IS NOT NULL
GROUP  BY Itemtypes.type
ORDER  BY occurencies DESC;

-- counting qualities of exposed Items:
SELECT Items.q,
       Count(*) AS occurencies
FROM   Auctions
       INNER JOIN Items
               ON Auctions.nr_item = Items.nr
GROUP  BY Items.q
ORDER  BY Items.q ASC;
