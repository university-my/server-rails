class KpiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    KpiService.import_groups
    KpiService.import_teachers
  end

end
