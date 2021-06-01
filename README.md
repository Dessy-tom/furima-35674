## users

| Column           | Type   | Options     |
|------------------|--------|-------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |

### Association
- has_many :items
- has_many :purchase_record

## items

| Column           | Type   | Options     |
|------------------|--------|-------------|
| name             | string | null: false |
| text             | text   | null: false |
| image            |        | null: false |
| category         | string | null: false |
| condition        | string | null: false |
| shipping_charges | string | null: false |
| shipping_area    | string | null: false |
| shipping_days    | string | null: false |
| price            | string | null: false |

## Association
- belong_to :users
- has_one :purchase_record

## destination

| Column        | Type   | Options     |
|---------------|--------|-------------|
| post_code     | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string |             |
| phone number  | string | null: false |

## Association
- belong_to :purchase_record

## purchase_record

| Column | Type   | Options     |
|--------|--------|-------------|
| user   | string |             |
| item   | string |             |

## Association
- belong_to :users
- belong_to :items
- has_one :destination



