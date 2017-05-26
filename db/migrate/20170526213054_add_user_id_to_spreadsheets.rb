class AddUserIdToSpreadsheets < ActiveRecord::Migration[5.1]
  def change
    add_column :spreadsheets, :user_id, :integer
    add_index :spreadsheets, :user_id
  end
end
