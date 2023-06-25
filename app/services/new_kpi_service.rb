require 'net/http'
require 'json'

module NewKpiService
    
    def self.api_url
        'https://schedule.kpi.ua/api'
    end
    
    def self.server_id
        131
    end
    
    def self.time_current
        url = "#{self.api_url}/time/current"
        json = ApplicationRecord.perform_request(url)
        return if json.nil?
        p json
    end
    
    def self.week_for_selected_date(selected_pair_date)
        remainder_of_division = selected_pair_date.cweek % 2
        remainder_of_division.zero? ? 1 : 2
    end
    
    # Get date from week number and day number
    def self.date_for_week(year, week, day)
        Date.commercial(year, week, day)
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
    
    def self.import_groups
        url = "#{self.api_url}/schedule/groups"
        json = ApplicationRecord.perform_request(url)
        return if json.nil?
        save_groups_from(json)
    end
    
    def self.save_groups_from(json)
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
            
            entity = Group.find_by(attributes)
            next if entity.present?
            
            entity = Group.new(attributes)
            UniversitiesHelper.generate_uuid(entity)
            
            unless entity.save
                Rails.logger.error(entity.errors.full_messages)
                next
            end
        end
    end
    
    def self.import_records_for_group(group_id, selected_pair_date)
        url = "#{self.api_url}/schedule/lessons?groupId=#{group_id}"
        json = ApplicationRecord.perform_request(url)
        return if json.nil?
        
        data = json['data']
        return if data.nil?
        
        first_week = data['scheduleFirstWeek']
        if first_week.present?
            save_group_week_records_from(first_week, 1, selected_pair_date, University.kpi)
        end
        second_week = data['scheduleSecondWeek']
        if second_week.present?
            save_group_week_records_from(second_week, 2, selected_pair_date, University.kpi)
        end
    end
    
    def self.save_group_week_records_from(data, week_number, selected_pair_date, university)
        day_number = 0
        data.each do |day|
            pairs = day['pairs']
            next if pairs.nil?
            
            # Calculate pair date
            current_week = week_for_selected_date(selected_pair_date)
            year = selected_pair_date.year
            week = selected_pair_date.cweek
            day = day_number + 1
            
            if week_number == current_week
                week = selected_pair_date.cweek
            elsif week_number > current_week
                week = selected_pair_date.cweek + 1
            elsif week_number < current_week
                week = selected_pair_date.cweek - 1
            end
            # `beginning_of_day` for prevent duplication
            start_date = date_for_week(year, week, day).beginning_of_day
            
            # Don't update old data because we don't want to override it
            # next if start_date < Date.today.beginning_of_day
            
            save_group_pairs_from(pairs, start_date, university)
            
            day_number += 1
        end
    end
    
    def self.save_group_pairs_from(data, start_date, university)
        data.each do |object|
            name = object['name']
            kind = object['type']
            time = object['time'].gsub('.', ':')
            pair_start_date = (start_date.strftime('%F') + ' ' + time).to_datetime
            
            attributes = {}
            attributes[:university_id] = university.id
            attributes[:pair_start_date] = pair_start_date
            attributes[:name] = name
            attributes[:kind] = kind
            attributes[:time] = time

            entity = Lesson.find_by(attributes)
            next if entity.present?
            
            entity = Lesson.new(attributes)
            unless entity.save
                Rails.logger.error(entity.errors.full_messages)
                next
            end
        end
    end
end
