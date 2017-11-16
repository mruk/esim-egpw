/*
** Date Time functions:
** http://www.sqlite.org/lang_datefunc.html
** Math:
** http://www.sqlite.org/lang_aggfunc.html
**
** View:
** https://sqlite.org/lang_createview.html
*/


-- get closest historical WIBOR3M at given day
SELECT m_market.day, m_market.wibor3m_pln FROM m_market
WHERE m_market.day <= '2010-01-01'
ORDER BY m_market.day DESC
LIMIT 1;
