FactoryBot.define do
  factory :item do
    
    name { '商品の名前ですよ' }
    description { '商品紹介ですよ' }
    category_id { 2 }
    state_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    sell_price { 2000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
