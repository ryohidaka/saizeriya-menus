package main

import (
	"fmt"
	"generate-menu-sql/internal/fetch"
	"generate-menu-sql/internal/sql"
	"generate-menu-sql/pkg/utils"
	"os"
)

func main() {
	// JSONファイルのURLを定義
	jsonUrls := map[string]string{
		"ja": "https://allergy.saizeriya.co.jp/view?lg=ja",
		"en": "https://allergy.saizeriya.co.jp/view?lg=en",
		"zh": "https://allergy.saizeriya.co.jp/view?lg=zh",
	}

	// 各言語のデータを格納するマップを作成
	allData := make(map[string][]fetch.Item)

	// 各URLからJSONデータを取得してパースする
	for lang, url := range jsonUrls {
		items, err := fetch.FetchJSON(url)
		if err != nil {
			fmt.Printf("URL '%s' のデータ取得エラー: %v\n", url, err)
			return
		}
		allData[lang] = items
	}

	// SQLファイルを作成する
	sqlFile, err := os.Create(".output/insert_menus.sql")
	if err != nil {
		fmt.Printf("ファイル作成エラー: %v\n", err)
		return
	}
	defer sqlFile.Close()

	// テーブル名を指定
	tableName := "menus"

	// 最大エントリ数を決定する（いずれかのJSONファイルの最大エントリ数）
	maxEntries := utils.MaxEntries(allData["ja"], allData["en"], allData["zh"])

	// INSERT文の準備をする
	insertStatement := sql.PrepareInsertStatement(tableName, maxEntries, allData)

	// INSERT文をSQLファイルに書き込む
	_, err = sqlFile.WriteString(insertStatement)
	if err != nil {
		fmt.Printf("ファイル書き込みエラー: %v\n", err)
		return
	}

	// 完了メッセージを出力する
	fmt.Println("SQL INSERT文が insert_menus.sql に書き込まれました")
}
