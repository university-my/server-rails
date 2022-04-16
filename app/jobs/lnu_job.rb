class LnuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    LnuService.import_groups
    LnuService.import_teachers
  end

end
