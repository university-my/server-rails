class TeachersController < ApplicationController
  before_action :set_university
  before_action :set_teacher, only: [:show, :info]
  before_action :set_teacher_by_id, only: [:records]

  # GET /teachers
  # GET /teachers.json
  def index
    @query = params["query"]
    @teachers = if @query.present?
      @university.teachers
      .where(is_hidden: false)
      .where("lowercase_name LIKE ?", "%#{@query.downcase}%")
      .paginate(page: params[:page], per_page: 6)
    else
      @university.teachers
      .where(is_hidden: false)
      .paginate(page: params[:page], per_page: 6)
    end
    @all_teachers = @university.teachers.where(is_hidden: false)
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @records_url = records_university_teacher_url(@university.url, @teacher.id, :date => date_string_from(params))
  end

  # GET /teachers/1/records
  # GET /teachers/1/records.json
  def records
    if University.unavailable(@university)
      render partial: "records/unavailable", locals: {
        schedule_url: University.schedule_url_for(@university)
      }
      return
    end

    @date = date_from(params)
    @next_day_url = url_for(@date + 1.day)
    @previous_day_url = url_for(@date - 1.day)
    @form_url = university_teacher_url(@university.url, @teacher.friendly_id)

    lessons = Lesson.fetch_for_teacher(@teacher, @date)

    begin
      if lessons.blank? || @teacher.need_to_update_records
        @teacher.import_records(@date)
      end
    rescue StandardError => e
      ahoy.track "Records Error", message: e.message,
      university: @university.short_name,
      type: 'teacher',
      name: @teacher.name,
      date: @date
    end

    # Select one more time
    lessons = Lesson.fetch_for_teacher(@teacher, @date)

    if lessons.blank?

      # Try to find for the next days
      next_date = Lesson.next_date_for_teacher(@teacher, @date)
      next_date_url = next_date ? url_for(next_date) : nil

      render partial: 'records/empty', locals: {
        next_date: next_date,
        next_date_url: next_date_url
      }

    else
      render partial: "records/show", locals: {
        lessons: lessons,
        show_classroom: true,
        show_groups: true,
        show_teacher: false
      }
    end
  end

  # GET /universities/:university_url/teachers/:friendly_id/info
  def info
  end

  private

  def set_university
    @university = University.find_by!(url: params[:university_url])
  end

  def set_teacher
    @teacher = @university.teachers.where(is_hidden: false).friendly.find(params[:id])
  end

  def set_teacher_by_id
    @teacher = Teacher.find_by!(university_id: @university.id, id: params[:id])
  end

  def url_for(date)
    university_teacher_url(@university.url, @teacher.friendly_id, :date => date.strftime('%Y-%m-%d'))
  end

end
