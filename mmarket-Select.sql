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

SELECT m_market.day, m_market.wibor3m_pln FROM m_market
ORDER BY wibor3m_pln DESC;

/*
** Hand Made Statistical Functions
*/
-- simplest Discrete Cumulative Distribution Function (D-CDF) of m_market.wibor3m_pln
-- mapped on num_tab.val:
SELECT num_tab.dec, count(m_market.wibor3m_pln) AS occurencies FROM num_tab
JOIN m_market ON m_market.wibor3m_pln <= num_tab.dec
GROUP BY num_tab.dec
ORDER by num_tab.dec ASC;

-- proper implementation of CDF, ready for further extensions:
SELECT num_tab.dec, count(m_market.wibor3m_pln) AS occurencies FROM num_tab
JOIN m_market ON num_tab.dec
  WHERE m_market.wibor3m_pln <= num_tab.dec
GROUP BY num_tab.dec
ORDER by num_tab.dec ASC;

-- Discrete Probability Density Function (D-PDF) of m_market.wibor3m_pln in 0.1 steps:
SELECT (num_tab.dec||'+0.1:'), count(m_market.wibor3m_pln) AS occurencies FROM num_tab
JOIN m_market ON num_tab.dec
  WHERE (m_market.wibor3m_pln >= num_tab.dec AND m_market.wibor3m_pln < (num_tab.dec+0.1))
GROUP BY num_tab.dec
ORDER by num_tab.dec ASC;
