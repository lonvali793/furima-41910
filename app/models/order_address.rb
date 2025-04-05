class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name,:phone_number, :user_id

  with_options presence: true do
    
  validates :postal_code , presence: true ,format: { with: /\A\d{3}-\d{4}\z/, message: "は 123-4567 の形式で入力してください" }
  validates :prefecture_id , presence: true
  validates :city , presence: true
  validates :house_number, presence: true
  validates :phone_number , presence: true , numericality: { only_integer: true, greater_than_or_equal_to: 9, 
  less_than_or_equal_to: 10, }

end