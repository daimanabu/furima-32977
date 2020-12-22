# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday_year   | string | null: false |
| birthday_month  | string | null: false |
| birthday_day    | string | null: false |

### Association

- has_many :items
- has_many :purchase_items
- has_one :delivery_addresses

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| item_name          | string | null: false |
| item_description   | string | null: false |
| item_category      | string | null: false |
| item_state         | string | null: false |
| item_shipping_fee  | string | null: false |
| item_shipping_area | string | null: false |
| item_shipping_days | string | null: false |
| item_sell_price    | string | null: false |
| user_id            | string | null: false |

### Association

- belongs_to :user
- has_many : purchase_items

## purchase_items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| card_information     | references | null: false, foreign_key: true |
| effective_data_month | references | null: false, foreign_key: true |
| effective_data_year  | references | null: false, foreign_key: true |
| security_code        | references | null: false, foreign_key: true |
| user_id              | references | null: false, foreign_key: true |
| item_id              | references | null: false, foreign_key: true |
| delivery_address_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery_addresses

## delivery_addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     |                                |
| state/province/region | references | null: false, foreign_key: true |
| city                  | references | null: false, foreign_key: true |
| address_line          | string     | null: false                    |
| building_name         | string     | null: false                    |
| phone_number          | string     | null: false                    |
| user_id               | string     | null: false                    |
| purchase_items_id     | string     | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_item
