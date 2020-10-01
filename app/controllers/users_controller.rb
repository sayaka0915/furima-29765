class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @items = user.items.includes(:purchase).order('created_at DESC')
    @nickname = user.nickname
  end
end
