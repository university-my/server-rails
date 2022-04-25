class KmkkJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KmkkService.import_groups
      KmkkService.import_teachers
    end
  
  end
  