class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      return redirect_to item_path
    else
      render "edit"
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :sell_price).merge(user_id: current_user.id)
  end

end
