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
	"name"	TEXT NOT NULL UNIQUE, pre_id TEXT,
	PRIMARY KEY("id")
);
INSERT INTO genres VALUES(12,'サラダ','SA');
INSERT INTO genres VALUES(13,'スープ','SU');
INSERT INTO genres VALUES(14,'前菜・おつまみ','AA');
INSERT INTO genres VALUES(21,'ドリア&グラタン','DG');
INSERT INTO genres VALUES(22,'ピザ','PZ');
INSERT INTO genres VALUES(23,'パスタ','PA');
INSERT INTO genres VALUES(24,'ハンバーグ','MT');
INSERT INTO genres VALUES(31,'ライス・パン','RP');
INSERT INTO genres VALUES(32,'デザート (すぐに)','DE');
INSERT INTO genres VALUES(33,'ビール・サワー・ノンアルコール','BR');
INSERT INTO genres VALUES(34,'ワイン','WN');
INSERT INTO genres VALUES(39,'デザート (あとで)','DE');
INSERT INTO genres VALUES(43,'トッピング','TP');
INSERT INTO genres VALUES(51,'ドリンクバー','DB');
INSERT INTO genres VALUES(53,'ドレッシング・オリーブオイル',NULL);
CREATE TABLE IF NOT EXISTS "icons" (
	"id"	INTEGER NOT NULL UNIQUE,
	"icon"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO icons VALUES(1,'🥗');
INSERT INTO icons VALUES(2,'🥣');
INSERT INTO icons VALUES(3,'🍗');
INSERT INTO icons VALUES(4,'🍢');
INSERT INTO icons VALUES(5,'🥬');
INSERT INTO icons VALUES(6,'🍤');
INSERT INTO icons VALUES(7,'🥘');
INSERT INTO icons VALUES(8,'🌭');
INSERT INTO icons VALUES(9,'🐔');
INSERT INTO icons VALUES(10,'🦪');
INSERT INTO icons VALUES(11,'🥕');
INSERT INTO icons VALUES(12,'🍅');
INSERT INTO icons VALUES(13,'🥔');
INSERT INTO icons VALUES(14,'🍖');
INSERT INTO icons VALUES(15,'🧀');
INSERT INTO icons VALUES(16,'🫛');
INSERT INTO icons VALUES(17,'🍕');
INSERT INTO icons VALUES(18,'🍝');
INSERT INTO icons VALUES(19,'🍚');
INSERT INTO icons VALUES(20,'🍞');
INSERT INTO icons VALUES(21,'🥖');
INSERT INTO icons VALUES(22,'🍨');
INSERT INTO icons VALUES(23,'🍮');
INSERT INTO icons VALUES(24,'🍰');
INSERT INTO icons VALUES(25,'🍺');
INSERT INTO icons VALUES(26,'🍷');
INSERT INTO icons VALUES(27,'🍾');
INSERT INTO icons VALUES(28,'🧁');
INSERT INTO icons VALUES(29,'🥚');
INSERT INTO icons VALUES(30,'🥤');
INSERT INTO icons VALUES(31,'🧂');
CREATE TABLE IF NOT EXISTS "menus" (
    id INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL,
    name_en TEXT,
    name_zh TEXT,
    price INTEGER NOT NULL,
    price_with_tax INTEGER NOT NULL,
    calorie INTEGER,
    salt INTEGER,
    category_id INTEGER,
    genre_id INTEGER,
    is_alcohol INTEGER DEFAULT false,
    icon_id INTEGER,
    pre_id TEXT,
    is_east INTEGER DEFAULT false,
    is_west INTEGER DEFAULT false,
    PRIMARY KEY(id),
    FOREIGN KEY(category_id) REFERENCES categories(id),
    FOREIGN KEY(genre_id) REFERENCES genres(id),
    FOREIGN KEY(icon_id) REFERENCES icons(id)
);
INSERT INTO menus VALUES(1202,'小エビのサラダ','Shrimp Salad','小甜虾沙拉',319,350,192,1.5,1,12,0,6,'SA02',1,1);
INSERT INTO menus VALUES(1205,'わかめのサラダ','Seaweed Salad','海藻沙拉',319,350,174,2.899999999999999912,1,12,0,1,'SA05',1,1);
INSERT INTO menus VALUES(1207,'モッツァレラのサラダ','Green Salad with Buffalo Mozzarella Cheese','水牛马苏里拉芝士蔬菜沙拉',364,400,243,0.5999999999999999778,1,12,0,1,'SA07',0,0);
INSERT INTO menus VALUES(1208,'グリーンサラダ','Green Salad','绿色的沙拉',319,350,166,0.6999999999999999556,1,12,0,1,'SA08',0,0);
INSERT INTO menus VALUES(1209,'チキンのサラダ','Chicken Salad','鸡肉沙拉',319,350,224,1.300000000000000044,1,12,0,1,'SA03',1,1);
INSERT INTO menus VALUES(1301,'コーンクリームスープ','Creamy Corn Soup','奶油玉米浓汤',137,150,154,1,1,13,0,2,'SU01',1,1);
INSERT INTO menus VALUES(1305,'田舎風ミネストローネ','Country-style Minestrone','田园风蔬菜汤',273,300,227,3,1,13,0,2,'SU05',1,1);
INSERT INTO menus VALUES(1307,'たまねぎのズッパ','Onion soup, Zuppa','洋葱面包汤',273,300,228,2,1,13,0,2,'SU07',1,1);
INSERT INTO menus VALUES(1401,'辛味チキン','Spicy Grilled Chicken','香辣鸡翅',273,300,295,1.800000000000000044,1,14,0,3,'AA01',1,1);
INSERT INTO menus VALUES(1402,'アロスティチーニ（ラムの串焼き）','Arrosticini (Lamb skewers)','意式羊肉串（烤羊肉串）',364,400,224,0.5999999999999999778,1,14,0,4,'AA02',1,1);
INSERT INTO menus VALUES(1403,'ほうれん草のソテー','Sauteed Spinach（Salt Oil Sauce）','炖煮菠菜（盐油酱）',182,200,223,1.199999999999999956,1,14,0,5,'AA03',1,1);
INSERT INTO menus VALUES(1404,'ポップコーンシュリンプ','Popcorn Shrimp','炸小甜虾',273,300,234,1.199999999999999956,1,14,0,6,'AA04',1,1);
INSERT INTO menus VALUES(1405,'エスカルゴのオーブン焼き','Grilled Escargots','蒜香焗蜗牛',364,400,220,1.300000000000000044,1,14,0,7,'AA05',1,1);
INSERT INTO menus VALUES(1406,'小エビのカクテル','Shrimp with "SAIZERIYA" Dressing','虾佐“SAIZERIYA”酱汁',255,280,126,2.299999999999999822,1,14,0,6,'AA06',1,1);
INSERT INTO menus VALUES(1407,'チョリソー（辛味ソーセージ）','Grilled Spicy Sausages','口利左香肠（辣猪肉香肠）',364,400,425,2.899999999999999912,1,14,0,8,'AA07',1,1);
INSERT INTO menus VALUES(1408,'蒸し鶏の香味ソース','Chicken with Flavored Vegetable Sauce（Limited to some stores）','鸡肉蔬菜酱（限部分店鋪）',255,280,192,2.399999999999999912,1,14,0,9,'AA08',1,1);
INSERT INTO menus VALUES(1410,'ムール貝のガーリック焼き','Grilled Mussels with Vegetable Salsa','蒜香烤蛤蜊',364,400,170,1.399999999999999912,1,14,0,10,'AA10',1,1);
INSERT INTO menus VALUES(1411,'アスパラガスの温サラダ','Asparagus with  Cheese ','芦笋配山核桃奶酪',273,300,80,0.6999999999999999556,1,14,0,1,'AA09',0,0);
INSERT INTO menus VALUES(1413,'キャロットラペ','Refreshing Carrot Salad','爽口胡萝卜沙拉',182,200,93,0.9000000000000000222,1,14,0,11,'AA13',1,1);
INSERT INTO menus VALUES(1414,'モッツァレラトマト','Buffalo Mozzarella Cheese &  Tomato','布法罗马苏里拉奶酪和番茄',391,430,255,0.2000000000000000111,1,14,0,12,'AA14',0,0);
INSERT INTO menus VALUES(1415,'カリッとポテト','Crispy Potatoes','酥烤马铃薯',255,280,389,2.100000000000000088,1,14,0,13,'AA15',0,1);
INSERT INTO menus VALUES(1416,'ポテトのグリル','Hashed Potato',NULL,273,300,NULL,NULL,1,14,0,13,'',1,0);
INSERT INTO menus VALUES(1417,'バッファローモッツァレラのカプレーゼ','Buffalo Mozzarella Cheese &  Tomato',NULL,391,430,NULL,NULL,1,14,0,12,'',1,1);
INSERT INTO menus VALUES(1422,'ハモン・セラーノ','Jamon Serrano','火腿塞拉诺',291,320,39,0.9000000000000000222,1,14,0,14,'AA22',1,1);
INSERT INTO menus VALUES(1423,'生ハムとバッファローモッツァレラの盛合せ','Jamon Serrano &  Buffalo Mozzarella Cheese','火腿塞拉诺和水牛马苏里拉奶酪',455,500,146,1,1,14,0,15,NULL,1,1);
INSERT INTO menus VALUES(1425,'柔らか青豆の温サラダ','Green Peas with  Cheese & Egg','鲜嫩青豆加佩科里诺干酪温色拉',182,200,216,1.399999999999999912,1,14,0,16,'AA06',1,1);
INSERT INTO menus VALUES(1435,'スイートコーン','Sweet Corn','',182,200,NULL,NULL,1,14,0,1,'',1,1);
INSERT INTO menus VALUES(1452,'アロスティチーニ（ラムの串焼き）(Wサイズ)','Arrosticini (Lamb skewers)','意式羊肉串（烤羊肉串）',728,800,NULL,NULL,1,14,0,4,'AA52',1,1);
INSERT INTO menus VALUES(2101,'ミラノ風ドリア','Meat Sauce Doria','米兰风肉酱多利亚饭',273,300,521,2.5,1,21,0,7,'DG01',1,1);
INSERT INTO menus VALUES(2103,'半熟卵のミラノ風ドリア','Meat Sauce & Coddled Egg Doria','半熟蛋配米兰风多利亚肉酱饭',319,350,604,2.700000000000000177,1,21,0,7,'DG03',1,1);
INSERT INTO menus VALUES(2106,'タラコとエビのドリア','Doria with “TARAKO”Sauce & Shrimp','鳕鱼籽虾焗饭',364,400,578,2.799999999999999823,1,21,0,7,'DG06',0,1);
INSERT INTO menus VALUES(2108,'焼チーズ ミラノ風ドリア','Doria with Meat Sauce & Cheese','多利亚肉酱和奶酪',319,350,652,2.899999999999999912,1,21,0,7,'DG08',1,1);
INSERT INTO menus VALUES(2109,'エビとタラコのクリームグラタン（全粒粉）','Gratin with “TARAKO”Sauce & Shrimp','TARAKO醬蝦焗烤',391,400,481,2.100000000000000088,1,21,0,7,NULL,0,1);
INSERT INTO menus VALUES(2110,'タラコとポップコーンシュリンプのドリア',NULL,NULL,364,400,NULL,NULL,1,21,0,7,NULL,1,0);
INSERT INTO menus VALUES(2115,'ポップコーンシュリンプとタラコのクリームグラタン（全粒粉）',NULL,NULL,391,430,NULL,NULL,1,21,0,7,NULL,1,0);
INSERT INTO menus VALUES(2203,'バッファローモッツァレラのマルゲリータピザ','Pizza with  Buffalo Mozzarella Cheese','水牛马苏里拉披萨',364,400,544,2.399999999999999912,1,22,0,17,'PZ02',1,1);
INSERT INTO menus VALUES(2204,'野菜ときのこのピザ','Pizza with Mushrooms & Vegetable Salsa','蔬菜蘑菇比萨',364,400,593,3.200000000000000177,1,22,0,17,'PZ04',1,1);
INSERT INTO menus VALUES(2206,'たっぷりコーンのピザ','Corn Pizza','足量甜玉米比萨',364,400,624,2.600000000000000088,1,22,0,17,'PZ06',1,1);
INSERT INTO menus VALUES(2208,'ソーセージピザ','Sausage Pizza','香肠比萨',364,400,710,4.099999999999999644,1,22,0,17,'PZ08',1,1);
INSERT INTO menus VALUES(2301,'タラコソースシシリー風',NULL,NULL,364,400,NULL,NULL,1,23,0,18,NULL,1,1);
INSERT INTO menus VALUES(2303,'ペペロンチーノ','Spaghetti Peperoncino','香辣意面',273,300,582,1.899999999999999912,1,23,0,18,'PA03',1,1);
INSERT INTO menus VALUES(2304,'パルマ風スパゲティ','Spaghetti with tomato＆pancetta','番茄培根意大利面',364,400,753,3.100000000000000088,1,23,0,18,'PA04',1,1);
INSERT INTO menus VALUES(2305,'カルボナーラ','Spaghetti Carbonara','奶油培根意面',455,500,799,3.100000000000000088,1,23,0,18,'PA05',1,1);
INSERT INTO menus VALUES(2306,'ミートソースボロニア風','Spaghetti Meat Sauce','意大利肉酱面',364,400,604,3.600000000000000088,1,23,0,18,'PA02',1,1);
INSERT INTO menus VALUES(2310,'スープ入り塩味ボンゴレ','Spaghetti"VONGOLE"','意大利面“VONGOLE”',455,500,872,2.5,1,23,0,18,'PA10',1,1);
INSERT INTO menus VALUES(2316,'半熟卵のミートソースボロニア風','Spaghetti Meat Sauce with Coddled Egg','半熟蛋配意大利肉酱面',410,450,673,3.799999999999999823,1,23,0,18,'PA12',1,1);
INSERT INTO menus VALUES(2317,'半熟卵のぺペロンチーノ','Spaghetti Peperoncino with soft-boiled egg','半熟蛋配香辣意面',319,350,665,2.100000000000000088,1,23,0,18,'PA17',1,1);
INSERT INTO menus VALUES(2320,'小エビのタラコソース','Spaghetti “TARAKO” Sauce with Shrimp','意大利面“TARAKO”虾酱',491,540,594,2.799999999999999823,1,23,0,18,'PA20',1,1);
INSERT INTO menus VALUES(2321,'きのことほうれん草のクリームスパゲッティ','Spaghetti with spinach and mushroom cream','菠菜蘑菇奶油意大利面',546,600,856,3.700000000000000177,1,23,0,18,NULL,1,1);
INSERT INTO menus VALUES(2325,'ペンネアラビアータ（全粒粉）','Whole wheat penne arrabbiata','全麥通心粉',391,400,444,2.799999999999999823,1,23,0,18,'PA25',1,1);
INSERT INTO menus VALUES(2328,'イカの墨入りセピアソース','Spaghetti al Nero di Seppia','墨鱼汁海鲜意面',455,500,603,1.800000000000000044,1,23,0,18,NULL,1,1);
INSERT INTO menus VALUES(2402,'若鶏のディアボラ風','Grilled Chicken with Chopped Vegetable Sauce','意式恶魔风嫩鸡排',455,500,673,2.799999999999999823,1,24,0,9,'MT02',1,1);
INSERT INTO menus VALUES(2403,'イタリアンハンバーグ','Italian Hamburg Steak','意大利风味汉堡牛排',455,500,670,3,1,24,0,14,'MT03',1,1);
INSERT INTO menus VALUES(2404,'柔らかチキンのチーズ焼き','Grilled Chicken with Cheese','意大利风芝士鸡排',455,500,725,2.799999999999999823,1,24,0,9,'MT04',1,1);
INSERT INTO menus VALUES(2406,'ハンバーグステーキ','Hamburg Steak(Demi-Glace Sauce)','汉堡牛排(半冰酱)',364,400,571,2.5,1,24,0,14,'MT01',1,1);
INSERT INTO menus VALUES(2407,'ディアボラ風ハンバーグ','Hamburg Steak with Chopped Vegetable Sauce','意式恶魔风汉堡牛排',455,500,618,3.100000000000000088,1,24,0,14,'MT07',1,1);
INSERT INTO menus VALUES(2413,'ラム（仔羊）と野菜のグリル','Grilled Lamb ＆ Vegetables','烤羊肉＆蔬菜',791,870,371,2.399999999999999912,1,24,0,14,'MT13',1,1);
INSERT INTO menus VALUES(2418,'ミックスグリル','Mixed Grill','混合烧烤',591,650,779,3.600000000000000088,1,24,0,14,NULL,1,1);
INSERT INTO menus VALUES(3101,'ライス','Rice','米饭',137,150,303,NULL,1,31,0,19,'RP01',1,1);
INSERT INTO menus VALUES(3102,'ラージライス','Large Rice','米饭',182,200,303,NULL,1,31,0,19,'RP02',1,1);
INSERT INTO menus VALUES(3103,'スモールライス','Small Rice','米饭',91,100,303,NULL,1,31,0,19,'RP03',1,1);
INSERT INTO menus VALUES(3104,'シナモンプチフォッカ','Petit Focaccia with Cinnamon Sugar','肉桂糖迷你香草面包',182,200,246,0.8000000000000000444,1,31,0,20,'RP04',0,0);
INSERT INTO menus VALUES(3106,'プチフォッカ','Petit Focaccias','迷你香草面包',137,150,214,0.8000000000000000444,1,31,0,20,'RP06',0,0);
INSERT INTO menus VALUES(3108,'ミニフィセル','Mini Ficelle','迷你法式面包',137,150,189,1,1,31,0,21,'RP08',0,0);
INSERT INTO menus VALUES(3109,'ガーリックトースト','Garlic Toast','蒜香烤面包',182,200,245,1.100000000000000089,1,31,0,21,'RP09',0,0);
INSERT INTO menus VALUES(3110,'フォッカチオ',NULL,NULL,137,150,NULL,NULL,1,31,0,20,NULL,1,1);
INSERT INTO menus VALUES(3111,'ガーリックフォッカチオ',NULL,NULL,182,200,NULL,NULL,1,31,0,20,NULL,1,1);
INSERT INTO menus VALUES(3112,'シナモンフォッカチオ',NULL,NULL,182,200,NULL,NULL,1,31,0,20,NULL,1,1);
INSERT INTO menus VALUES(3201,'ティラミス　クラシコ','Tiramisu','提拉米苏经典系列',273,300,229,0.1000000000000000055,1,32,0,28,'DE01',1,1);
INSERT INTO menus VALUES(3204,'ジェラート＆シナモンプチフォッカ','Petit Focaccias with Cinamon Sugar & Italian Gelato','肉桂糖迷你香草面包配意大利冰激淋',410,450,372,0.9000000000000000222,1,32,0,22,'DE04',0,0);
INSERT INTO menus VALUES(3205,'ミルクジェラート','Italian Gelato','意大利冰激淋',228,250,121,0.1000000000000000055,1,32,0,22,'DE05',1,1);
INSERT INTO menus VALUES(3206,'イタリアンプリン','Italian Cream Caramel','意大利布丁',228,250,216,0.1000000000000000055,1,32,0,23,'DE06',1,1);
INSERT INTO menus VALUES(3207,'チョコレートケーキ','Chocolate Cake','巧克力蛋糕',273,300,166,0.1000000000000000055,1,32,0,24,'DE07',1,1);
INSERT INTO menus VALUES(3212,'プリンとティラミス　クラシコの盛合せ','Tiramisu & Italian Cream Caramel','布丁配提拉米苏',455,500,445,0.2000000000000000111,1,32,0,23,'DE12',1,1);
INSERT INTO menus VALUES(3213,'トリフアイスクリーム','Ice Cream Truffle','松露冰激淋',319,350,164,0.1000000000000000055,1,32,0,22,'DE13',1,1);
INSERT INTO menus VALUES(3214,'ジェラート＆シナモンフォッカチオ',NULL,NULL,410,450,NULL,NULL,1,32,0,22,NULL,1,1);
INSERT INTO menus VALUES(3215,'コーヒーゼリー＆ミルクジェラート','Coffee Jelly with Italian Gelato','意大利冰激淋配咖啡果冻',319,350,165,0.1000000000000000055,1,32,0,22,'DE15',1,1);
INSERT INTO menus VALUES(3301,'生ビール キリン一番搾り　ジョッキ',NULL,NULL,364,400,NULL,NULL,1,33,1,25,'BR01',1,1);
INSERT INTO menus VALUES(3302,'生ビール キリン一番搾り　グラスビール',NULL,NULL,273,300,NULL,NULL,1,33,1,25,'BR02',1,1);
INSERT INTO menus VALUES(3303,'ノンアルコール アサヒドライゼロ',NULL,NULL,228,250,NULL,NULL,1,33,0,25,NULL,1,1);
INSERT INTO menus VALUES(3304,'サワー キリン氷結シチリア産レモン',NULL,NULL,319,350,NULL,NULL,1,33,1,25,'BR04',1,1);
INSERT INTO menus VALUES(3306,'グラッパ (30ml)',NULL,NULL,273,300,NULL,NULL,1,33,1,25,NULL,1,1);
INSERT INTO menus VALUES(3401,'グラスワイン (120ml)　赤',NULL,NULL,91,100,NULL,NULL,1,34,1,26,'WN01',1,1);
INSERT INTO menus VALUES(3402,'グラスワイン (120ml)　白',NULL,NULL,91,100,NULL,NULL,1,34,1,26,'WN02',1,1);
INSERT INTO menus VALUES(3403,'デカンタ (250ml)　赤',NULL,NULL,182,200,NULL,NULL,1,34,1,26,'WN03',1,1);
INSERT INTO menus VALUES(3404,'デカンタ (250ml)　白',NULL,NULL,182,200,NULL,NULL,1,34,1,26,'WN04',1,1);
INSERT INTO menus VALUES(3405,'デカンタ (500ml)　赤',NULL,NULL,364,400,NULL,NULL,1,34,1,26,'WN05',1,1);
INSERT INTO menus VALUES(3406,'デカンタ (500ml)　白',NULL,NULL,364,400,NULL,NULL,1,34,1,26,'WN06',1,1);
INSERT INTO menus VALUES(3407,'マグナム (1500ml)　赤',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN07',1,1);
INSERT INTO menus VALUES(3408,'マグナム (1500ml)　白',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN08',1,1);
INSERT INTO menus VALUES(3412,'ランブルスコロゼ【(ロゼ・発泡)甘口】',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN12',1,1);
INSERT INTO menus VALUES(3413,'ドンラファエロ【(白・発泡)辛口】',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN13',1,1);
INSERT INTO menus VALUES(3414,'ランブルスコセッコ【(赤・発泡)辛口】',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN14',1,1);
INSERT INTO menus VALUES(3415,'ベルデッキオ【(白)辛口】',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN15',1,1);
INSERT INTO menus VALUES(3416,'キャンティ【(赤)辛口】',NULL,NULL,1000,1100,NULL,NULL,1,34,1,27,'WN16',1,1);
INSERT INTO menus VALUES(3419,'キャンティ ルフィナ リゼルバ【(赤)辛口】',NULL,NULL,2000,2200,NULL,NULL,1,34,1,27,'WN19',1,1);
INSERT INTO menus VALUES(3901,'ティラミス　クラシコ','Tiramisu','提拉米苏经典系列',273,300,229,0.1000000000000000055,1,39,0,28,'DE01',1,1);
INSERT INTO menus VALUES(3904,'ジェラート＆シナモンプチフォッカ','Petit Focaccias with Cinamon Sugar & Italian Gelato','肉桂糖迷你香草面包配意大利冰激淋',410,450,372,0.9000000000000000222,1,39,0,22,'DE04',0,0);
INSERT INTO menus VALUES(3905,'ミルクジェラート','Italian Gelato','意大利冰激淋',228,250,121,0.1000000000000000055,1,39,0,22,'DE05',1,1);
INSERT INTO menus VALUES(3906,'イタリアンプリン','Italian Cream Caramel','意大利布丁',228,250,216,0.1000000000000000055,1,39,0,23,'DE06',1,1);
INSERT INTO menus VALUES(3907,'チョコレートケーキ','Chocolate Cake','巧克力蛋糕',273,300,166,0.1000000000000000055,1,39,0,24,'DE07',1,1);
INSERT INTO menus VALUES(3912,'プリンとティラミス　クラシコの盛合せ','Tiramisu & Italian Cream Caramel','布丁配提拉米苏',455,500,445,0.2000000000000000111,1,39,0,23,'DE12',1,1);
INSERT INTO menus VALUES(3913,'トリフアイスクリーム','Ice Cream Truffle','松露冰激淋',319,350,164,0.1000000000000000055,1,39,0,22,'DE13',1,1);
INSERT INTO menus VALUES(3914,'ジェラート＆シナモンフォッカチオ',NULL,NULL,410,450,NULL,NULL,1,32,0,22,NULL,1,1);
INSERT INTO menus VALUES(3915,'コーヒーゼリー＆ミルクジェラート','Coffee Jelly with Italian Gelato','意大利冰激淋配咖啡果冻',319,350,165,0.1000000000000000055,1,39,0,22,'DE15',1,1);
INSERT INTO menus VALUES(4301,'トッピング半熟卵','Coddled Egg for Topping','加半熟蛋',46,50,83,0.2000000000000000111,1,43,0,29,'TP01',1,1);
INSERT INTO menus VALUES(4304,'トッピング野菜ソース','Vegetable Paste','蔬菜酱',91,100,72,0.2999999999999999889,1,43,0,1,'TP04',1,1);
INSERT INTO menus VALUES(4307,'トッピング粉チーズ（グランモラビア）','Table Cheese','加芝士粉（摩拉維並干酪）',91,100,91,0.5999999999999999778,1,43,0,15,'TP07',1,1);
INSERT INTO menus VALUES(5101,'セットドリンクバー','Drink Bar (When Ordered with Food)','畅饮吧（畅饮吧套餐）',182,200,NULL,NULL,1,51,0,30,'DB01',1,1);
INSERT INTO menus VALUES(5102,'キッズドリンクバー','Drink Bar (Kids)','畅饮吧（儿童）',91,100,NULL,NULL,4,51,0,30,'DB02',1,1);
INSERT INTO menus VALUES(5103,'ドリンクバー単品','Drink Bar (Only)','畅饮吧（單品）',273,300,NULL,NULL,1,51,0,30,'DB03',1,1);
INSERT INTO menus VALUES(5305,'サイゼリヤ　ドレッシング (500ml)',NULL,NULL,463,500,NULL,NULL,1,53,0,31,NULL,1,1);
INSERT INTO menus VALUES(5306,'エクストラ・バージン・オリーブオイル (500ml)',NULL,NULL,1112,1200,NULL,NULL,1,53,0,31,NULL,1,1);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('categories',5);
INSERT INTO sqlite_sequence VALUES('icons',31);
COMMIT;
