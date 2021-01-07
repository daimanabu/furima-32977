class UserPurchase
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address_line, :building_name, :phone_number


  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters." }
    validates :token

    validates :user_id
    validates :item_id
    
  end

    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase_item = PurchaseItem.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, purchase_item_id: purchase_item.id)
  end

end