class RenameSendToRecord < ActiveRecord::Migration[6.0]
  def change
    rename_table :sends, :records
  end
end
