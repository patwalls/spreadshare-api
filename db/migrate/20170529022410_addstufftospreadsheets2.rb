class Addstufftospreadsheets2 < ActiveRecord::Migration[5.1]
  def change
    add_column :spreadsheets, :format, :string
  end
end
