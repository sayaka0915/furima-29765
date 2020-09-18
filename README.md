# テーブル設計

## users テーブル

| Column           | Type    | Options      |
| --------         | ------  | ---------    |
| nickname         | string  | null: false  |
| email            | string  | null: false  |
| password         | string  | null: false  |
| last_name        | string  | null: false  |
| first_name       | string  | null: false  |
| last_name_kana   | string  | null: false  |
| first_name_kana  | string  | null: false  |
| birth_year       | integer | null: false  |
| birth_month      | integer | null: false  |
| birth_day        | integer | null: false  |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type       | Options                        |
| --------------     | ------     | ---------                      |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| pay_shipping_id    | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| user               | integer    | null: false, foreign_key :true |

### Association

- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :pay_shipping
- belongs_to_active_hash :delivery_source
- belongs_to_active_hash :preparation_day
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type         | Options            |
| ---------------- | ---------    | ---------          |
| user             | references   | foreign_key :true  |
| item             | references   | foreign_key :true  |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ---------   |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association

- has_many :purchases
- belongs_to_active_hash :prefecture