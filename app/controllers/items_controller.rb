class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = set_item
  end

  def destroy
    item = set_item
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
    :name, :introduction, :price, :category_id, :condition_id,
    :pay_shipping_id, :delivery_source_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end
end
