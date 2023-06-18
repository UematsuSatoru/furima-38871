class SendsRecordsForm
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :post_code, :area_id, :city, :address, :tel, :building, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :area_id
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true }, length: { in: 10..11 } 
  end

  def save
    ActiveRecord::Base.transaction do
      order = Order.create!(
        post_code: post_code,
        area_id: area_id,
        city: city,
        address: address,
        tel: tel,
        building: building
      )

      send = Send.create!(
        user_id: user_id,
        item_id: item_id,
        order_id: order.id
      )
    end
  end
end
