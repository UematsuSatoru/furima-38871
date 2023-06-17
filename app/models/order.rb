class Order < ApplicationRecord

  has_one :send
  belongs_to :item
  
end
