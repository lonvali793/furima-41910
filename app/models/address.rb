class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code , presence: true ,format: { with: /\A\d{3}-\d{4}\z/, message: "は 123-4567 の形式で入力してください" }
  validates :prefecture_id , presence: true
  validates :city , presence: true
  validates :house_number, presence: true
  validates :phone_number , presence: true , numericality: { only_integer: true, greater_than_or_equal_to: 9, 
  less_than_or_equal_to: 10, }
  validates :postal_code , presence: true
end
