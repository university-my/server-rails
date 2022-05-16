class AddShowInfoToUniversity < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :show_info, :boolean, :default => false
  end
end
