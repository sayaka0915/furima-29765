class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  match_str = /\A[ぁ-んァ-ン一-龥]/
  match_kana = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: match_str, message: 'Full-width characters' }
    validates :last_name, format: { with: match_str, message:  'Full-width characters' }
    validates :first_name_kana, format: { with: match_kana, message: 'Full-width katakana characters' }
    validates :last_name_kana, format: { with: match_kana, message: 'Full-width katakana characters' }
  end
end
