class AddLogoToUniversities < ActiveRecord::Migration[7.0]
  def change
    add_column :universities, :logo_dark, :string, default: ""
    add_column :universities, :logo_light, :string, default: ""
  end
end
