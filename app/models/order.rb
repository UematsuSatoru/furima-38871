class Order < ApplicationRecord
  
  belongs_to :record
  belongs_to :item

end

