# テーブル設計

## users テーブル
| Column            |Type   | Options     |
|-------------------|--------|--------|
|nickname           |string | null:false|
|email              |string | null:false, unique: true|
|encrypted_password |string | null:false|
|surname            |string | null:false|
|firstname          |string | null:false|
|surname_kana       |string | null:false|
|firstname_kana     |string | null:false|
|birthday           |date   | null:false|

### Association

- has_many :items
- has_many :orders

## items　テーブル
| Column        | Type    | Options     |
|-------------------|--------|--------|
|item_name          |string   |null:false|
|item_content       |text   |null:false|
|item_category_id  |integer   |null:false|
|item_condition_id |integer   | null:false|
|shipping_cost_id  |integer  | null:false|
|prefecture_id     |integer   |null:false|
|delivery_time_id  |integer  |null:false|
|price            |integer  | null:false|
|user              |references |null: false, foreign_key: true |



### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column       | Type     | Options                          |
|-------------------|--------|--------|
|item          |references |null: false, foreign_key: true    |
|user          |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

カード情報：card_number　DBには記載しない
有効期限：　expiration_date　DBには記載しない。
セキュリティコード：　security_code　DBには記載しない。


## addresses テーブル
| Column       | Type   | Options     |
|-------------------|--------|--------|
 |postal_code  |string  |null:false|
 |prefecture_id   |integer  |null:false|
 |city         |string  |null:false|
 |house_number |string  |null:false|
|building_name |string  
|phone_number  |string  |null:false|
|order          |references |null: false, foreign_key: true |


### Association
- belongs_to :order