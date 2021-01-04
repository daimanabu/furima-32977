class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      return redirect_to item_path
    else
      render "edit"
    end
  end

  def destroy
    if @item.destroy
      return redirect_to root_path
    else
      render "show"
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :sell_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
