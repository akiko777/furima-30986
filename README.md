# usersテーブル

| Column           | Type    | Options       |
| ---------------- | ------- | ------------- |
| nickname         | string  | null: false   |
| email            | string  | null: false   |
| password         | string  | null: false   |
| family_name      | string  | null: false   |
| first_name       | string  | null: false   |
| family_name_kana | string  | null: false   |
| first_name_kana  | string  | null: false   |
| birthday         | date    | null: false   |

### Association

- has_many :products
- has_many :customers
- has_many :destinations



# productsテーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| name             | string     | null:false                   |
| introduction     | text       | null:false                   |
| price            | integer    | null:false                   |
| condition_id     | integer    | null:false                   |
| category_id      | integer    | null:false                   |
| prefecture_id    | integer    | null:false                   |
| shipping_fee-id  | integer    | null:false                   |
| shipping_days_id | integer    | null:false                   |
| user             | references | null:false, foreign_key:true |
| customer         | references | null;false, foreign_key:true |
| image            |            |                              |

### Association

- belongs_to :user
- has_one :customer



# destinationテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| post_code     | string     | null:false                   |
| prefecture    | integer    | null:false, foreign_key:true |
| city          | string     | null:false                   |
| address       | string     | null:false                   |
| building_name | string     |                              |
| phone_number  | string     | null:false                   |
| customer      | references | null:false, foreign_key:true |

### Association

- belongs_to :customer



# customerテーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user          | references | null:false, foreign_key: true   |
| product       | references | null:false, foreign_key: true   |
| destination   | references | null:false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination

