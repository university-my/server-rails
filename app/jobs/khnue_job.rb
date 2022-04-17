class KhnueJob < ApplicationJob
  queue_as :default

  def perform(*args)
    KhnueService.import_teachers
    KhnueService.import_groups
    KhnueService.import_auditoriums
  end

end
