/*
** SQLite
** m_market is money real market;
** http://rss.nbp.pl/kursy/tabrss.aspx?n=2007/c/07c107
** c - table C,
** 2007/c/07 - year,
** c107 - table no.
**
** LIBOR... WIBOR:
** https://www.money.pl/pieniadze/depozyty/walutowe/
*/

DROP TABLE IF EXISTS m_market;

CREATE TABLE IF NOT EXISTS m_market (
  day         TEXT PRIMARY KEY,
  wibor3m_pln REAL,
  libor3m_chf REAL,
  chfbid_nbp  REAL,
  chfask_nbp  REAL
);

/*
** 01 - first month of the year,
** 12 - last month of the year.
*/
INSERT OR REPLACE INTO m_market
(day, wibor3m_pln, libor3m_chf, chfbid_nbp, chfask_nbp) VALUES
 ('2007-06-01', 4.6100, 2.4700, 2.2847, 2.3309),
 ('2008-01-02', 5.6000, 2.7600, 2.3521, 2.3997 ),
 ('2017-11-15', 1.7300, -0.7410, 3.6081, 3.6809);

SELECT * FROM m_market;
