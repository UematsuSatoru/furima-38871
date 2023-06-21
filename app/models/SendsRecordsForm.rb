class SendsRecordsForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :tel, :building, :user_id, :item_id, :record_id, :token

  validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"}
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true }, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  
  def save
    record = Record.create(
      user_id: user_id,
      item_id: item_id,
    )
  
    self.record_id = record.id
  
    Order.create(
      post_code: post_code,
      city: city,
      address: address,
      tel: tel,
      building: building,
      area_id: area_id,
      record_id: record_id,
    )
  end
  
end

  
      
  