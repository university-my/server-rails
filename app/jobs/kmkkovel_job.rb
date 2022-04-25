class KmkkovelJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KmkkovelService.import_groups
      KmkkovelService.import_teachers
    end
  
  end
  