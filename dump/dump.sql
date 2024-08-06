PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"name_en"	TEXT NOT NULL UNIQUE,
	"name_zh"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
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
COMMIT;
