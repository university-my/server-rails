class SumduJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SumduService.import_teachers
    SumduService.import_groups
    SumduService.import_auditoriums
  end

end
