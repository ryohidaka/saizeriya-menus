PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"name_en"	TEXT NOT NULL UNIQUE,
	"name_zh"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO categories VALUES(1,'グランド','Grand Menu','主');
INSERT INTO categories VALUES(2,'ランチ','Lunch','午餐');
INSERT INTO categories VALUES(3,'モーニング','Morning','早餐');
INSERT INTO categories VALUES(4,'キッズ','Kids','孩子们');
INSERT INTO categories VALUES(5,'テイクアウト','Take-out','外带');
CREATE TABLE IF NOT EXISTS "genres" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "menus" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"name_en"	TEXT NOT NULL,
	"name_zh"	TEXT NOT NULL,
	"price"	INTEGER NOT NULL,
	"price_with_tax"	INTEGER NOT NULL,
	"calorie"	INTEGER,
	"salt"	INTEGER,
	"category_id"	INTEGER,
		"genre_id"	INTEGER,
	FOREIGN KEY(category_id) REFERENCES categories(id),
	FOREIGN KEY(genre_id) REFERENCES genres(id),
	PRIMARY KEY("id")
);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('categories',5);
COMMIT;
