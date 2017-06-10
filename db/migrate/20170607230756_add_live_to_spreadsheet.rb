class AddLiveToSpreadsheet < ActiveRecord::Migration[5.1]
  def change
    add_column :spreadsheets, :live, :boolean, default: false
  end
end
