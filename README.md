## users テーブル

| Column     | Type    | Options   |
| ---------- | ------- | --------- |
| nickname   | string  | NOT NULL  |
| email      | string  | NOT NULL  |
| password   | string  | NOT NULL  |
| name       | string  | NOT NULL  |
| birthday   | string  | NOT NULL  | 

### Association
- has_many :items
- has_many :buyers


## items テーブル

| Column              | Type      | Options   |
| ------------------- | --------- | --------- |
| image               |           | NOT NULL  |
| item_name           | string    | NOT NULL  |
| item_description    | text      | NOT NULL  |
| category            | string    | NOT NULL  | 
| item_status         | string    | NOT NULL  | 
| shipping_fee        | string    | NOT NULL  |
| shipping_address    | string    | NOT NULL  |
| shipping_date       | string    | NOT NULL  |
| price               | integer   | NOT NULL  |
| user_id             | reference |           |

### Association
- has_many :buyers
- belongs_to :user


## buyers テーブル

| Column        | Type      | Options   |
| ------------- | --------- | --------- |
| card_number   | integer   | NOT NULL  |
| deadline      | integer   | NOT NULL  |
| security code | integer   | NOT NULL  |
| user_id       | reference |           |
| item_id       | reference |           |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column         | Type      | Options   |
| -------------  | --------- | --------- |
| postal_code    | integer   | NOT NULL  |
| prefectuures   | string    | NOT NULL  |
| municipalities | string    | NOT NULL  |
| address        | string    | NOT NULL  |
| building_name  | string    |           | 
| phone_number   | integer   | NOT NULL  |

### Association
- belongs_to :buyer
