# generate-menu-sql

- [アレルギー情報](https://allergy.saizeriya.co.jp/view?lg=ja)の JSON ファイルを解析し、SQL のインサートクエリを生成する。
- 以下のカラムのデータは JSON で提供されていないため、メニューと照らし合わせて指定する。
  - `id`
  - `price`
  - `genre_id`
