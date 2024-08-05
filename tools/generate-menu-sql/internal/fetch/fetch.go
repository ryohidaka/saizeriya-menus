package fetch

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

// Item はJSONデータ内の各アイテムを表す構造体
type Item struct {
	Name         string `json:"name"`             // メニュー名
	LanguageCode string `json:"languageCode"`     // 言語コード
	Calorie      string `json:"calorie"`          // エネルギー(カロリー)
	Salt         string `json:"salt"`             // 食塩相当量
	PriceWithTax string `json:"includigTaxPrice"` // 税込価格
	Category     string `json:"category"`         // カテゴリ
}

// FetchJSON は指定されたURLからJSONデータを取得し、パースしてアイテムのスライスを返却する
func FetchJSON(url string) ([]Item, error) {
	// URLからHTTP GETリクエストを送信する
	response, err := http.Get(url)
	if err != nil {
		return nil, fmt.Errorf("URLの取得中にエラーが発生しました: %v", err)
	}
	defer response.Body.Close()

	// レスポンスボディを読み込む
	data, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return nil, fmt.Errorf("レスポンスボディの読み込み中にエラーが発生しました: %v", err)
	}

	// JSONデータをパースするための構造体を定義
	var items struct {
		Body []Item `json:"body"` // JSON内のアイテムリスト
	}

	// JSONデータを構造体に変換する
	err = json.Unmarshal(data, &items)
	if err != nil {
		return nil, fmt.Errorf("JSONのパース中にエラーが発生しました: %v", err)
	}

	return items.Body, nil
}
