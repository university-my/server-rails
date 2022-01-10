class AddUuidToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :uuid, :string, default: ""
    add_index :teachers, :uuid
  end
end
