require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では登録できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角ハイフンを含んだ正しい形式でないと登録できないこと' do
      @purchase_address.postal_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'delivery_source_idを選択していないと登録できないこと' do
      @purchase_address.delivery_source_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Delivery source can't be blank")
    end

    it 'cityが空では登録できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空では登録できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'building_nameが空でも登録できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end

    it 'phone_numberが空では登録できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが11桁以上では登録できないこと' do
      @purchase_address.phone_number = '090123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが数字10桁であれば登録できること(固定電話、ハイフンなし)' do
      @purchase_address.phone_number = '0312345678'
      expect(@purchase_address).to be_valid
    end

    it 'phone_numberが数字11桁であれば登録できること(携帯電話、ハイフンなし)' do
      @purchase_address.phone_number = '09012345678'
      expect(@purchase_address).to be_valid
    end
  end
end
