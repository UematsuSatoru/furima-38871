class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.string :building, null: true
      t.integer :area_id, null: false
      t.references :record, null: false, foreign_key: true
    end
  end
end
