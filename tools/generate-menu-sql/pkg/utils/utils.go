package utils

import "generate-menu-sql/internal/fetch"

// MaxEntries は複数のアイテムリストの中で最も多いエントリ数を返却する
func MaxEntries(lists ...[]fetch.Item) int {
	max := 0
	// 各リストをチェックして、最大のエントリ数を見つける
	for _, list := range lists {
		if len(list) > max {
			max = len(list)
		}
	}
	return max
}
