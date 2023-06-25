class AddServerIdStringToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :server_id_string, :string
  end
end
