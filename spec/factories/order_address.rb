FactoryBot.define do
  factory :order_address do
    postal_code     { '123-4567' }
    prefecture_id   { 1 }
    city            { '中山市' }
    house_number    { '中田1-1-1' }
    building_name   { '中川ビル101' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end