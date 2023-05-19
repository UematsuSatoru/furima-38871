class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers" }
  with_options presence: true do
    validates :nickname
    validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters" }
    validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters" }
    validates :last_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
    validates :first_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
    validates :birth_date 
    
  end
end