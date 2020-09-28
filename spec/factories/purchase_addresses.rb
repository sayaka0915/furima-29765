FactoryBot.define do
  factory :purchase_address do
    token { 'abcd1234' }
    postal_code { '111-1111' }
    delivery_source_id { 2 }
    city { '名古屋市' }
    house_number { '1-1-1' }
    building_name { '名古屋ハイツ' }
    phone_number { '09012345678' }
  end
end
