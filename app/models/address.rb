class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  belongs_to_active_hash :delivery_source

  # postal_code_regex = /\A[0-9]{3}-[0-9]{4}\z/
  # with_options presence: true do
  #   validates :postal_code, format { with: postal_code_regex, message: 'Input correctly' }
  #   validates :delivery_source_id, numericality: { other_than: 1, message: "can't be blank" }
  #   validates :city
  #   validates :house_number
  #   validates :phone_number
  # end
end
