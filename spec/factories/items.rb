FactoryBot.define do
  factory :item do

item_name { Faker::Lorem.word }
item_content { Faker::Lorem.sentence }
item_category_id { Faker::Number.between(from: 2, to: 11) }
item_condition_id { Faker::Number.between(from: 2, to: 7) }
shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
prefecture_id { Faker::Number.between(from: 2, to: 47) }
delivery_time_id { Faker::Number.between(from: 2, to: 4) }
price { Faker::Number.between(from: 300, to: 9999999) }
association :user 

after(:build) do |item|
  item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
end
end
end
