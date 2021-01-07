class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @delivery_address = UserPurchase.new
  end


  def create
    @delivery_address = UserPurchase.new(user_purchase_params)
    @item = Item.find(params[:item_id])
    if @delivery_address.valid?
      pay_item
      @delivery_address.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:postal_code, :shipping_area_id, :city, :address_line, :building_name, :phone_number, :purchase_item_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(

      amount: @item.sell_price,
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end

end
