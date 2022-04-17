class UgiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UgiService.import_groups
    UgiService.import_teachers
  end

end
