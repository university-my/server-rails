class ChdtuJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      ChdtuService.import_groups
      ChdtuService.import_teachers
    end
  
  end
  