class KmkJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KmkService.import_groups
      KmkService.import_teachers
    end
  
  end
  