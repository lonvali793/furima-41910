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
- has_one:address

## items　テーブル
| Column        | Type    | Options     |
|-------------------|--------|--------|
|item_name      |string   |null:false|
|item_content   |string   |null:false|
|item_category  |string   |null:false|
|item_condition |string   | null:false|
|shipping_cost  |string   | null:false|
|prefecture.id  |integer   |null:false|
|delivery_time  | string  |null:false|
|price          |integer  | null:false|
※imageはactivestorageで実装
※都道府県はprefecture.idでActivehashを用いて指定する

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column       | Type     | Options                          |
|-------------------|--------|--------|
|item_name     |references |null: false, foreign_key: true    |
|user          |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

カード情報：card_number　DBには記載しない。
有効期限：　expiration_date　DBには記載しない。
セキュリティコード：　security_code　DBには記載しない。


## addresses テーブル
| Column       | Type   | Options     |
|-------------------|--------|--------|
 |postal_code  |string  |null:false|
 |prefecture.id   |integer  |null:false|
 |city         |string  |null:false|
 |house_number |string  |null:false|
|building_name |string  
|phone_number  |string  |null:false|
|item_name     |references |null: false, foreign_key: true    |

※都道府県はprefecture.idでActivehashを用いて指定する
### Association
- belongs_to :order