/*
** SQLite
** model initialization
** for data import:
**  https://sqlite.org/cli.html#csv_import
*/

.print "EGPW AUCTION MARKET INIT START";
.read create-ItemTypes.sql;
.read create-ItemStats.sql;
.read create-Items.sql;
.read create-Players.sql;
.read create-Auctions.sql;
.print "EGPW AUCTION MARKET INIT END";
