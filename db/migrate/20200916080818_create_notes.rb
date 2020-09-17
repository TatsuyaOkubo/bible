class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :text
      t.boolean :trash
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
