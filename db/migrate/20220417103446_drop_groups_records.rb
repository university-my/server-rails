class DropGroupsRecords < ActiveRecord::Migration[5.2]
  def change
    drop_table :groups_records
  end
end
