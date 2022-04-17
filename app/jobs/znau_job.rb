class ZnauJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ZnauService.import_groups
    ZnauService.import_teachers
  end

end
