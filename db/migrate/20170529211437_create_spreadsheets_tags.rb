class CreateSpreadsheetsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :spreadsheets_tags do |t|
      t.integer :spreadsheet_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end

    add_index :spreadsheets_tags, :spreadsheet_id
    add_index :spreadsheets_tags, :tag_id
  end
end
