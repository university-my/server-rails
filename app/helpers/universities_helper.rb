require 'securerandom'

module UniversitiesHelper

    # To generate UUID for Auditorium, Group and Teacher models
    def self.generate_uuid(object)
        if object.uuid.nil?
            object.uuid = SecureRandom.uuid
        elsif object.uuid == ""
            object.uuid = SecureRandom.uuid
        end
    end

end
