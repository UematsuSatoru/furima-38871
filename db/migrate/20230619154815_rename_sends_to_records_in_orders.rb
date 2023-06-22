class RenameSendToRecordInOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :send_id, :record_id
  end
end
