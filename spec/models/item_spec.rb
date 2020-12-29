require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@item).to be_valid
      end
    end

    context '内容に問題ある場合' do

      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では登録できないこと" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "sell_priceが空では登録できないこと" do
        @item.sell_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price can't be blank")
      end



      it "category_id が1では登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "state_id が1では登録できないこと" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "shipping_fee_idが1では登録できないこと" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it "shipping_area_idが1では登録できないこと" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "shipping_day_idが1では登録できないこと" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      



      it "sell_priceの範囲が、300以下では登録できないこと" do
        @item.sell_price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price must be greater than 300")
      end
      it "sell_priceの範囲が、9999999以上では登録できないこと" do
        @item.sell_price = 100000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price must be less than 9999999")
      end

      it "sell_priceは半角数字でなければ保存できないこと" do
        @item.sell_price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price 全て数値（半角）を使用してください")
      end


      
    end
  end
end