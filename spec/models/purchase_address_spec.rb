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
      expect(@purchase_address.errors.full_messages).to include('正確なカード情報を入力してください')
    end

    it 'postal_codeが空では登録できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('郵便番号を入力してください')
    end

    it 'postal_codeが半角ハイフンを含んだ正しい形式でないと登録できないこと' do
      @purchase_address.postal_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('郵便番号は正しい形式で入力してください')
    end

    it 'delivery_source_idを選択していないと登録できないこと' do
      @purchase_address.delivery_source_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('都道府県を選択してください')
    end

    it 'cityが空では登録できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('市区町村を入力してください')
    end

    it 'house_numberが空では登録できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('番地を入力してください')
    end

    it 'building_nameが空でも登録できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end

    it 'phone_numberが空では登録できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('電話番号を入力してください')
    end

    it 'phone_numberが11桁以上では登録できないこと' do
      @purchase_address.phone_number = '090123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
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
