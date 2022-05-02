class Api::V1::TeachersController < ApplicationController

  # GET /api/v1/universities/:university_url/teachers
  def index
    university = University.find_by!(url: params[:university_url])
    @teachers = university.teachers.where(is_hidden: false)
  end

  # GET /api/v1/universities/:university_url/teachers/:id/records
  def records
    university = University.find_by!(url: params[:university_url])
    @teacher = Teacher.find_by!(university: university, id: params[:id])

    # Date
    pair_date = pair_date_from(params)

    @records = Lesson.where(university: university)
    .where(teacher_id: @teacher.id)
    .where(pair_start_date: pair_date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)

    begin
      if @records.blank?
        @teacher.import_records(pair_date)
      elsif @teacher.need_to_update_records
        @teacher.import_records(pair_date)
      end
    rescue PolitekService::DataNotFoundError => e
      ahoy.track "Failed to parse a schedule",
      university: university.short_name,
      type: 'teacher',
      name: @teacher.name
      
      render status: 500, json: {
        error: "Failed to parse a schedule",
        code: "1001"
      }
      return
    rescue StandardError => e
      ahoy.track "API Records Error", message: e.message,
      university: university.short_name,
      type: 'teacher',
      name: @teacher.name
    end

    # Select one more time
    @records = Lesson.where(university: university)
    .where(teacher_id: @teacher.id)
    .where(pair_start_date: pair_date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)
  end

end
