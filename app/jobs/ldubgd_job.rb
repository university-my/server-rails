class LdubgdJob < ApplicationJob
  queue_as :default

  def perform(*args)
    LdubgdService.import_groups
    LdubgdService.import_teachers
  end

end
