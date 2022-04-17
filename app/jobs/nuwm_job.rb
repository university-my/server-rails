class NuwmJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NuwmService.import_groups
    NuwmService.import_teachers
  end

end
