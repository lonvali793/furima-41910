class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number,
   :building_name,:phone_number, :user_id, :item_id,:token

  with_options presence: true do

  validates :postal_code ,format: { with: /\A\d{3}-\d{4}\z/, message: "は 123-4567 の形式で入力してください" }
  validates :prefecture_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  validates :city 
  validates :house_number
  validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: "は10〜11桁の数字で入力してください" }
  validates :user_id
  validates :item_id
  validates :token

  end

  def save
   
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end

end