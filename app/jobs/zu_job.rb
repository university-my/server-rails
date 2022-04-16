class ZuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ZuService.import_groups
    ZuService.import_teachers
  end

end
