class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  postal_code_regex = /\A[0-9]{3}-[0-9]{4}\z/
  with_options presence: true do
    validates :postal_code, format: { with: postal_code_regex, message: 'は正しい形式で入力してください' }
    validates :delivery_source_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_source_id: delivery_source_id, city: city,
                   house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end