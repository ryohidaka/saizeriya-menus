package internal

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"time"
)

// SQLのデータをJSON形式で出力する。
func SaveAsJSON(data []Menu, outputPath string) error {
	// 現在の日時を取得
	lastUpdated := time.Now().Format(time.RFC3339)

	// 構造体を使用してJSONの順序を保証
	output := struct {
		Menus       []Menu `json:"menus"`
		LastUpdated string `json:"last_updated"`
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
