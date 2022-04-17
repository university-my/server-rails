class UbsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UbsService.import_groups
    UbsService.import_teachers
  end

end
