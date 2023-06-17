class SendsRecordsForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :tel, :building, :user_id, :item_id

  validates_presence_of :post_code, :area_id, :city, :address, :tel, :user_id, :item_id

  def save
    ActiveRecord::Base.transaction do
      send = Send.create!(
        post_code: post_code,
        area_id: area_id,
        city: city,
        address: address,
        tel: tel,
        building: building
      )

      record = Record.create!(
        user_id: user_id,
        item_id: item_id,
        send_id: send.id
      )
    end
  end
end
