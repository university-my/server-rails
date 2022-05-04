class Lesson < ApplicationRecord

  # Associations
  belongs_to :auditorium, optional: true
  has_and_belongs_to_many :groups, optional: true
  belongs_to :teacher, optional: true
  belongs_to :university, optional: true
  belongs_to :discipline, optional: true

  def self.fetch(university, teacher_id, pair_date)
    Lesson.where(university: university)
    .where(teacher_id: teacher_id)
    .where(pair_start_date: pair_date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)
  end
end
