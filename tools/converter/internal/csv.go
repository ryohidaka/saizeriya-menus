package internal

import (
	"encoding/csv"
	"fmt"
	"os"
	"reflect"
)

// SQLのデータをCSV形式で出力する。
func SaveAsCSV(data []Menu, outputPath string) error {
	// Menu構造体からカラム名を取得
	menuType := reflect.TypeOf(Menu{})
	columns := make([]string, menuType.NumField())
	for i := 0; i < menuType.NumField(); i++ {
		columns[i] = menuType.Field(i).Tag.Get("csv")
	}

	// 出力するCSVファイルを作成
	file, err := os.Create(outputPath)
	if err != nil {
		return fmt.Errorf("CSVファイルの作成に失敗しました: %v", err)
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// ヘッダーをCSVに書き込む
	if err := writer.Write(columns); err != nil {
		return fmt.Errorf("CSVヘッダーの書き込みに失敗しました: %v", err)
	}

	// 各行のデータをCSV形式で書き込む
	for _, menu := range data {
		// 各列のデータを文字列スライスに変換
		row := []string{
			fmt.Sprintf("%d", menu.ID),
			menu.Name,
			menu.NameEn,
			menu.NameZh,
			fmt.Sprintf("%d", menu.Price),
			fmt.Sprintf("%d", menu.PriceWithTax),
			fmt.Sprintf("%d", menu.Calorie),
			fmt.Sprintf("%.1f", menu.Salt),
			menu.Category,
			menu.CategoryEn,
			menu.CategoryZh,
			menu.Genre,
			fmt.Sprintf("%d", menu.IsAlcohol),
		}

		// 行データをCSVに書き込む
		if err := writer.Write(row); err != nil {
			return fmt.Errorf("CSV行データの書き込みに失敗しました: %v", err)
		}
	}

	return nil
}
