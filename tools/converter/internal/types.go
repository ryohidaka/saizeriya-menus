package internal

type Menu struct {
	ID           int     `json:"id" csv:"id" md:"id"`
	Name         string  `json:"name" csv:"name" md:"name"`
	NameEn       string  `json:"name_en" csv:"name_en" md:"name_en"`
	NameZh       string  `json:"name_zh" csv:"name_zh" md:"name_zh"`
	Price        int     `json:"price" csv:"price" md:"price"`
	PriceWithTax int     `json:"price_with_tax" csv:"price_with_tax" md:"price_with_tax"`
	Calorie      int64   `json:"calorie" csv:"calorie" md:"calorie"`
	Salt         float64 `json:"salt" csv:"salt" md:"salt"`
	Category     string  `json:"category" csv:"category" md:"category"`
	CategoryEn   string  `json:"category_en" csv:"category_en" md:"category_en"`
	CategoryZh   string  `json:"category_zh" csv:"category_zh" md:"category_zh"`
	Genre        string  `json:"genre" csv:"genre" md:"genre"`
	IsAlcohol    bool    `json:"is_alcohol" csv:"is_alcohol" md:"is_alcohol"`
	Icon         string  `json:"icon" csv:"icon" md:"icon"`
}
