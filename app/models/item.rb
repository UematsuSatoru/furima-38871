class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :delivery_charge
  belongs_to :number
  belongs_to :user

  validates :Item_name, :Item_description, presence: true

  validates :category_id, :condition_id, :area_id, :delivery_charge_id, :number_id,  numericality: { other_than: 1 , message: "can't be blank"} 

  has_one :record
  
  has_one_attached :image
end
