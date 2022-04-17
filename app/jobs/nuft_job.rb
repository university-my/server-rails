class NuftJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NuftService.import_groups
    NuftService.import_teachers
  end

end
