class NungJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NungService.import_groups
    NungService.import_teachers
  end

end
