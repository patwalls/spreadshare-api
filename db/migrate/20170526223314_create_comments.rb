class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :created_by
      t.integer :spreadsheet_id

      t.timestamps
    end

    add_index :comments, :created_by
    add_index :comments, :spreadsheet_id
  end
end
