# テーブル設計

## users テーブル
| Column            |Type   | Options     |
|nickname           |string | null:false unique|
|email              |string | null:false, unique: true|
|encrypted_password |string | null:false|
|surname string     |string | null:false|
|firstname string   |string | null:false|
|surname_kana       |string | null:false|
|firstname_kana     |string | null:false|
|year               |integer| null:false|
|month              |integer| null:false|
|day                |integer| null:false|
### Association

- has_many :items
-has_one:address

## items　テーブル
| Column        | Type    | Options     |
|item_name      |string   |null:false|
|item_content   |string   |null:false|
|item_category  |string   |null:false|
|item_condition |string   | null:false|
|shipping_cost  | string  | null:false|
|delivery_region|string   |null:false|
|delivery_time  | string  |null:false|
|price          |integer  | null:false|
※imageはactivestorageで実装

### Association
-belongs_to :user
-has_one :address
-has_one :order

## orders テーブル
| Column       | Type     | Options                          |
|item_name     |reference |null: false, foreign_key: true    |
|user          | reference|null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item

カード情報：card_number　DBには記載しない。
有効期限：　expiration_date　DBには記載しない。
セキュリティコード：　security_code　DBには記載しない。


##adresses テーブル
| Column       | Type   | Options     |
 |postal_code  |string  |null:false|
 |prefecture,  |string  |null:false|
 |city         |string  |null:false|
 |house_number |string  |null:false|
|building_name |string  |null:false|
|phone_number  |string  |null:false|

### Association
-belongs_to :item