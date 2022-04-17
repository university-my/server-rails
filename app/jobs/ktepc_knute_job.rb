class KtepcKnuteJob < ApplicationJob
  queue_as :default

  #  Not worked
  def perform(*args)
    KtepcKnuteService.import_groups
    KtepcKnuteService.import_teachers
  end

end
