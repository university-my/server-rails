class GpnuJob < ApplicationJob
  queue_as :default

  # Not worked
  def perform(*args)
    GpnuService.import_groups
    GpnuService.import_teachers
  end

end
