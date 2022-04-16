class AddUniversityToLessons < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :university, foreign_key: true
  end
end
