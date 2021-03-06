require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('画像を入力してください')
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end

    it 'introductionが空では登録できないこと' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end

    it 'category_idを選択していないと登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'condition_idを選択していないと登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end

    it 'pay_shipping_idを選択していないと登録できないこと' do
      @item.pay_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end

    it 'delivery_source_idを選択していないと登録できないこと' do
      @item.delivery_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元地域を選択してください')
    end

    it 'preparation_day_idを選択していないと登録できないこと' do
      @item.preparation_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送日数を選択してください')
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格を入力してください')
    end

    it 'priceが299円以下では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格が範囲外です(¥300〜9,999,999)')
    end

    it 'priceが10,000,001円以上では登録できないこと' do
      @item.price = 10_000_001
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格が範囲外です(¥300〜9,999,999)')
    end

    it 'priceが全角数字では登録できないこと' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角数字で入力してください')
    end
  end
end