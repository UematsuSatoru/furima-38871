class Information < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :area, :delivery_charge, :number

  validates :Item_name, :Item_description, presence: true

  validates :category_id, :condition_id, :area_id, :delivery_charge_id, :number_id,  numericality: { other_than: 1 } 

end
