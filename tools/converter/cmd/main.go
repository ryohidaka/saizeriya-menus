package main

import (
	"converter/internal"
	"flag"
	"log"
)

// CSV、JSON、Markdownのいずれかの形式でデータをエクスポートする
func main() {
	csvFlag := flag.Bool("csv", false, "CSV形式でエクスポート")
	jsonFlag := flag.Bool("json", false, "JSON形式でエクスポート")
	mdFlag := flag.Bool("md", false, "Markdown形式でエクスポート")

	flag.Parse()

	if !(*csvFlag || *jsonFlag || *mdFlag) {
		log.Fatalf("使用方法: %s --csv --json --md のいずれかを指定してください", flag.CommandLine.Name())
	}

	// 各フラグに応じてエクスポート処理を実行
	if *csvFlag {
		exportData("csv", "../../saizeriya.csv")
	}
	if *jsonFlag {
		exportData("json", "../../saizeriya.json")
	}
	if *mdFlag {
		exportData("md", "../../saizeriya.md")
	}
}

// exportData関数は、指定された形式（CSV、JSON、Markdown）でデータをエクスポートする
// formatには"csv", "json", "md"のいずれかを指定する
// outputPathはエクスポート先のファイルパス
func exportData(format string, outputPath string) {
	dbPath := "../../db/saizeriya.db"
	sqlFile := "./scripts/query.sql"

	rows, err := internal.ExecuteSQL(dbPath, sqlFile)
	if err != nil {
		log.Fatalf("SQLの実行に失敗しました: %v", err)
	}
	defer rows.Close()

	switch format {
	case "csv":
		err = internal.SaveAsCSV(rows, outputPath)
	case "json":
		err = internal.SaveAsJSON(rows, outputPath)
	case "md":
		err = internal.SaveAsMarkdown(rows, outputPath)
	}

	if err != nil {
		log.Fatalf("%sの保存に失敗しました: %v", format, err)
	}

	log.Printf("%s形式でのエクスポートが成功しました。\n", format)
}
