/*
** SQLite
** run before Items.
*/

DROP TABLE IF EXISTS ItemStats;

CREATE TABLE IF NOT EXISTS ItemStats (
nr INTEGER PRIMARY KEY,
type TEXT NOT NULL UNIQUE);

INSERT OR IGNORE INTO ItemStats (nr, type)
 VALUES
  (1, 'Reduce miss chance'),
  (2, 'Increase critical chance'),
  (3, 'Increase maximum damage'),
  (4, 'Increase damage'),
  (5, 'Increase chance to avoid damage'),
  (6, 'Increase strength'),
  (7, 'Increase hit'),
  (8, 'Increase economy skill'),
  (9, 'Chance for free flight'),
  (10, 'Chance to use less weapons for Berserk'),
  (11, 'Chance fo find a weapon'),
  (21, 'one hour'),
  (22, 'ten hours'),
  (25, 'twenty five hours'),
  (30, 'size A'),
  (31, 'size B'),
  (32, 'size C'),
  (33, 'size D'),
  (34, 'size E'),
  (35, '1st class'),
  (36, '2nd class'),
  (37, '3rd class');

SELECT * FROM ItemStats;
