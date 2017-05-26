class CreateSpreadsheets < ActiveRecord::Migration[5.1]
  def change
    create_table :spreadsheets do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
