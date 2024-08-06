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
INSERT INTO genres VALUES(14,'前菜・おつまみ');
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
INSERT INTO menus VALUES(1401,'辛味チキン','Spicy Grilled Chicken','香辣鸡翅',273,300,295,1.8000000000000000444,1,14);
INSERT INTO menus VALUES(1402,'アロスティチーニ（ラムの串焼き）','Arrosticini (Lamb skewers)','意式羊肉串（烤羊肉串）',364,400,224,0.59999999999999997779,1,14);
INSERT INTO menus VALUES(1403,'ほうれん草のソテー','Sauteed Spinach（Salt Oil Sauce）','炖煮菠菜（盐油酱）',182,200,223,1.1999999999999999555,1,14);
INSERT INTO menus VALUES(1404,'ポップコーンシュリンプ','Popcorn Shrimp','炸小甜虾',273,300,234,1.1999999999999999555,1,14);
INSERT INTO menus VALUES(1405,'エスカルゴのオーブン焼き','Grilled Escargots','蒜香焗蜗牛',364,400,220,1.3000000000000000444,1,14);
INSERT INTO menus VALUES(1406,'小エビのカクテル','Shrimp with "SAIZERIYA" Dressing','虾佐“SAIZERIYA”酱汁',255,280,126,2.2999999999999998223,1,14);
INSERT INTO menus VALUES(1407,'チョリソー（辛味ソーセージ）','Grilled Spicy Sausages','口利左香肠（辣猪肉香肠）',364,400,425,2.8999999999999999111,1,14);
INSERT INTO menus VALUES(1408,'蒸し鶏の香味ソース','Chicken with Flavored Vegetable Sauce（Limited to some stores）','鸡肉蔬菜酱（限部分店鋪）',255,280,192,2.3999999999999999111,1,14);
INSERT INTO menus VALUES(1410,'ムール貝のガーリック焼き','Grilled Mussels with Vegetable Salsa','蒜香烤蛤蜊',364,400,170,1.3999999999999999111,1,14);
INSERT INTO menus VALUES(1411,'アスパラガスの温サラダ','Asparagus with  Cheese ','芦笋配山核桃奶酪',273,300,80,0.69999999999999995559,1,14);
INSERT INTO menus VALUES(1413,'爽やかにんじんサラダ','Refreshing Carrot Salad','爽口胡萝卜沙拉',182,200,93,0.9000000000000000222,1,14);
INSERT INTO menus VALUES(1414,'モッツァレラトマト','Buffalo Mozzarella Cheese &  Tomato','布法罗马苏里拉奶酪和番茄',391,430,255,0.2000000000000000111,1,14);
INSERT INTO menus VALUES(1415,'カリッとポテト','Crispy Potatoes','酥烤马铃薯',255,280,389,2.1000000000000000888,1,14);
INSERT INTO menus VALUES(1422,'ハモン・セラーノ','Jamon Serrano','火腿塞拉诺',291,320,39,0.9000000000000000222,1,14);
INSERT INTO menus VALUES(1423,'生ハムとバッファローモッツァレラの盛合せ','Jamon Serrano &  Buffalo Mozzarella Cheese','火腿塞拉诺和水牛马苏里拉奶酪',455,500,146,1,1,14);
INSERT INTO menus VALUES(1425,'柔らか青豆の温サラダ','Green Peas with  Cheese & Egg','鲜嫩青豆加佩科里诺干酪温色拉',182,200,216,1.3999999999999999111,1,14);
INSERT INTO menus VALUES(1452,'アロスティチーニ（ラムの串焼き）(Wサイズ)','Arrosticini (Lamb skewers)','意式羊肉串（烤羊肉串）',728,800,NULL,NULL,1,14);
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
