class KpiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Iterate all to generate UUID (if empty)
    
    University.kpi.teachers.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }

    University.kpi.groups.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }

    University.kpi.auditorium.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }

    KpiService.import_groups
    KpiService.import_teachers
  end

end
