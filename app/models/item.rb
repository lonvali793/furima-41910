class Item < ApplicationRecord
belongs_to :user
has_one :order
has_one_attached :image

validates :image, presence: true
validates :item_name, presence: true
validates :item_content, presence: true
validates :item_category_id, numericality: { other_than: 1 ,message: "can't be blank"} 
validates :item_condition_id, presence: true
validates :shipping_cost_id, presence: true
validates :prefecture_id, presence: true
validates :delivery_time_id, presence: true
validates :price, presence: true

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :delivery_time
end
