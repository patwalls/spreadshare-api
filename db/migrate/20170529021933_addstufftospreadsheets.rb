class Addstufftospreadsheets < ActiveRecord::Migration[5.1]
  def change
    add_column :spreadsheets, :category, :string
  end
end
