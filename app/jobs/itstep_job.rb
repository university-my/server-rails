class ItstepJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      ItstepService.import_groups
      ItstepService.import_teachers
    end
  
  end
  