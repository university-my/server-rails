class AuditoriumsController < ApplicationController

  # GET /auditoriums
  def index
    @university = University.find_by!(url: params[:university_url])
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

  # GET /auditoriums/1
  def show
    @university = University.find_by!(url: params[:university_url])
    @auditorium = @university.auditorium.friendly.find(params[:id])

    # Date
    @pair_date = pair_date_string_from(params)
    @date = @pair_date.to_date
    @next_date = @date + 1.day
    @previous_date = @date - 1.day
  end

  # GET /auditoriums/1/records
  def records
    @university = University.find_by!(url: params[:university_url])
    @auditorium = Auditorium.find_by!(university_id: @university.id, id: params[:id])
    # Date
    pair_date = pair_date_from(params)
    @lessons = Lesson.where(university: @university)
    .where(auditorium: @auditorium)
    .where(pair_start_date: pair_date.all_day)
    .order(:pair_start_date)
    .order(:pair_name)

    begin
      if @lessons.blank?
        @auditorium.import_records(pair_date)
      elsif @auditorium.need_to_update_records
        @auditorium.import_records(pair_date)
      end
    rescue StandardError => e
      ahoy.track "Records Error", message: e.message,
      university: @university.short_name,
      type: 'classroom',
      name: @auditorium.name

    end

    # Select one more time
    @lessons = Lesson.where(university: @university)
                     .where(auditorium: @auditorium)
                     .where(pair_start_date: pair_date.all_day)
                     .order(:pair_start_date)
                     .order(:pair_name)

    if @lessons.blank?

      # Try to find for the next days
      next_lessons = Lesson.where(university: @university)
      .where(auditorium: @auditorium)
      .where("pair_start_date >= :date", date: pair_date.tomorrow.beginning_of_day)
      .order(:pair_start_date)
      .order(:pair_name)
      .limit(1)
      
      render partial: 'records/empty', locals: {
        next_lessons: next_lessons
      }
    else
      render partial: 'records/show', locals: {
        lessons: @lessons,
        university: @university,
        pair_date: pair_date,
        show_classroom: false,
        show_groups: true,
        show_teacher: true
      }
    end
  end

  # GET /universities/:university_url/auditoriums/:friendly_id/info
  def info
    @university = University.find_by!(url: params[:university_url])
    @auditorium = @university.auditorium.friendly.find(params[:id])
  end

end
