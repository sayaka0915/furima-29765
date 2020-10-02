class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  has_many :comments

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英字と数字の両方を含めて入力してください'

  match_str = /\A[ぁ-んァ-ン一-龥]/
  match_kana = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: match_str, message: 'は全角日本語で入力してください' }
    validates :last_name, format: { with: match_str, message:  'は全角日本語で入力してください' }
    validates :first_name_kana, format: { with: match_kana, message: 'は全角カタカナで入力してください' }
    validates :last_name_kana, format: { with: match_kana, message: 'は全角カタカナで入力してください' }
  end
end
