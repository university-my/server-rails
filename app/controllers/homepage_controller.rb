class HomepageController < ApplicationController
  def home
    @universities = University.where(is_hidden: false).order('id').limit(3)
  end
end
