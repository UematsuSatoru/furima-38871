class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :area, :delivery_charge, :number

  validates :Item_name, :Item_description, presence: true

  validates :category_id, :condition_id, :area_id, :delivery_charge_id, :number_id,  numericality: { other_than: 1 , message: "can't be blank"} 

  belongs_to :user

  has_one :record
  
  has_one_attached :image
end
