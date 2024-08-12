package internal

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"time"
)

// SQLのデータをJSON形式で出力する。
func SaveAsJSON(rows *sql.Rows, outputPath string) error {
	// カラム名を取得
	columns, err := rows.Columns()
	if err != nil {
		return fmt.Errorf("カラムの取得に失敗しました: %v", err)
	}

	// データを保存するスライスを初期化
	data := make([]map[string]interface{}, 0)

	// 各行のデータをスキャン
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

		// 行データをマップに保存
		rowMap := make(map[string]interface{})
		for i, colName := range columns {
			rowMap[colName] = columnValues[i]
		}

		// マップをスライスに追加
		data = append(data, rowMap)
	}

	// 現在の日時を取得
	lastUpdated := time.Now().Format(time.RFC3339)

	// 構造体を使用してJSONの順序を保証
	output := struct {
		Menus       []map[string]interface{} `json:"menus"`
		LastUpdated string                   `json:"last_updated"`
	}{
		Menus:       data,
		LastUpdated: lastUpdated,
	}

	// データをJSON形式に変換
	jsonData, err := json.MarshalIndent(output, "", "  ")
	if err != nil {
		return fmt.Errorf("データをJSONに変換する際に失敗しました: %v", err)
	}

	// ディレクトリが存在しない場合は作成
	if err := os.MkdirAll(filepath.Dir(outputPath), os.ModePerm); err != nil {
		return fmt.Errorf("ディレクトリの作成に失敗しました: %v", err)
	}

	// JSONデータをファイルに書き込む、ファイルが存在しない場合は作成
	err = os.WriteFile(outputPath, jsonData, 0644)
	if err != nil {
		return fmt.Errorf("JSONデータのファイル書き込みに失敗しました: %v", err)
	}

	return nil
}
