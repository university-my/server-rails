class VnuJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      VnuService.import_groups
      VnuService.import_teachers
    end
  
  end
  