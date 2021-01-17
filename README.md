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
| price            | string     | null:false                   |
| condition_id     | string     | null:false                   |
| category_id      | string     | null:false                   |
| prefecture_id    | string     | null:false                   |
| shipping_fee-id  | string     | null:false                   |
| shipping_days_id | string     | null:false                   |
| seller_id        | references | null:false, foreign_key:true |
| image            |            |                              |

### Association

- belongs_to :user
- has_one :destination
- has_one :customer



# destinationテーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| post_code     | string     | null:false                   |
| prefecture    | references | null:false, foreign_key:true |
| city          | string     | null:false                   |
| address       | string     | null:false                   |
| building_name | string     |                              |
| phone_number  | string     | null:false                   |

### Association

- belongs_to :product
- belongs_to :user
- belongs_to :customer



# customerテーブル

| Column        | Type       | Options             |
| ------------- | ---------- | ------------------- |
| customer_id   | references | foreign_key: true   |
| products_id   | references | foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination

