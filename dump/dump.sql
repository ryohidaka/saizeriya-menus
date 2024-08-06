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
INSERT INTO genres VALUES(21,'ドリア&グラタン');
INSERT INTO genres VALUES(22,'ピザ');
INSERT INTO genres VALUES(23,'パスタ');
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
INSERT INTO menus VALUES(2101,'ミラノ風ドリア','Meat Sauce Doria','米兰风肉酱多利亚饭',273,300,521,2.5,1,21);
INSERT INTO menus VALUES(2103,'半熟卵のミラノ風ドリア','Meat Sauce & Coddled Egg Doria','半熟蛋配米兰风多利亚肉酱饭',319,350,604,2.7000000000000001776,1,21);
INSERT INTO menus VALUES(2106,'タラコとエビのドリア','Doria with “TARAKO”Sauce & Shrimp','鳕鱼籽虾焗饭',364,400,578,2.7999999999999998223,1,21);
INSERT INTO menus VALUES(2108,'焼チーズ ミラノ風ドリア','Doria with Meat Sauce & Cheese','多利亚肉酱和奶酪',319,350,652,2.8999999999999999111,1,21);
INSERT INTO menus VALUES(2109,'エビとタラコのクリームグラタン（全粒粉）','Gratin with “TARAKO”Sauce & Shrimp','TARAKO醬蝦焗烤',391,400,481,2.1000000000000000888,1,21);
INSERT INTO menus VALUES(2203,'バッファローモッツァレラのマルゲリータピザ','Pizza with  Buffalo Mozzarella Cheese','水牛马苏里拉披萨',364,400,544,2.3999999999999999111,1,22);
INSERT INTO menus VALUES(2204,'野菜ときのこのピザ','Pizza with Mushrooms & Vegetable Salsa','蔬菜蘑菇比萨',364,400,593,3.2000000000000001776,1,22);
INSERT INTO menus VALUES(2206,'たっぷりコーンのピザ','Corn Pizza','足量甜玉米比萨',364,400,624,2.6000000000000000888,1,22);
INSERT INTO menus VALUES(2208,'ソーセージピザ','Sausage Pizza','香肠比萨',364,400,710,4.0999999999999996447,1,22);
INSERT INTO menus VALUES(2303,'ペペロンチーノ','Spaghetti Peperoncino','香辣意面',273,300,582,1.8999999999999999111,1,23);
INSERT INTO menus VALUES(2304,'パルマ風スパゲティ','Spaghetti with tomato＆pancetta','番茄培根意大利面',364,400,753,3.1000000000000000888,1,23);
INSERT INTO menus VALUES(2305,'カルボナーラ','Spaghetti Carbonara','奶油培根意面',455,500,799,3.1000000000000000888,1,23);
INSERT INTO menus VALUES(2306,'ミートソースボロニア風','Spaghetti Meat Sauce','意大利肉酱面',364,400,604,3.6000000000000000888,1,23);
INSERT INTO menus VALUES(2310,'スープ入り塩味ボンゴレ','Spaghetti"VONGOLE"','意大利面“VONGOLE”',455,500,872,2.5,1,23);
INSERT INTO menus VALUES(2316,'半熟卵のミートソースボロニア風','Spaghetti Meat Sauce with Coddled Egg','半熟蛋配意大利肉酱面',410,450,673,3.7999999999999998223,1,23);
INSERT INTO menus VALUES(2317,'半熟卵のぺペロンチーノ','Spaghetti Peperoncino with soft-boiled egg','半熟蛋配香辣意面',319,350,665,2.1000000000000000888,1,23);
INSERT INTO menus VALUES(2320,'小エビのタラコソース','Spaghetti “TARAKO” Sauce with Shrimp','意大利面“TARAKO”虾酱',491,540,594,2.7999999999999998223,1,23);
INSERT INTO menus VALUES(2321,'きのことほうれん草のクリームスパゲッティ','Spaghetti with spinach and mushroom cream','菠菜蘑菇奶油意大利面',546,600,856,3.7000000000000001776,1,23);
INSERT INTO menus VALUES(2325,'ペンネアラビアータ（全粒粉）','Whole wheat penne arrabbiata','全麥通心粉',391,400,444,2.7999999999999998223,1,23);
INSERT INTO menus VALUES(2328,'イカの墨入りセピアソース','Spaghetti al Nero di Seppia','墨鱼汁海鲜意面',455,500,603,1.8000000000000000444,1,23);
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
