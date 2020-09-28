class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @purchase = PurchaseAddress.new
    if user_signed_in? && current_user.id == @item.user_id || @item.purchase.present?
      move_to_root
    end
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return move_to_root
    else
      render 'index'
    end
  end

  private

  def move_to_root
    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:token, :postal_code, :delivery_source_id, :city,
                  :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
