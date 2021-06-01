## users

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association
- has_many :items
- has_many :purchase_records

## items

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| name                | string     | null: false       |
| text                | text       | null: false       |
| category_id         | integer    | null: false       |
| condition_id        | integer    | null: false       |
| shipping_charge_id  | integer    | null: false       |
| shipping_area_id    | integer    | null: false       |
| shipping_day_id     | integer    | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

## Association
- belong_to :user
- has_one :purchase_record

## destination

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| post_code        | string     | null: false       |
| shipping_area_id | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| purchase_record  | references | foreign_key: true |


## Association
- belongs_to :purchase_record

## purchase_record

| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

## Association
- belong_to :user
- belong_to :item
- has_one :destination



