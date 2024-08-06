package internal

import (
	"database/sql"
	"encoding/csv"
	"fmt"
	"os"
)

// SQLのデータをCSV形式で出力する。
func SaveAsCSV(rows *sql.Rows, outputPath string) error {
	// カラム名を取得
	columns, err := rows.Columns()
	if err != nil {
		return fmt.Errorf("カラムの取得に失敗しました: %v", err)
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
	for rows.Next() {
		columnValues := make([]interface{}, len(columns))
		columnPointers := make([]interface{}, len(columns))

		// スキャンのためにポインタをセット
		for i := range columnPointers {
			columnPointers[i] = &columnValues[i]
		}

		// 行データのスキャン
		if err := rows.Scan(columnPointers...); err != nil {
			return fmt.Errorf("行データのスキャンに失敗しました: %v", err)
		}

		// 行データを文字列スライスに変換
		row := make([]string, len(columns))
		for i, value := range columnValues {
			if value != nil {
				row[i] = fmt.Sprintf("%v", value)
			}
		}

		// 行データをCSVに書き込む
		if err := writer.Write(row); err != nil {
			return fmt.Errorf("CSV行データの書き込みに失敗しました: %v", err)
		}
	}

	return nil
}
