class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to :index
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :introdunction, :price, :category_id, :condition_id,
      :pay_shipping_id, :delivery_source_id, :delivery_source_id, :image).merge(user_id: current_user.id)
  end
end
