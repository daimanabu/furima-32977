require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#create' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@user_purchase).to be_valid
      end
    end

    context '内容に問題ある場合' do

      it 'postal_codeが空では保存できないこと' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it "cityが空では登録できないこと" do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "address_lineが空では登録できないこと" do
        @user_purchase.address_line = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address line can't be blank")
      end
      
      it "phone_numberが空では登録できないこと" do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @user_purchase.user_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @user_purchase.item_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end



      

      it "shipping_area_idが1では登録できないこと" do
        @user_purchase.shipping_area_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Shipping area can't be blank")
      end




      it "postal_codeにはハイフンが必要であること" do
        @user_purchase.postal_code = 1234567
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "電話番号にはハイフンは不要で、11桁以内であること" do
        @user_purchase.phone_number = 123-4567-8901
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end


  
      

    end

  end
end