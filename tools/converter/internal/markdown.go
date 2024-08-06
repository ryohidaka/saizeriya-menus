package internal

import (
	"database/sql"
	"fmt"
	"os"
	"strings"
)

// SQLのデータをMarkdown形式で出力する。
func SaveAsMarkdown(rows *sql.Rows, outputPath string) error {
	// カラム名を取得
	columns, err := rows.Columns()
	if err != nil {
		// カラム取得に失敗した場合、エラーメッセージを返す
		return fmt.Errorf("カラムの取得に失敗しました: %v", err)
	}

	// 出力するMarkdownファイルを作成
	file, err := os.Create(outputPath)
	if err != nil {
		// ファイル作成に失敗した場合、エラーメッセージを返す
		return fmt.Errorf("markdownファイルの作成に失敗しました: %v", err)
	}
	defer file.Close()

	// Markdown形式のヘッダーを作成
	header := "| " + strings.Join(columns, " | ") + " |\n"
	separator := "| " + strings.Repeat("--- | ", len(columns)) + "\n"

	// ヘッダーをファイルに書き込む
	if _, err := file.WriteString(header); err != nil {
		return fmt.Errorf("markdownヘッダーの書き込みに失敗しました: %v", err)
	}
	// 区切り線をファイルに書き込む
	if _, err := file.WriteString(separator); err != nil {
		return fmt.Errorf("markdown区切り線の書き込みに失敗しました: %v", err)
	}

	// 各行のデータをMarkdown形式でファイルに書き込む
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

		// 行データをMarkdown形式にフォーマット
		row := "| "
		for _, value := range columnValues {
			if value != nil {
				row += fmt.Sprintf("%v", value)
			}
			row += " | "
		}

		// フォーマットされた行データをファイルに書き込む
		if _, err := file.WriteString(row + "\n"); err != nil {
			return fmt.Errorf("markdown行データの書き込みに失敗しました: %v", err)
		}
	}

	return nil
}
