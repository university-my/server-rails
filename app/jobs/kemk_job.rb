class KemkJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KemkService.import_groups
      KemkService.import_teachers
    end
  
  end
  