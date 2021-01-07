class DeliveryAddress < ApplicationRecord
  belongs_to :purchase_item
end
