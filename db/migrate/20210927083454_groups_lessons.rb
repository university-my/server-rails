class GroupsLessons < ActiveRecord::Migration[5.2]
  def change

    create_table :groups_lessons, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :lesson, index: true
    end

  end
end
