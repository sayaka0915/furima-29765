require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it '重複したemailが存在すると保存できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordが5文字以下では保存できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordが半角英字のみの場合登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて入力してください')
    end

    it 'passwordが半角数字のみの場合登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて入力してください')
    end

    it 'passwordが存在していてもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を入力してください')
    end

    it 'first_nameが全角日本語ではない場合登録できないこと' do
      @user.first_name = 'ｽｽﾞｷ'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓は全角日本語で入力してください')
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名を入力してください')
    end

    it 'last_nameが全角日本語ではない場合登録できないこと' do
      @user.last_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名は全角日本語で入力してください')
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓(カナ)を入力してください')
    end

    it 'first_name_kanaが全角カタカナではない場合登録できないこと' do
      @user.first_name_kana = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓(カナ)は全角カタカナで入力してください')
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名(カナ)を入力してください')
    end

    it 'last_name_kanaが全角カタカナではない場合登録できないこと' do
      @user.last_name_kana = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('名(カナ)は全角カタカナで入力してください')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end