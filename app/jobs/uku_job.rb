class UkuJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      UkuService.import_groups
      UkuService.import_teachers
    end
  
  end
  