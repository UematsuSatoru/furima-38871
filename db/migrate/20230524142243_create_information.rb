class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.text  :Item_name, null: false
      t.text  :Item_description, null: false
      t.timestamps
    end
  end
end
