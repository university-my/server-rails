class HomepageController < ApplicationController
  def home
    @universities = University
    .where(is_hidden: false)
    .where.not(picture_dark: [nil, ""])
    .order('id')
    .all.in_groups_of(3, false)
  end
end
