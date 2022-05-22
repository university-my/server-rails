class Api::V1::AuditoriumsController < ApplicationController

  # GET /api/v1/universities/:university_url/auditoriums
  def index
    university = University.find_by!(url: params[:university_url])
    @auditoriums = university.auditorium.where(is_hidden: false)
  end

  # GET /api/v1/universities/:university_url/auditoriums/:id/records
  def records
    university = University.find_by!(url: params[:university_url])
    @auditorium = Auditorium.find_by!(university_id: university.id, id: params[:id])

    if University.unavailable(university)
      render status: 500, json: {
        error: "Failed to parse a schedule",
        code: "1001"
      }
      return
    end

    pair_date = pair_date_from(params)

    @records = fetch_lessons(university, @auditorium, pair_date)

    begin
      if @records.blank? || @auditorium.need_to_update_records
        @auditorium.import_records(pair_date)
      end
    rescue StandardError => e
      ahoy.track "API Records Error", message: e.message,
      university: university.short_name,
      type: 'classroom',
      name: @auditorium.name
    end

    # Select records one more time
    @records = fetch_lessons(university, @auditorium, pair_date)
  end

  def fetch_lessons(university, auditorium, pair_date)
    Lesson.where(university: university)
          .where(auditorium: auditorium)
          .where(pair_start_date: pair_date.all_day)
          .order(:pair_start_date)
          .order(:pair_name)
  end

end
