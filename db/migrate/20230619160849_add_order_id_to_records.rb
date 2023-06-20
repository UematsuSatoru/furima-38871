class AddOrderIdToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :order_id, :integer
  end
end
