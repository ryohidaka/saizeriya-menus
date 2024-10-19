package internal

import (
	"fmt"
	"os"
	"reflect"
	"strings"
)

// SQLのデータをMarkdown形式で出力する。
func SaveAsMarkdown(data []Menu, outputPath string) error {
	// Menu構造体からカラム名を取得
	menuType := reflect.TypeOf(Menu{})
	columns := make([]string, menuType.NumField())
	for i := 0; i < menuType.NumField(); i++ {
		columns[i] = menuType.Field(i).Tag.Get("md")
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
	for _, menu := range data {
		// 各列のデータを取り出しMarkdown形式にフォーマット
		row := fmt.Sprintf(
			"| %d | %s | %s | %s | %d | %d | %d | %.1f | %s | %s | %s | %s | %t | %s | %s | %t | %t | %t | %t |",
			menu.ID, menu.Name, menu.NameEn, menu.NameZh,
			menu.Price, menu.PriceWithTax, menu.Calorie, menu.Salt,
			menu.Category, menu.CategoryEn, menu.CategoryZh, menu.Genre, menu.IsAlcohol, menu.Icon, menu.PreID, menu.IsMetropolitan, menu.IsUrban, menu.IsWest, menu.IsEast,
		)

		// フォーマットされた行データをファイルに書き込む
		if _, err := file.WriteString(row + "\n"); err != nil {
			return fmt.Errorf("markdown行データの書き込みに失敗しました: %v", err)
		}
	}

	return nil
}
