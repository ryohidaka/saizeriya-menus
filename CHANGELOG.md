# Changelog

## [0.10.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.9.1...v0.10.0) (2025-03-06)


### Features

* メニュー名の変更に対応 ([a62b23d](https://github.com/ryohidaka/saizeriya-menus/commit/a62b23d7b5486c6753e43938057b1e251e978019))
* 不足しているメニューのデータを追加 ([f4aa0c0](https://github.com/ryohidaka/saizeriya-menus/commit/f4aa0c04fd1672573e50a8876b2247a8ed577bfc))
* 全国対象フラグと関西以西対象フラグを追加 ([f0d9ebd](https://github.com/ryohidaka/saizeriya-menus/commit/f0d9ebdc70f3730de4d96aa9ae9d67ae22f7ed6d)), closes [#22](https://github.com/ryohidaka/saizeriya-menus/issues/22)
* 全国対象フラグのデータを更新 ([5b3915f](https://github.com/ryohidaka/saizeriya-menus/commit/5b3915f5b25cbbb04bdc26e9866ba16a4fc9bfdd))
* 関西以西対象フラグのデータを更新 ([4c2d629](https://github.com/ryohidaka/saizeriya-menus/commit/4c2d629ca2126bb02637614b415b0214976c766b))


### Bug Fixes

* `is_all`を`is_east`に修正 ([3e0d30d](https://github.com/ryohidaka/saizeriya-menus/commit/3e0d30d3dce82333517847e78d5c9cc6400d5c7b))
* 地域フラグを削除 ([8628b05](https://github.com/ryohidaka/saizeriya-menus/commit/8628b0574ba4e5b34bbd87f0eb64010026575eed)), closes [#21](https://github.com/ryohidaka/saizeriya-menus/issues/21)

## [0.9.1](https://github.com/ryohidaka/saizeriya-menus/compare/v0.9.0...v0.9.1) (2025-03-05)


### Bug Fixes

* DBのバイナリファイルを削除 ([92a7b55](https://github.com/ryohidaka/saizeriya-menus/commit/92a7b55d78bb4ab537cdf753b024c4f4cce0b127))

## [0.9.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.8.0...v0.9.0) (2024-10-19)


### Features

* 2024年秋に新規追加されたメニューを追加 ([8ac531f](https://github.com/ryohidaka/saizeriya-menus/commit/8ac531f82f027fa7e1fd024965a7592a9a755ebd))
* 新メニューのアイコンを追加 ([5423197](https://github.com/ryohidaka/saizeriya-menus/commit/54231978e4b5b64511d4a58bb43017a90aedfa2e))

## [0.8.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.7.0...v0.8.0) (2024-10-19)


### Features

* データ出力処理に地域別フラグ対応を追加 ([6e091d7](https://github.com/ryohidaka/saizeriya-menus/commit/6e091d721cc0dae1f1517c68537c97cca1eb372e))
* メニュー一覧のis_eastのデータを登録 ([987640c](https://github.com/ryohidaka/saizeriya-menus/commit/987640cbfd2f7ca2f3c8af377a502d8b8cb712b9))
* メニュー一覧のis_metropolitanのデータを登録 ([f9d4232](https://github.com/ryohidaka/saizeriya-menus/commit/f9d4232a976bad44d4ba628842e155af35927d98))
* メニュー一覧のis_urbanのデータを登録 ([aa6e658](https://github.com/ryohidaka/saizeriya-menus/commit/aa6e658670a5453bd9322c9c68a9dfe3a146e307))
* メニュー一覧のis_westのデータを登録 ([c4bdec0](https://github.com/ryohidaka/saizeriya-menus/commit/c4bdec081a2a6a94eb174837b9ed1b4c65aa77dc))
* 地域別フラグを追加 ([181ce5a](https://github.com/ryohidaka/saizeriya-menus/commit/181ce5ae6e915bef78ef8b48ab9c3f5b24bdfa3a))

## [0.7.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.6.0...v0.7.0) (2024-09-02)


### Features

* データ出力処理のpre_id対応を追加 ([87d355a](https://github.com/ryohidaka/saizeriya-menus/commit/87d355af36c9dd47e3a996d4e8c3a0a55017c9ca))

## [0.6.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.5.0...v0.6.0) (2024-09-02)


### Features

* ジャンルマスタテーブルに旧IDカラム(`pre_id`)を追加 ([ae6045e](https://github.com/ryohidaka/saizeriya-menus/commit/ae6045ec0989b3dad663990c622d029065172f0f))
* ジャンル一覧の旧IDのデータを登録 ([722886d](https://github.com/ryohidaka/saizeriya-menus/commit/722886d10fc31e80118d7c7baa8507f649827d62))
* メニューマスタテーブルに旧IDカラム(`pre_id`)を追加 ([c160c4e](https://github.com/ryohidaka/saizeriya-menus/commit/c160c4eef88900996e195f651377dc195950e476))
* メニュー一覧の旧IDのデータを登録 ([020fd9b](https://github.com/ryohidaka/saizeriya-menus/commit/020fd9b93e9333add0b298503290d946054169ad))

## [0.5.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.4.0...v0.5.0) (2024-08-21)


### Features

* icons テーブルを追加 ([eda1b12](https://github.com/ryohidaka/saizeriya-menus/commit/eda1b12e7a2d2163db2b82bd6f319162bd73e184))
* menusテーブルにicon_idカラムを追加 ([3496b32](https://github.com/ryohidaka/saizeriya-menus/commit/3496b32cb82a85a083dfbeca4eb1f2908a32edfb))
* menusテーブルのicon_idのデータを登録 ([6ced83b](https://github.com/ryohidaka/saizeriya-menus/commit/6ced83b2424f49eb8c23aedd8f1addd8982b72da))
* アイコンデータを登録 ([c0fff9c](https://github.com/ryohidaka/saizeriya-menus/commit/c0fff9c2b62e232b3cb6819afe07134a07baf52c))
* データ出力処理のicon対応を追加 ([905b534](https://github.com/ryohidaka/saizeriya-menus/commit/905b534bf8927b8864374726854f2c0f8a1f29e7))

## [0.4.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.3.0...v0.4.0) (2024-08-20)


### Features

* is_alcohol カラムを追加 ([4dff004](https://github.com/ryohidaka/saizeriya-menus/commit/4dff004c85d912860fb36e36a2d57c42ce075c07))
* is_alcohol のデータを登録 ([d951987](https://github.com/ryohidaka/saizeriya-menus/commit/d9519878b7df93c8c23a1c5432158905c408676e))
* メニュー一覧取得クエリにis_alcohol カラムを追加 ([773d506](https://github.com/ryohidaka/saizeriya-menus/commit/773d50677f87500b2d53ec0b26f99e97c2633593))


### Bug Fixes

* IsAlcohol をBoolに変更 ([4ad7442](https://github.com/ryohidaka/saizeriya-menus/commit/4ad744290cd74cf607389e4983cca512238c5892))

## [0.3.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.2.0...v0.3.0) (2024-08-17)


### Features

* アルコール類のデータを登録 ([e30d794](https://github.com/ryohidaka/saizeriya-menus/commit/e30d7949193fa61a0240b36fb796235e7ef6fd58))

## [0.2.0](https://github.com/ryohidaka/saizeriya-menus/compare/v0.1.0...v0.2.0) (2024-08-17)


### Features

* ワインのデータを登録 ([efdcaf7](https://github.com/ryohidaka/saizeriya-menus/commit/efdcaf769e3f304d4adafa345252254855da5fb1))


### Bug Fixes

* ドリンクバーの英語表記と中国語表記を修正 ([cb43b8f](https://github.com/ryohidaka/saizeriya-menus/commit/cb43b8f8dde53e7595d2d17c75b7cc2f2eb6bc96))

## 0.1.0 (2024-08-17)


### Features

* DBデータ出力ツールを追加 ([9daac8e](https://github.com/ryohidaka/saizeriya-menus/commit/9daac8e428fbf2d92b230add6e9845f2fa7dc9ff))
* カテゴリマスタデータを登録 ([3c0317d](https://github.com/ryohidaka/saizeriya-menus/commit/3c0317d4d5dc3d63b4c8b1b5ba1deac651fcfbbc))
* カテゴリマスタテーブルを追加 ([9a8eccf](https://github.com/ryohidaka/saizeriya-menus/commit/9a8eccf305f6554f6615d668ee2d63ca71d13b4f))
* サラダのデータを登録 ([f4678c9](https://github.com/ryohidaka/saizeriya-menus/commit/f4678c99531a25d790077290fcba439b4ca987f7))
* ジャンルマスタテーブルを追加 ([1ef2c71](https://github.com/ryohidaka/saizeriya-menus/commit/1ef2c71e96f8fd2bc431b2537e4d199add3c22ad))
* スープのデータを登録 ([c51602e](https://github.com/ryohidaka/saizeriya-menus/commit/c51602e9303050f8fbd4f257a1e5fe838ef46ae2))
* データベースを新規作成 ([0d8a998](https://github.com/ryohidaka/saizeriya-menus/commit/0d8a998c31bc7b2a4d78f1f4d155f7b1ef293ffc))
* デザートのデータを登録 ([bd5735a](https://github.com/ryohidaka/saizeriya-menus/commit/bd5735a8d6dc0e1a825f6be00544110d3212eb95))
* トッピングのデータを登録 ([3a91bcf](https://github.com/ryohidaka/saizeriya-menus/commit/3a91bcf23fdae123f032823bd502ab1c494922d8))
* ドリア・グラタンのデータを登録 ([ee7b363](https://github.com/ryohidaka/saizeriya-menus/commit/ee7b363b761aded6ead4e416e006285076f47c62))
* ドリンクバーのデータを登録 ([27eaf1d](https://github.com/ryohidaka/saizeriya-menus/commit/27eaf1dc434c93f8c062bc0f45dfee669f37da10))
* パスタのデータを登録 ([2cabcfd](https://github.com/ryohidaka/saizeriya-menus/commit/2cabcfd982fa0e7b9fe88128bb59d4a7f0bcab08))
* ハンバーグのデータを登録 ([3a0d058](https://github.com/ryohidaka/saizeriya-menus/commit/3a0d058447c3897c5cedaff49424eb71fc93b7c5))
* ピザのデータを登録 ([7b50e97](https://github.com/ryohidaka/saizeriya-menus/commit/7b50e97d815a6beb952c5f916e86a00c61bf542b))
* メニュー一覧のインサートクエリ生成ツールを追加 ([8a52d97](https://github.com/ryohidaka/saizeriya-menus/commit/8a52d9710f1f4ffeecf8224612f5d648f4a83fcb))
* ライス・パンのデータを登録 ([309e299](https://github.com/ryohidaka/saizeriya-menus/commit/309e2993c1ab05526178ad0bc5b81434c80c9fba))
* 前菜・おつまみのデータを登録 ([5984c1d](https://github.com/ryohidaka/saizeriya-menus/commit/5984c1d7bf60cc8579f8e2d229f95bcc8098e21d))
* 商品マスタテーブルを追加 ([e9b7a24](https://github.com/ryohidaka/saizeriya-menus/commit/e9b7a24fb5c3efcaede2d4ec203d2187b1f436ae))


### Bug Fixes

* JSONファイルの構造を修正 ([9c45d2d](https://github.com/ryohidaka/saizeriya-menus/commit/9c45d2d226dbcad3912c470868fd4fb9ddcd0251))
* menusの name_en, name_zhのNOT NULL制約を解除 ([2e07751](https://github.com/ryohidaka/saizeriya-menus/commit/2e077516227c9e98945085f7a31eb07b5f6e85ba))
* ダンプファイルの配置ディレクトリを変更 ([eff987b](https://github.com/ryohidaka/saizeriya-menus/commit/eff987b2e9d22a0c4a4a4590ba5c99682783e59c))


### Miscellaneous Chores

* release 0.1.0 ([0deedaa](https://github.com/ryohidaka/saizeriya-menus/commit/0deedaa5b43587506421504515fe748b7edbd219))
