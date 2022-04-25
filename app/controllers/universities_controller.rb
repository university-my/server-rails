class UniversitiesController < ApplicationController

  # GET /universities
  # GET /universities.json
  def index
    per_page = 4
    @query = params["query"]
    if @query.present?
      @universities = University.where(is_hidden: false)
      .where("short_name LIKE ?", "%#{@query}%")
      .order('id')
      .paginate(page: params[:page], per_page: per_page)
    else
      @universities = University.where(is_hidden: false)
      .order('id')
      .paginate(page: params[:page], per_page: per_page)
    end

    @all_universities = University.where(is_hidden: false).order('id').all
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    @university = University.find_by!(url: params[:url])
  end

  def list
    @query = params["query"]
    if @query.present?
      @universities = University.where(is_hidden: false)
      .where("short_name LIKE ?", "%#{@query}%")
      .order('id')
    else
      @universities = University.where(is_hidden: false).order('id').all
    end

    @all_universities = University.where(is_hidden: false).order('id').all
  end
end
