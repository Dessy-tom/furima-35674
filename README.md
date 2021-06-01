## users

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :purchase_records

## items

| Column           | Type       | Options     |
|------------------|------------|-------------|
| name             | string     | null: false |
| text             | text       | null: false |
| category         | integer    | null: false |
| condition        | integer    | null: false |
| shipping_charges | integer    | null: false |
| shipping_area    | integer    | null: false |
| shipping_days    | integer    | null: false |
| price            | string     | null: false |
| user             | references |             |

## Association
- belong_to :users
- has_one :purchase_record

## destination

| Column        | Type    | Options     |
|---------------|---------|-------------|
| post_code     | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone number  | string  | null: false |

## Association
- belongs_to :purchase_record

## purchase_record

| Column | Type   | Options     |
|--------|--------|-------------|
| user   | string |             |
| item   | string |             |

## Association
- belong_to :user
- belong_to :item
- has_one :destination



