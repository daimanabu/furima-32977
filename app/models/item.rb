class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    
  end

  with_options presence: true, numericality: { with: /\A[0-9]+\z/, message: '全て数値（半角）を使用してください' } do
    validates :sell_price
  end
  validates :sell_price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_day_id

  end

  
end
