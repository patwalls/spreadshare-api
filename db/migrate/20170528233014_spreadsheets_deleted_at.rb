class SpreadsheetsDeletedAt < ActiveRecord::Migration[5.1]
  def change
    add_column :spreadsheets, :deleted_at, :datetime
  end
end
