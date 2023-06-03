class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :delivery_charge
  belongs_to :user

  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :category_id, :condition_id, :area_id, :delivery_charge_id, :number_id, :price, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Price is invalid. Input half-width characters' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Price is out of setting range' }
  
  has_one :record
  
  has_one_attached :image
  
end
