require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it '全ての値が存在していれば登録できること' do
      expect(@comment).to be_valid
    end

    it 'textが空では登録ができないこと' do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('コメントを入力してください')
    end
  end
end
