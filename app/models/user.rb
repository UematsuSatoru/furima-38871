class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  with_options presence: true do
    validates :nickname
    validates :last_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
    validates :first_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
    validates :last_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birth_date
    
  end
end