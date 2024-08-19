SELECT
    menus.id,
    menus.name,
    menus.name_en,
    menus.name_zh,
    menus.price,
    menus.price_with_tax,
    menus.calorie,
    menus.salt,
    categories.name AS category,
    categories.name_en AS category_en,
    categories.name_zh AS category_zh,
    genres.name AS genre,
    menus.is_alcohol
FROM
    menus
    JOIN categories on categories.id == menus.category_id
    JOIN genres on genres.id == menus.genre_id
ORDER BY
    menus.id ASC;