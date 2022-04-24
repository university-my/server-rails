class ZhimJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ZhimService.import_groups
    ZhimService.import_teachers
  end

end
