DROP TABLE IF EXISTS Stats;

CREATE TABLE IF NOT EXISTS Stats (
nr INTEGER PRIMARY KEY,
type TEXT NOT NULL UNIQUE);

INSERT OR IGNORE INTO Stats (nr, type)
 VALUES
  (1, 'Miss chance reduction'),
  (2, 'Increased critical chance'),
  (3, 'Increased maximum damage'),
  (4, 'Increased damage'),
  (5, 'Chance to avoid damage'),
  (6, 'Increase strength'),
  (7, 'Increase hit'),
  (8, 'Increase economy skill'),
  (9, 'Chance for free flight'),
  (10, 'Chance to use less weapons for Berserk'),
  (11, 'Chance fo find a weapon'),
  (21, 'one hour'),
  (22, 'ten hours'),
  (25, 'twenty five hours'),
  (30, 'A'),
  (31, 'B'),
  (32, 'C'),
  (33, 'D'),
  (34, 'E');

SELECT * FROM Stats;
