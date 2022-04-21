class HomepageController < ApplicationController
  def home
    @universities = University
    .where(is_hidden: false)
    .where.not(picture_dark: [nil, ""])
    .order('id')
    .all.in_groups_of(4, false)
  end
end
