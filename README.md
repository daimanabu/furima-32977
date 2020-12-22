# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | text   | null: false |
| last_name       | text   | null: false |
| first_name_kana | text   | null: false |
| last_name_kana  | text   | null: false |
| birthday_year   | string | null: false |
| birthday_month  | string | null: false |
| birthday_day    | string | null: false |

### Association

- has_many :items
- has_many :purchase_items
- has_one :delivery_addresses

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| item_category      | string     | null: false                    |
| item_state         | text       | null: false                    |
| item_shipping_fee  | string     | null: false                    |
| item_shipping_area | string     | null: false                    |
| item_shipping_days | string     | null: false                    |
| item_sell_price    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase_items

## purchase_items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| delivery_address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## delivery_addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| state/province/region | string     | null: false                    |
| city                  | string     | null: false                    |
| address_line          | string     | null: false                    |
| building_name         | string     | null: false                    |
| phone_number          | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
