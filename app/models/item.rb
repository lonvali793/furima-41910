class Item < ApplicationRecord
belongs_to :user
has_one :order
has_one_attached :image

validates :image, presence: true
validates :item_name, presence: true
validates :item_content, presence: true
validates :item_category_id, presence: true
validates :item_condition_id, presence: true
validates :shipping_cost_id, presence: true
validates :prefecture_id, presence: true
validates :delivery_time_id, presence: true
validates :price, presence: true
end
