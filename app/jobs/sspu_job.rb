class SspuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SspuService.import_groups
    SspuService.import_teachers
  end

end
