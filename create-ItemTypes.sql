/*
** SQLite
** run before Items.
*/

DROP TABLE IF EXISTS ItemTypes;

CREATE TABLE IF NOT EXISTS ItemTypes (
nr INTEGER PRIMARY KEY,
type TEXT NOT NULL UNIQUE);

INSERT OR IGNORE INTO ItemTypes (nr, type)
 VALUES
  (1, 'Offhand'),
  (2, 'Helmet'),
  (3, 'Personal Armor'),
  (4, 'Vision'),
  (5, 'Weapon upgrade'),
  (6, 'Pants'),
  (7, 'Shoes'),
  (8, 'Lucky charm'),
  (10, 'Company'),
  (11, 'Steroids'),
  (12, 'Extra vacations'),
  (13, 'Extra spa'),
  (14, 'Tank'),
  (15, 'Bunker'),
  (16, 'Sewer guide'),
  (17, 'Pain dealer'),
  (18, 'Bandage'),
  (19, 'Camouflage');

SELECT * FROM ItemTypes;
