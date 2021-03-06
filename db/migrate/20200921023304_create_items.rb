class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                null: false
      t.text       :introduction,        null: false
      t.string     :price,               null: false
      t.integer    :category_id,         null: false
      t.integer    :condition_id,        null: false
      t.integer    :pay_shipping_id,     null: false
      t.integer    :delivery_source_id,  null: false
      t.integer    :preparation_day_id,  null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
