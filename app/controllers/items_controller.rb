class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :state_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, :sell_price)
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
