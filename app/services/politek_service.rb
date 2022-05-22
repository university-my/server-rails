require 'net/http'
require 'json'
require 'uri'
require 'nokogiri'

class PolitekService

  def self.api_url
    "https://ultimate-schedule-api-26hfd.ondigitalocean.app"
  end

  def self.load_objects(object_type, url)
    uri = URI.parse("#{self.api_url}/v1/#{object_type}")
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.open_timeout = 15
    http.read_timeout = 10
    http.write_timeout = 5

    # Headers
    request = Net::HTTP::Get.new(uri.request_uri)
    request["User-Agent"] = "My University Ruby Script"
    request["Accept"] = "application/json"
    request["X-Schedule-Url"] = url

    # Make reequest
    response = http.request(request)

    # Parse JSON
    json = JSON.parse(response.body)
    data = json['data']

    return data
  end


  def self.load_records_for(record_type, date, object_name, url)
    start_date = date.strftime('%d.%m.%Y')
    end_date = (date + 7.day).strftime('%d.%m.%Y')

    uri = URI.parse("#{self.api_url}/v1/schedule/#{record_type}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.open_timeout = 15
    http.read_timeout = 10
    http.write_timeout = 5

    # Params
    params = {
      'value' => object_name,
      'date_from' => start_date,
      'date_to' => end_date
    }
    uri.query = URI.encode_www_form(params)

    # Headers
    request = Net::HTTP::Get.new(uri.request_uri)
    request["User-Agent"] = "My University Ruby Script"
    request["Accept"] = "application/json"
    request["X-Schedule-Url"] = url

    # Make reequest
    response = http.request(request)

    # Parse JSON
    json = JSON.parse(response.body)
    data = json['data']

    if data.nil?
      raise DataNotFoundError
    end

    return data
  end

  def self.save_groups(groups, university, id)
    groups.each do |object|

      server_id = id
      group_name = object

      # Conditions for find existing group
      conditions = {}
      conditions[:university_id] = university.id
      conditions[:server_id] = server_id
      conditions[:name] = group_name

      # Try to find existing group first
      group = Group.find_by(conditions)

      if group.nil?
        # Save new group
        group = Group.new
        group.server_id = server_id
        group.name = group_name
        group.university = university

        unless group.save
          # Go to the next iteration if can't be saved
          Rails.logger.error(group.errors.full_messages)
          next
        end
      end
    rescue StandardError => e
      Rails.logger.error(e)
      next
    end

    # Iterate all to generate UUID (if empty)
    university.groups.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }
    
  end


  def self.save_teachers(teachers, university, id)
    teachers.each do |object|

      server_id = id
      teacher_name = object

      # Conditions for find existing teacher
      conditions = {}
      conditions[:university_id] = university.id
      conditions[:server_id] = server_id
      conditions[:name] = teacher_name

      # Try to find existing teacher first
      teacher = Teacher.find_by(conditions)

      if teacher.nil?
        # Save new teacher
        teacher = Teacher.new
        teacher.server_id = server_id
        teacher.name = teacher_name
        teacher.university = university

        unless teacher.save
          # Go to the next iteration if can't be saved
          Rails.logger.error(teacher.errors.full_messages)
          next
        end
      end
    rescue StandardError => e
      Rails.logger.error(e)
      next
    end
    
    # Iterate all to generate UUID (if empty)
    university.teachers.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }
    
  end


  def self.save_records_for_teacher(data, teacher, university)
    data.each do |object|

      date_string = object['date']
      lessons = object['lessons']

      lessons.each do |lesson|

        pair_start_date = (date_string + ' ' + lesson['from']).to_datetime

        parsed_data = self.parse_html(lesson['html'])

        self.save_or_update_lessons(
          pair_start_date,
          lesson['number'],
          parsed_data.join('; '),
          lesson['from'] + '-' + lesson['to'],
          teacher,
          [],
          university
          )
      end
    end

    # Update `updated_at` date of teacher
    teacher.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless teacher.save
  end

  def self.save_records_for_group(data, group, university)
    data.each do |object|
      
      date_string = object['date']
      lessons = object['lessons']

      lessons.each do |lesson|

        pair_start_date = (date_string + ' ' + lesson['from']).to_datetime

        parsed_data = self.parse_html(lesson['html'])

        self.save_or_update_lessons(
          pair_start_date,
          lesson['number'],
          parsed_data.join('; '),
          lesson['from'] + '-' + lesson['to'],
          nil,
          [group],
          university
          )
      end
    end


    # Update `updated_at` date of Group
    group.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless group.save
  end

  def self.parse_html(html)
    parsed_data = Nokogiri::HTML.parse(html) do |config|
      config.options = Nokogiri::XML::ParseOptions::NOBLANKS
    end

    parsed_data.search('.//img').remove
    parsed_data.search('.//span').remove
    parsed_data.search('.//div').remove

    data = []

    parsed_data.xpath('//td').each do |element|

      element.children.each do |children|
        text = children.text

        unless text.to_s.strip.empty?
          data << text.strip
        end
      end
    end
    
    return data
  end


  def self.save_or_update_lessons(pair_start_date, pair_name, reason, time, teacher, groups, university)
    # Conditions for find existing pair
    conditions = {}
    conditions[:university_id] = university.id
    conditions[:pair_start_date] = pair_start_date
    conditions[:pair_name] = pair_name
    conditions[:reason] = reason
    conditions[:time] = time

    # Try to find first
    lesson = Lesson.find_by(conditions)

    if lesson.nil?
      lesson = Lesson.new
    end

    # Update
    lesson.pair_start_date = pair_start_date
    lesson.time = time
    lesson.pair_name = pair_name
    lesson.name = ''
    lesson.reason = reason
    lesson.kind = ''
    lesson.university = university

    # Associations
    lesson.teacher = teacher

    # Push only unique groups
    groups.each do |group|
      lesson.groups << group unless lesson.groups.include?(group)
    end

    return if lesson.save
  end

  def self.import_records_for_auditorium(auditorium, selected_pair_date)
    # Do nothing here
  end


class DataNotFoundError < StandardError
  # Used when the parser was unable to parse the schedule
end;

end
