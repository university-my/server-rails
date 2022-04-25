class OnmaJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      OnmaService.import_groups
      OnmaService.import_teachers
    end
  
  end
  