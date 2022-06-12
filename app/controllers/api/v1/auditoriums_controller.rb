class Api::V1::AuditoriumsController < ApplicationController

  before_action :set_university
  before_action :set_auditorium_by_id, only: [:records]

  # GET /api/v1/universities/:university_url/auditoriums
  def index
    @auditoriums = @university.auditorium.where(is_hidden: false)
  end

  # GET /api/v1/universities/:university_url/auditoriums/:id/records
  def records
    if University.unavailable(@university)
      render status: 500, json: {
        error: "Failed to parse a schedule",
        code: "1001"
      }
      return
    end

    @date = date_from(params)
    @records = Lesson.fetch_for_auditorium(@auditorium, @date)

    begin
      if @records.blank? || @auditorium.need_to_update_records
        @auditorium.import_records(@date)
      end
    rescue StandardError => e
      ahoy.track "API Records Error", message: e.message,
      university: @university.short_name,
      type: 'classroom',
      name: @auditorium.name,
      date: @date
    end

    # Select records one more time
    @records = Lesson.fetch_for_auditorium(@auditorium, @date)
  end

  private

  def set_university
    @university = University.find_by!(url: params[:university_url])
  end

  def set_auditorium_by_id
    @auditorium = Auditorium.find_by!(university_id: @university.id, id: params[:id])
  end

end
