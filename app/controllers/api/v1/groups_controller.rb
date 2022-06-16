class Api::V1::GroupsController < ApplicationController

  before_action :set_university
  before_action :set_group_by_id, only: [:records]

  # GET /api/v1/universities/:university_url/groups
  def index
    @groups = @university.groups.where(is_hidden: false)
  end

  # GET /api/v1/universities/:university_url/groups/:id/records
  def records
    if University.unavailable(@university)
      render status: 500, json: {
        error: "Failed to parse a schedule",
        code: "1001"
      }
      return
    end

    @date = pair_date_from(params)
    @records = Lesson.fetch_for_group(@group, @date)

    begin
      if @records.blank? || @group.need_to_update_records
        @group.import_records(@date)
      end
    rescue PolitekService::DataNotFoundError => e
      ahoy.track "Failed to parse a schedule",
      university: @university.short_name,
      type: 'group',
      name: @group.name,
      date: @date
      
      render status: 500, json: {
        error: "Failed to parse a schedule",
        code: "1001"
      }
      return
    rescue StandardError => e
      ahoy.track "API Records Error", message: e.message,
      university: @university.short_name,
      type: 'group',
      name: @group.name,
      date: @date
    end
    
    # Select one more time
    @records = Lesson.fetch_for_group(@group, @date)
  end

  private

  def set_university
    @university = University.find_by!(url: params[:university_url])
  end

  def set_group_by_id
    @group = Group.find_by!(university: @university, id: params[:id])
  end

end
