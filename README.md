# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ---------   |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one :profile

## profiles テーブル

| Column           | Type    | Options     |
| ---------------- | ------  | ---------   |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- belongs_to :user

## items テーブル

| Column           | Type       | Options                        |
| --------------   | ------     | ---------                      |
| image            | text       | null: false                    |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| price            | integer    | null: false                    |
| category         | references | null: false, foreign_key :true |
| condition        | references | null: false, foreign_key :true |
| pay_shipping     | references | null: false, foreign_key :true |
| delivery_source  | references | null: false, foreign_key :true |
| preparation_day  | references | null: false, foreign_key :true |
| sell_user        | references | null: false, foreign_key :true |
| buy_user         | references | foreign_key :true              |

### Association

- belongs_to :category
- belongs_to :condition
- belongs_to :pay_shipping
- belongs_to :delivery_source
- belongs_to :preparation_day
- belongs_to :user
- has_one :purchase

## categories テーブル

| Column      | Type   | Options      |
| ----------- | ------ | ---------    |
| category    | string | null: false  |

### Association

- has_many :items

## conditions テーブル

| Column      | Type   | Options      |
| ----------- | ------ | ---------    |
| condition   | string | null: false  |

### Association

- has_many :items

## pay_shippings テーブル

| Column         | Type   | Options      |
| -----------    | ------ | ---------    |
| pay_shipping   | string | null: false  |

### Association

- has_many :items

## delivery_sources テーブル

| Column          | Type   | Options      |
| --------------- | ------ | ---------    |
| prefecture　　　 | string | null: false  |

### Association

- has_many :items

## preparation_days テーブル

| Column           | Type   | Options      |
| ---------------  | ------ | ---------    |
| preparation_days | string | null: false  |

### Association

- has_many :items

## purchase テーブル

| Column           | Type    | Options                           |
| ---------------- | ------  | ---------                         |
| address          | references | null: false, foreign_key :true |
| credit_card      | references | null: false, foreign_key :true |
| sell_user        | references | null: false, foreign_key :true |
| buy_user         | references | null: false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
- belongs_to :credit_card

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ---------   |
| postal_code   | integer | null: false |
| prefecture    | integer | null: false |
| city          | integer | null: false |
| house_number  | integer | null: false |
| building_name | integer | null: false |
| phone_number  | integer | null: false |

### Association

- has_many :purchases

## credit_cards テーブル

| Column           | Type    | Options     |
| ---------------- | ------  | ---------   |
| card_number      | integer | null: false |
| due_month        | integer | null: false |
| due_year         | integer | null: false |
| security_code    | integer | null: false |

### Association

- has_many :purchases