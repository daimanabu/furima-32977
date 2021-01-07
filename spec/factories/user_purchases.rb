FactoryBot.define do
  factory :user_purchase do
    token{ 'sampletoken' }
    
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    address_line { '青山' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  user_id {1}
  end
end
