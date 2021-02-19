## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null: false  |
| email              | string  | null: false  |
| encrypted_password | string  | null: false  |
| first_name         | string  | null: false  |
| last_name          | string  | null: false  |
| first_name         | string  | null: false  |
| last_name          | string  | null: false  |
| birthday           | date    | null: false  | 

### Association
- has_many :items
- has_many :buyers


## items テーブル

| Column              | Type      | Options           |
| ------------------- | --------- | ----------------- |
| name                | string    | null: false       |
| description         | text      | null: false       |
| category_id         | integer   | null: false       | 
| item_status_id      | integer   | null: false       | 
| shipping_fee_id     | integer   | null: false       |
| shipping_address_id | integer   | null: false       |
| shipping_date_id    | integer   | null: false       |
| price               | integer   | null: false       |
| user                | reference | foreign_key: true |

### Association
- belongs_to :buyer
- belongs_to :user


## buyers テーブル

| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| user          | reference | foreign_key: true |
| item          | reference | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column              | Type      | Options           |
| ------------------- | --------- | ----------------- |
| postal_code         | string    | null: false       |
| shipping_address_id | string    | null: false       |
| municipalities      | string    | null: false       |
| address             | string    | null: false       |
| building_name       | string    |                   | 
| phone_number        | string    | null: false       |
| buyer               | reference | foreign_key: true |

### Association
- belongs_to :buyer
