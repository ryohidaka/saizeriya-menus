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
INSERT INTO genres VALUES(12,'サラダ');
INSERT INTO genres VALUES(13,'スープ');
INSERT INTO genres VALUES(31,'ライス・パン');
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
INSERT INTO menus VALUES(1202,'小エビのサラダ','Shrimp Salad','小甜虾沙拉',319,350,192,1.5,1,12);
INSERT INTO menus VALUES(1205,'わかめのサラダ','Seaweed Salad','海藻沙拉',319,350,174,2.8999999999999999111,1,12);
INSERT INTO menus VALUES(1207,'モッツァレラのサラダ','Green Salad with Buffalo Mozzarella Cheese','水牛马苏里拉芝士蔬菜沙拉',364,400,243,0.59999999999999997779,1,12);
INSERT INTO menus VALUES(1208,'グリーンサラダ','Green Salad','绿色的沙拉',319,350,166,0.69999999999999995559,1,12);
INSERT INTO menus VALUES(1209,'チキンのサラダ','Chicken Salad','鸡肉沙拉',319,350,224,1.3000000000000000444,1,12);
INSERT INTO menus VALUES(1301,'コーンクリームスープ','Creamy Corn Soup','奶油玉米浓汤',137,150,154,1,1,13);
INSERT INTO menus VALUES(1305,'田舎風ミネストローネ','Country-style Minestrone','田园风蔬菜汤',273,300,227,3,1,13);
INSERT INTO menus VALUES(1307,'たまねぎのズッパ','Onion soup, Zuppa','洋葱面包汤',273,300,228,2,1,13);
INSERT INTO menus VALUES(3101,'ライス','Rice','米饭',137,150,303,NULL,1,31);
INSERT INTO menus VALUES(3102,'ラージライス','Large Rice','米饭',182,200,303,NULL,1,31);
INSERT INTO menus VALUES(3103,'スモールライス','Small Rice','米饭',91,100,303,NULL,1,31);
INSERT INTO menus VALUES(3104,'シナモンプチフォッカ','Petit Focaccia with Cinnamon Sugar','肉桂糖迷你香草面包',182,200,246,0.8000000000000000444,1,31);
INSERT INTO menus VALUES(3106,'プチフォッカ','Petit Focaccias','迷你香草面包',137,150,214,0.8000000000000000444,1,31);
INSERT INTO menus VALUES(3108,'ミニフィセル','Mini Ficelle','迷你法式面包',137,150,189,1,1,31);
INSERT INTO menus VALUES(3109,'ガーリックトースト','Garlic Toast','蒜香烤面包',182,200,245,1.1000000000000000888,1,31);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('categories',5);
COMMIT;
