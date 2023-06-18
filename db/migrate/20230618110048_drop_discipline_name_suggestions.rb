class DropDisciplineNameSuggestions < ActiveRecord::Migration[7.0]
  def change
    drop_table :discipline_name_suggestions
  end
end
