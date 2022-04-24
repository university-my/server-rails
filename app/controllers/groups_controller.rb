class GroupsController < ApplicationController

  # GET /groups
  def index
    @university = University.find_by!(url: params[:university_url])
    @query = params['query']
    @groups = if @query.present?
      @university.groups
      .where(is_hidden: false)
      .where('lowercase_name LIKE ?', "%#{@query.downcase}%")
      .paginate(page: params[:page], per_page: 6)
    else
      @university.groups
      .where(is_hidden: false)
      .paginate(page: params[:page], per_page: 6)
    end
    @all_groups = @university.groups.where(is_hidden: false)
  end

  # GET /groups/1
  def show
    @university = University.find_by!(url: params[:university_url])
    @group = @university.groups.friendly.find(params[:id])

    # Date
    @pair_date = pair_date_string_from(params)
    @date = @pair_date.to_date
    @next_date = @date + 1.day
    @previous_date = @date - 1.day
  end

  # GET /groups/1/records
  def records
    @university = University.find_by!(url: params[:university_url])
    @group = Group.find_by!(university_id: @university.id, id: params[:id])

    # Date
    pair_date = pair_date_from(params)

    @lessons = LessonsHelper.fetch(@university, @group, pair_date)

    begin
      if @lessons.blank?
        @group.import_records(pair_date)

      elsif @group.need_to_update_records
        @group.import_records(pair_date)
      end
      
    rescue PolitekService::DataNotFoundError => e
      service = University.service_for(@university.uid)
      timetable_url = service.constantize.send("timetable_url") # Call static method on class

      render partial: 'records/parsing_error', locals: {
        university: @university,
        pair_date: pair_date,
        timetable_url: timetable_url
      }
      return
    end

    # Select one more time
    @lessons = LessonsHelper.fetch(@university, @group, pair_date)

    if @lessons.blank?
      # Try to find for the next days
      next_lessons = LessonsHelper.next(@university, @group, pair_date)
      render partial: 'records/empty', locals: {
        next_lessons: next_lessons
      }
    else
      render partial: 'records/show', locals: {
        lessons: @lessons,
        university: @university,
        pair_date: pair_date
      }
    end
  end

  # GET /universities/:university_url/groups/:friendly_id/info
  def info
    @university = University.find_by!(url: params[:university_url])
    @group = @university.groups.friendly.find(params[:id])
  end

end
