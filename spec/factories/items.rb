FactoryBot.define do
  factory :item do
    name { 'サンプル' }
    introduction { Faker::Lorem.sentence }
    price { 500 }
    category_id { 2 }
    condition_id { 2 }
    pay_shipping_id { 2 }
    delivery_source_id { 2 }
    preparation_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
