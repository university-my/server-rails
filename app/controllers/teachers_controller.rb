class TeachersController < ApplicationController

  # GET /teachers
  # GET /teachers.json
  def index
    @university = University.find_by!(url: params[:university_url])
    per_page = 6
    @query = params["query"]
    if @query.present?
      @teachers = @university.teachers
        .where(is_hidden: false)
        .where("lowercase_name LIKE ?", "%#{@query.downcase}%")
        .paginate(page: params[:page], per_page: per_page)
    else
      @teachers = @university.teachers
        .where(is_hidden: false)
        .paginate(page: params[:page], per_page: per_page)
    end
    @all_teachers = @university.teachers.where(is_hidden: false)
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @university = University.find_by!(url: params[:university_url])
    @teacher = @university.teachers
    .where(is_hidden: false)
    .friendly
    .find(params[:id])

    # Date
    @pair_date = pair_date_string_from(params)
    @date = @pair_date.to_date
    @next_date = @date + 1.day
    @previous_date = @date - 1.day
  end

  # GET /teachers/1/records
  # GET /teachers/1/records.json
  def records
    @university = University.find_by!(url: params[:university_url])
    @teacher = Teacher.find_by!(university_id: @university.id, id: params[:id])

    pair_date = pair_date_from(params)

    if @university == University.khnue
      render partial: "records/khnue"
      return
    end

    @lessons = Lesson.fetch(@university, @teacher.id, pair_date)

    begin
      if @lessons.blank? || @teacher.need_to_update_records
        @teacher.import_records(pair_date)
      end
    rescue StandardError => e
      ahoy.track "Records Error", message: e.message,
      university: @university.short_name,
      type: 'teacher',
      name: @teacher.name,
      pair_date: pair_date
    end

    # Select one more time
    @lessons = Lesson.fetch(@university, @teacher.id, pair_date)

    if @lessons.blank?

      # Try to find for the next days
      next_lessons = Lesson.where(university: @university)
      .where(teacher_id: @teacher.id)
      .where("pair_start_date >= :date", date: pair_date.tomorrow.beginning_of_day)
      .order(:pair_start_date)
      .order(:pair_name)
      .limit(1)

      render partial: "records/empty", locals: {
        next_lessons: next_lessons
      }
    else
      render partial: "records/show", locals: {
        lessons: @lessons,
        university: @university,
        pair_date: pair_date,
        show_classroom: true,
        show_groups: true,
        show_teacher: false
      }
    end
  end

  # GET /universities/:university_url/teachers/:friendly_id/info
  def info
    @university = University.find_by!(url: params[:university_url])
    @teacher = @university.teachers
    .where(is_hidden: false)
    .friendly
    .find(params[:id])
  end

end
