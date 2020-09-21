class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :pay_shipping
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :preparation_day
  has_one_attached :image
end
