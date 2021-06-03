class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    with_options format: /\A[ぁ-んァ-ン一-龥々]+\z/ do
      validates :family_name
      validates :first_name
    end
    with_options format: /\A[ァ-ヶー－]+\z/ do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
    validates :nickname
    validates :birth_day
  end
end
