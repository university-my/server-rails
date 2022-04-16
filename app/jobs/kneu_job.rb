class KneuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    KneuService.import_groups
    KneuService.import_teachers
  end

end
