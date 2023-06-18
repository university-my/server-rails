class GroupsController < ApplicationController
  before_action :set_university
  before_action :set_group, only: [:show, :info]
  before_action :set_group_by_id, only: [:records]

  # GET /universities/:university_url/groups
  def index
    @query = params['query']
    @groups = if @query.present?
      @university.groups
      .where(is_hidden: false)
      .where('lowercase_name LIKE ?', "%#{@query.downcase}%")
      .paginate(page: params[:page], per_page: 15)
    else
      @university.groups
      .where(is_hidden: false)
      .paginate(page: params[:page], per_page: 15)
    end
    @all_groups = @university.groups.where(is_hidden: false)
  end

  # GET /universities/:university_url/groups/:friendly_id
  def show
    @records_url = records_university_group_url(@university.url, @group.id, :date => date_string_from(params))
  end

  # GET /groups/1/records
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
    @form_url = university_group_url(@university.url, @group.friendly_id)

    lessons = Lesson.fetch_for_group(@group, @date)

    begin
      if lessons.blank? || @group.need_to_update_records
        @group.import_records(@date)
      end

    rescue PolitekService::DataNotFoundError => e
      service = University.service_for(@university.uid)
      timetable_url = service.constantize.send("timetable_url") # Call static method on class

      render partial: 'records/parsing_error', locals: {
        university: @university,
        pair_date: @date,
        timetable_url: timetable_url
      }
      return

    rescue StandardError => e
      Rails.logger.error(e)
      ahoy.track "Records Error", message: e.message,
      university: @university.short_name,
      type: 'group',
      name: @group.name,
      date: @date
    end

    # Select one more time
    lessons = Lesson.fetch_for_group(@group, @date)

    if lessons.blank?

      # Try to find for the next days
      next_date = Lesson.next_date_for_group(@group, @date)
      next_date_url = next_date ? url_for(next_date) : nil

      render partial: 'records/empty', locals: {
        next_date: next_date,
        next_date_url: next_date_url
      }

    else
      render partial: 'records/show', locals: {
        lessons: lessons,
        show_classroom: true,
        show_groups: false,
        show_teacher: true
      }
    end
  end

  # GET /universities/:university_url/groups/:friendly_id/info
  def info
  end

  private

  def set_university
    @university = University.find_by!(url: params[:university_url])
  end

  def set_group
    @group = @university.groups.friendly.find(params[:id])
  end

  def set_group_by_id
    @group = Group.find_by!(university_id: @university.id, id: params[:id])
  end

  def url_for(date)
    university_group_url(@university.url, @group.friendly_id, :date => date.strftime('%Y-%m-%d'))
  end

end
