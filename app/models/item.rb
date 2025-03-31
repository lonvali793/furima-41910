class Item < ApplicationRecord
belongs_to :user
#has_one :order
has_one_attached :image

validates :image, presence: true 
validates :item_name, presence: true, length: { minimum: 1, maximum: 40 }
validates :item_content, presence: true, length: { minimum: 1, maximum: 1000 }
validates :item_category_id, numericality: { other_than: 1 ,message: "can't be blank"} 
validates :item_condition_id, numericality: { other_than: 1 ,message: "can't be blank"} 
validates :shipping_cost_id, numericality: { other_than: 1 ,message: "can't be blank"} 
validates :prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"} 
validates :delivery_time_id, numericality: { other_than: 1 ,message: "can't be blank"} 
validates :price, presence: true, numericality: { only_integer: true, 
greater_than_or_equal_to: 300, 
less_than_or_equal_to: 9999999, message: 'is invalid.enter the price in half-width alphanumeric characters, within the range of 300 yen to 9,999,999 yen.'
}

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :delivery_time
end
