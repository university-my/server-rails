class AddServerIdStringToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :server_id_string, :string, null: true
  end
end
