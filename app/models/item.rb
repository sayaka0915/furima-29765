class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :pay_shipping
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :preparation_day
  has_one_attached :image
  belongs_to :user

  price_regex = /\A[0-9]+\z/
  with_options presence: true do
      validates :image
      validates :name
      validates :introduction
      validates :price, format: { with: price_regex, message: 'Half-width number' }

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :pay_shipping_id
      validates :delivery_source_id
      validates :preparation_day_id
    end
  end

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'Out of setting range'
  }
end
