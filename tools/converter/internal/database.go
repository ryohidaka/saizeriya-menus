package internal

import (
	"database/sql"
	"fmt"
	"io/ioutil"

	_ "github.com/mattn/go-sqlite3"
)

// 指定されたデータベースパスとSQLファイルを使用してクエリを実行する
func ExecuteSQL(dbPath, sqlFile string) (*sql.Rows, error) {
	// SQLiteデータベースを開く
	db, err := sql.Open("sqlite3", dbPath)
	if err != nil {
		return nil, fmt.Errorf("データベースを開く際に失敗しました: %v", err)
	}
	defer db.Close()

	// SQLファイルを読み込む
	query, err := ioutil.ReadFile(sqlFile)
	if err != nil {
		return nil, fmt.Errorf("SQLファイルの読み込みに失敗しました: %v", err)
	}

	// クエリを実行
	rows, err := db.Query(string(query))
	if err != nil {
		return nil, fmt.Errorf("クエリの実行に失敗しました: %v", err)
	}

	return rows, nil
}
