/*
** SQLite
** m_market is money real market;
** http://rss.nbp.pl/kursy/tabrss.aspx?n=2007/c/07c107
** c - table C,
** 2007/c/07 - year,
** c107 - table no.
**
** LIBOR... WIBOR:
** https://www.bankier.pl/kredyty-hipoteczne/stopy-procentowe/wibor?rateDate=2008-01-02
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
 ('2008-01-02', 5.6000, 2.7600, 2.3521, 2.3997),
 ('2009-01-02', 5.8400, 0.6483, 2.7769,	2.8331),
 ('2010-01-04', 4.2700, 0.2500, 2.7384,	2.7938),
 ('2011-01-03', 3.9400, 0.1692, 3.1363,	3.1997),
 ('2012-01-02', 4.9900, 0.0517, 3.6413,	3.7149),
 ('2013-01-02', 4.1000, 0.0120, 3.3313,	3.3987),
 ('2014-01-02', 2.7000, 0.0230, 3.3478, 3.4154),
 ('2015-01-02', 2.0600, -0,0630, 3.5475, 3.6191),
 ('2016-01-02', 1.7200, -0,7560, 3.9154, 3.9944),
 ('2017-01-03', 1.7300, -0,7272, 4.0771, 4.1595),
 ('2017-11-15', 1.7300, -0.7410, 3.6081, 3.6809);

SELECT * FROM m_market;
