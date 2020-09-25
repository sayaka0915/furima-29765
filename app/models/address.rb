class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :delivery_source

  city_regex = /\A[ぁ-んァ-ン一-龥]/
  postal_code_regex = /\A[0-9]{3}-[0-9]{4}\z/
  phone_number_regex = /\A\d{11}\z/
  with_options presence: true do
    validates :postal_code, format: { with: postal_code_regex, message: 'Input correctly' }
    validates :delivery_source_id format: { other_then: 1, message: 'Select' }
    validates :city format: { with: city_regex, message: 'Full-width characters' }
    validates :house_number
    validates :phone_number format: { with: phone_number_regex }
  end
end
