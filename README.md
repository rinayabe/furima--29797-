# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| name_kana| string | null: false |
| birthday | string | null: false |

### Association

- has_many :items

## items テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| image    | text      | null: false                    |
| item_name| string    | null: false                    |
| explain  | string    | null: false                    |
| detail   | string    | null: false                    |
| send     | string    | null: false                    |
| price    | string    | null: false                    |
| user     | references| null: false, foreign_key: true |

### Association

- belongs_to :users

## buyer テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| info     | string    | null: false                    |
| limit    | string    | null: false                    |
| code     | string    | null: false                    |

### Association

- has_one :place

## place テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| post_code    | string    | null: false                    |
| prefectures  | string    | null: false                    |
| city         | string    | null: false                    |
| address      | string    | null: false                    |
| building_name| string    |                                |
| phone_number | string    | null: false                    |

### Association

- belongs_to :buyer