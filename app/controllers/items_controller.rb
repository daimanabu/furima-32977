class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.valid?
    if @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :sell_price).merge(user_id: current_user.id)
  end

end
