class AddUuidJob < ApplicationJob
  queue_as :default

  # Generate UUID for old entities, that could not be updated over time
  def perform(*args)
    Auditorium.find_each do |auditorium|
     UniversitiesHelper.generate_uuid(auditorium)
     auditorium.save
   end

   Group.find_each do |group|
     UniversitiesHelper.generate_uuid(group)
     group.save
   end

   Teacher.find_each do |teacher|
     UniversitiesHelper.generate_uuid(teacher)
     teacher.save
   end
 end
end
