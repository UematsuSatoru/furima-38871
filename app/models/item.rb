class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :delivery_charge
  belongs_to :user
  belongs_to :number
  

  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :category_id, :condition_id, :area_id, :delivery_charge_id, :number_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }  
  validates :price, presence: true
  
  
  has_one_attached :image
  has_one :order

end
