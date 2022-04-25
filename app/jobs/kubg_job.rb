class KubgJob < ApplicationJob
  queue_as :default

  def perform(*args)
    KubgService.import_groups
    KubgService.import_teachers
  end

end
