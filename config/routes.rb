Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: "items#index"
  resources :items, only:[:new, :create, :show, :destroy, :edit, :update]
  resources :purchases, only:[:index, :create]
end
