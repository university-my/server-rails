class AddUuidToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :uuid, :string, default: ""
    add_index :groups, :uuid
  end
end
