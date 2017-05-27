class AddColumnsToSpreadsheets < ActiveRecord::Migration[5.1]
  def change
    add_column :spreadsheets, :description, :text
  end
end
