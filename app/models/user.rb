class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

         validates :nickname, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
         validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
         validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
         end
         validates :katakana_surname, presence: true, format: { with: /\A[\p{Katakana}\p{Space}ー－]+\z/}
         validates :katakana_name, presence: true, format: { with: /\A[\p{Katakana}\p{Space}ー－]+\z/}
         validates :birth, presence: true
   has_many :items
   has_many :purchases


  


end
