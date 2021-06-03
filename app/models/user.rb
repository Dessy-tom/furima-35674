class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :nickname
    validates :family_name, format: /\A[ぁ-んァ-ン一-龥]/      
    validates :first_name, format: /\A[ぁ-んァ-ン一-龥]/       
    validates :family_name_kana, format: /\A[ァ-ヶー－]+\z/
    validates :first_name_kana, format: /\A[ァ-ヶー－]+\z/  
    validates :birth_day
  end      
end
