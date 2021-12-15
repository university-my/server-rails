class AddUuidToAuditorium < ActiveRecord::Migration[5.2]
  def change
    add_column :auditoriums, :uuid, :string, default: ""
    add_index :auditoriums, :uuid
  end
end
