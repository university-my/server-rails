class AuditoriumsController < ApplicationController
  before_action :set_university
  before_action :set_auditorium, only: [:show, :info]
  before_action :set_auditorium_by_id, only: [:records]

  # GET /universities/:university_url/auditoriums
  def index
    @query = params['query']
    @auditoriums = if @query.present?
     @university.auditorium
     .where(is_hidden: false)
     .where('lowercase_name LIKE ?', "%#{@query.downcase}%")
     .paginate(page: params[:page], per_page: 6)
   else
     @university.auditorium
     .where(is_hidden: false)
     .paginate(page: params[:page], per_page: 6)
   end
   @all_auditoriums = @university.auditorium.where(is_hidden: false)
  end

  # GET /universities/:university_url/auditoriums/:friendly_id
  def show
    @records_url = records_university_auditorium_url(@university.url, @auditorium.id, :date => date_string_from(params))
  end

  # GET /universities/:university_url/auditoriums/:id/records
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

    lessons = Lesson.fetch_for_auditorium(@auditorium, @date)

    begin
      if lessons.blank? || @auditorium.need_to_update_records
        @auditorium.import_records(@date)
      end
    rescue StandardError => e
      ahoy.track "Records Error", message: e.message,
      university: @university.short_name,
      type: 'classroom',
      name: @auditorium.name,
      date: @date
    end

    # Select one more time
    lessons = Lesson.fetch_for_auditorium(@auditorium, @date)

    if lessons.blank?

      # Try to find for the next days
      next_date = Lesson.next_date_for_auditorium(@auditorium, @date)
      next_date_url = next_date ? url_for(next_date) : nil

      render partial: 'records/empty', locals: {
        next_date: next_date,
        next_date_url: next_date_url
      }

    else
      render partial: 'records/show', locals: {
        lessons: lessons,
        show_classroom: false,
        show_groups: true,
        show_teacher: true
      }
    end
  end

  # GET /universities/:university_url/auditoriums/:friendly_id/info
  def info
  end

  private

  def set_university
    @university = University.find_by!(url: params[:university_url])
  end

  def set_auditorium
    @auditorium = @university.auditorium.friendly.find(params[:id])
  end

  def set_auditorium_by_id
    @auditorium = Auditorium.find_by!(university_id: @university.id, id: params[:id])
  end

  def url_for(date)
    university_auditorium_url(@university.url, @auditorium.friendly_id, :date => date.strftime('%Y-%m-%d'))
  end

end
