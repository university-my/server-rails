require 'net/http'
require 'json'

module NewKpiService

    def self.api_url
        'https://schedule.kpi.ua/api'
    end

    def self.server_id
        131
    end
    
    def self.import_teachers
        url = "#{self.api_url}/schedule/lecturer/list"
        json = ApplicationRecord.perform_request(url)
        return if json.nil?
        save_teachers_from(json)
    end
    
    def self.save_teachers_from(json)
        data = json['data']
        return if data.nil?
        
        university = University.kpi
        
        data.each do |object|
            name = object['name']
            server_id_string = object['id']
            
            attributes = {}
            attributes[:name] = name
            attributes[:server_id] = self.server_id
            attributes[:server_id_string] = server_id_string
            attributes[:university] = university
            
            entity = Teacher.find_by(attributes)
            next if entity.present?
            
            entity = Teacher.new(attributes)
            UniversitiesHelper.generate_uuid(entity)
            
            unless entity.save
                Rails.logger.error(entity.errors.full_messages)
                next
            end
        end
    end
end
