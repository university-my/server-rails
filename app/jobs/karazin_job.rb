class KarazinJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KarazinService.import_groups
      KarazinService.import_teachers
    end
  
  end
  