class KtggJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      KtggService.import_groups
      KtggService.import_teachers
    end
  
  end
  