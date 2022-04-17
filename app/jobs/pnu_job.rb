class PnuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    PnuService.import_groups
    PnuService.import_teachers
  end

end
