class Lesson < ApplicationRecord

  # Associations
  belongs_to :auditorium, optional: true
  has_and_belongs_to_many :groups, optional: true
  belongs_to :teacher, optional: true
  belongs_to :university, optional: true
  belongs_to :discipline, optional: true

  def self.fetch(university, teacher_id, date)
    Lesson.where(university: university)
    .where(teacher_id: teacher_id)
    .where(pair_start_date: date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)
  end

  def self.next_date_for_teacher(teacher, date)
    lesson = Lesson.select(:pair_start_date)
    .where(teacher: teacher)
    .where("pair_start_date >= :date", date: date.tomorrow.beginning_of_day)
    .order(:pair_start_date)
    .limit(1).first

    if lesson
      lesson.pair_start_date
    end
  end

  def self.fetch_for_auditorium(auditorium, date)
    Lesson.where(university: auditorium.university)
    .where(auditorium: auditorium)
    .where(pair_start_date: date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)
  end

  def self.next_date_for_auditorium(auditorium, date)
    lesson = Lesson.select(:pair_start_date)
    .where(auditorium: auditorium)
    .where("pair_start_date >= :date", date: date.tomorrow.beginning_of_day)
    .order(:pair_start_date)
    .limit(1).first

    if lesson
      lesson.pair_start_date
    end
    
  end

  def self.fetch_for_group(group, date)
    Lesson.joins(:groups)
    .where(university: group.university)
    .where('groups.id': group.id)
    .where(pair_start_date: date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)
  end

  def self.next_date_for_group(group, date)
    lesson = Lesson.joins(:groups)
    .where('groups.id': group.id)
    .where("pair_start_date >= :date", date: date.tomorrow.beginning_of_day)
    .order(:pair_start_date)
    .limit(1).first

    if lesson
      lesson.pair_start_date
    end
    
  end

end
