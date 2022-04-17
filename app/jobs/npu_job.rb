class NpuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NpuService.import_groups
    NpuService.import_teachers
  end

end
