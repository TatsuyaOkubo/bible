class AddColumnNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :note_name, :string
  end
end
