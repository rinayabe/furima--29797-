# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| first_name_kana | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| name         | string    | null: false                    |
| explain      | text      | null: false                    |
| category_id  | integer   | null: false                    |
| condition_id | integer   | null: false                    |
| fee_id       | integer   | null: false                    |
| area_id      | integer   | null: false                    |
| days_id      | integer   | null: false                    |
| price        | integer   | null: false                    |
| user         | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyers

## buyer テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | references| null: false, foreign_key: true |
| item     | references| null: false, foreign_key: true |

### Association

- belongs_to :place

## place テーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| post_code     | string    | null: false                    |
| prefectures_id| integer   | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| buyer         | references| null: false, foreign_key: true |

### Association

- belongs_to :buyer