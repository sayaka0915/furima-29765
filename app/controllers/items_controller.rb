class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.with_attached_image
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(
    :name, :introduction, :price, :category_id, :condition_id,
    :pay_shipping_id, :delivery_source_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end
end
