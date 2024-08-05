package sql

import (
	"fmt"
	"generate-menu-sql/internal/fetch"
	"strconv"
)

// PrepareInsertStatement は指定されたテーブル名、最大エントリ数、すべてのデータを基にINSERT文を生成する
func PrepareInsertStatement(tableName string, maxEntries int, allData map[string][]fetch.Item) string {
	// INSERT文の基本部分を作成
	insertStatement := fmt.Sprintf("INSERT INTO %s (id, name, name_en, name_zh, price, price_with_tax, calorie, salt, category_id, genre_id) VALUES ", tableName)

	values := ""
	for i := 0; i < maxEntries; i++ {
		nameJa := ""
		nameEn := ""
		nameZh := ""
		calorie := 0
		salt := 0.0
		priceWithTax := 0
		categoryId := 0

		// 日本語データが存在する場合、各フィールドを設定
		if i < len(allData["ja"]) {
			nameJa = allData["ja"][i].Name
			priceWithTax = parsePrice(allData["ja"][i].PriceWithTax)
			calorie = parseCalorie(allData["ja"][i].Calorie)
			salt = parseSalt(allData["ja"][i].Salt)
			var err error
			categoryId, err = getCategoryId(allData["ja"][i].Category)
			if err != nil {
				fmt.Printf("カテゴリID取得エラー: %v\n", err)
				categoryId = 0 // エラーが発生した場合、デフォルト値を設定
			}
		}
		// 英語データが存在する場合、英語名を設定
		if i < len(allData["en"]) {
			nameEn = allData["en"][i].Name
		}
		// 中国語データが存在する場合、中国語名を設定
		if i < len(allData["zh"]) {
			nameZh = allData["zh"][i].Name
		}

		// VALUES部分を構築
		values += fmt.Sprintf("(NULL, '%s', '%s', '%s', NULL, %d, %d, %.1f, %d, NULL)", nameJa, nameEn, nameZh, priceWithTax, calorie, salt, categoryId)

		// 最後のエントリ以外にはカンマを追加
		if i < maxEntries-1 {
			values += ", "
		}
	}

	// 完全なINSERT文を返す
	return insertStatement + values + ";"
}

// parsePrice は税抜価格を整数に変換する
func parsePrice(priceWithTax string) int {
	price, err := strconv.Atoi(priceWithTax)
	if err != nil {
		fmt.Printf("価格変換エラー: %v\n", err)
		return 0
	}
	return price
}

// parseCalorie はカロリーを整数に変換する
func parseCalorie(calorie string) int {
	calorieInt, err := strconv.Atoi(calorie)
	if err != nil {
		fmt.Printf("カロリー変換エラー: %v\n", err)
		return 0
	}
	return calorieInt
}

// parseSalt は塩分を浮動小数点数に変換する
func parseSalt(salt string) float64 {
	saltFloat, err := strconv.ParseFloat(salt, 32)
	if err != nil {
		fmt.Printf("塩分変換エラー: %v\n", err)
		return 0
	}
	return saltFloat
}

// getCategoryId はカテゴリ名を対応するIDに変換する
// カテゴリが存在しない場合はエラーを返却する
func getCategoryId(category string) (int, error) {
	switch category {
	case "グランド":
		return 1, nil
	case "ランチ":
		return 2, nil
	case "モーニング":
		return 3, nil
	case "キッズ":
		return 4, nil
	case "テイクアウト":
		return 5, nil
	default:
		return 0, fmt.Errorf("不明なカテゴリ: %s", category)
	}
}
