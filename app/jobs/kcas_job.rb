class KcasJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KcasService.import_groups
      KcasService.import_teachers
    end
  
  end
  