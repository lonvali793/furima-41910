# README

|Column|Type|Options|
|------|----|-------|

usersテーブル

nickname string  null:false unique
email  string  null:false
encrypted_password string  null:false
surname string  string null:false
firstname string  string null:false
surname_kana string  null:false
firstname_kana string  null:false
year integer null:false
month integer null:false
day integer null:false

items（商品情報）　テーブル

item_name string  null:false
item_content string  null:false
item_category string  null:false
item_condition string  null:false
shipping_cost string  null:false
delivery_region string  null:false
delivery_time string  null:false
price integer null:false
※imageはactivestorageで実装

orders テーブル

item_name reference null: false, foreign_key: true
user reference    null: false, foreign_key: true

adresses テーブル

postal_code,   string  null:false
 prefecture,    string  null:false
 city　string  null:false
 house_number　string  null:false
building_name　string  null:false

phone_number　string  null:false