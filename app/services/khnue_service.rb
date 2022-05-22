require 'net/http'
require 'nokogiri'

# Service for import data from KHNUE
module KhnueService
  def self.base_url
    'http://services.ksue.edu.ua:8081/schedule/xmlmetadata'
  end

  def self.auth_key
    'auth=vy_1be6600087'
  end

  def self.perform_request(url)
    uri = URI(url)
    return if uri.nil?

    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 5
    http.read_timeout = 3
    http.write_timeout = 5
    http.start

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    if response.code != '200'
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      ahoy.track "Error", message: error_message
      Rails.logger.error(error_message)
      return
    end

    doc = Nokogiri::XML(response.body)
    return doc
  end

  def self.calculate_week(date)
    # Because of strange week numbers in API
    # 01-09-2020 - first week
    # Date.current.cweek - ('01-09-2020'.to_date.cweek)

    first_week_date = '01-09-2022'.to_date
    week = (date.cweek - first_week_date.cweek) + 1

    return week
  end

  def self.parse_and_save_records(doc)
    return if doc.nil?
    
    @doc = doc.xpath('//schedule-element').each do |element|
      # Start date
      start_time_string = element.attributes['start'].value
      date_string = element.attributes['date'].value

      # Pair name
      pair_name = element.attributes['pair'].value

      # Name
      subject = element.at('./subject')
      name_string = nil
      name_string = subject.children.to_s if subject

      # Kind
      type = element.at('./type')
      kind = nil
      kind = type.children.to_s if type

      # Auditorium
      room = element.at('./room')
      auditorium_id = nil
      auditorium_id = room.attributes['id'].value if room

      # Teacher
      teacher = element.at('./teacher')
      teacher_name = nil
      teacher_name = teacher.attributes['full-name'].value if teacher && teacher.attributes['full-name']

      # Groups
      groups_ids = []
      groups = element.xpath('./groups')
      groups.xpath('./group').each do |node|
        group_id = node.attributes['id'].value
        groups_ids.push(group_id)
      end

      # Save to DB
      save_or_update_lesson(
        date_string,
        start_time_string,
        name_string,
        pair_name,
        kind,
        auditorium_id,
        teacher_name,
        groups_ids
      )
    end
  end

  #
  # Import for auditorium from KHNUE API
  #

  def self.import_records_for_auditorium(auditorium, date)
    week_number = calculate_week(date)

    url = 'http://services.ksue.edu.ua:8081/schedule/xml'
    query = "?room=#{auditorium.server_id}&week=#{week_number}&#{auth_key}"

    doc = perform_request(url + query)
    parse_and_save_records(doc)

    # Update `updated_at` date of Auditorium
    auditorium.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless auditorium.save
  end

  #
  # Import for group from KHNUE API
  #

  def self.import_records_for_group(group, date)
    week_number = calculate_week(date)

    url = 'http://services.ksue.edu.ua:8081/schedule/xml'
    query = "?group=#{group.server_id}&week=#{week_number}&#{auth_key}"

    doc = perform_request(url + query)
    parse_and_save_records(doc)

    # Update `updated_at` date of Group
    group.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless group.save
  end

  #
  # Import for teacher from KHNUE API
  #

  def self.import_records_for_teacher(teacher, date)
    week_number = calculate_week(date)

    url = 'http://services.ksue.edu.ua:8081/schedule/xml'
    query = "?employee=#{teacher.server_id}&week=#{week_number}&#{auth_key}"

    doc = perform_request(url + query)
    parse_and_save_records(doc)

    # Update `updated_at` date of Teacher
    teacher.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless teacher.save
  end

  def self.save_or_update_lesson(date_string, start_time_string, name_string, pair_name, kind, auditorium_id, teacher_name, groups_ids)
    university = University.khnue

    begin
      # Auditorium
      auditorium = Auditorium.find_by(university: university, server_id: auditorium_id.to_i)

      # Groups
      groups = Group.where(university: university, server_id: groups_ids)

      # Teacher
      teacher = Teacher.where(university: university, name: teacher_name).first

      # Pair start date
      pair_start_date = "#{date_string} #{start_time_string}".to_datetime

      # Conditions for find existing pair
      conditions = {}
      conditions[:university_id] = university.id
      conditions[:pair_start_date] = pair_start_date
      conditions[:name] = name_string
      conditions[:pair_name] = pair_name
      conditions[:kind] = kind
      conditions[:time] = start_time_string

      # Try to find first
      lesson = Lesson.find_by(conditions)

      if lesson.nil?
        lesson = Lesson.new
      end

      lesson.pair_start_date = pair_start_date
      lesson.time = start_time_string
      lesson.pair_name = pair_name
      lesson.name = name_string
      lesson.reason = nil
      lesson.kind = kind
      lesson.university = university

      # Associations
      lesson.auditorium = auditorium
      lesson.teacher = teacher

      # Push only unique groups
      groups.each do |group|
        lesson.groups << group unless lesson.groups.include?(group)
      end

      # Save or update Discipline
      discipline = save_discipline(name_string, auditorium, groups, teacher)
      lesson.discipline = discipline

      # Save
      Rails.logger.error(lesson.errors.full_messages) unless lesson.save
    rescue StandardError => e
      Rails.logger.error(e)
    end
  end

  #
  # Import auditoriums from KHNUE API
  #

  # bin/rails runner 'KhnueService.import_auditoriums'
  def self.import_auditoriums
    buildings_ids = request_buildings

    request_auditoriums(buildings_ids)

    # Iterate all to generate UUID (if empty)
    University.khnue.auditorium.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }
  end

  # 1. Request building for import auditoriums
  def self.request_buildings
    url = "#{base_url}?q=buildings&#{auth_key}"
    doc = perform_request(url)

    buildings_ids = []

    @doc = doc.xpath('//element').each do |building|
      building_id = building.attributes['id'].value
      building_name = building.at('./displayName').children.to_s

      save_building(building_id, building_name)
      buildings_ids.push(building_id)
    end

    # IDs of all building
    buildings_ids
  end

  def self.save_building(server_id, name)
    object = Building.where(server_id: server_id, name: name).first
    object = Building.new if object.nil?
    save(object, server_id, name)
  end

  # 2. Iterate through all buildings_ids
  def self.request_auditoriums(buildings_ids)
    buildings_ids.each do |building_id|
      auditoriums_in_building(building_id)
    end
  end

  # 3. Request auditoriums in building
  def self.auditoriums_in_building(building_id)
    url = "#{base_url}?q=rooms&buildingid=#{building_id}&#{auth_key}"

    doc = perform_request(url)

    @doc = doc.xpath('//element').each do |auditorium|
      auditorium_id = auditorium.attributes['id'].value
      auditorium_name = auditorium.at('./displayName').children.to_s

      # Save to DB
      save_auditorium(auditorium_id, auditorium_name, building_id)
    end
  end

  # 4. Save auditorium to the DB
  def self.save_auditorium(server_id, auditorium_name, building_id)
    university = University.khnue
    building = Building.where(university: university).where(server_id: building_id).first

    # Conditions for find existing auditorium
    conditions = {}
    conditions[:university_id] = university.id
    conditions[:server_id] = server_id
    conditions[:name] = auditorium_name

    # Try to find existing auditorium first
    auditorium = Auditorium.find_by(conditions)

    if auditorium.nil?
      # Save new auditorium
      auditorium = Auditorium.new
      auditorium.server_id = server_id
      auditorium.name = auditorium_name
      auditorium.university = university
    end

    # Updates
    auditorium.building = building

    Rails.logger.error(auditorium.errors.full_messages) unless auditorium.save
  rescue StandardError => e
    Rails.logger.error(e)

  end

  #
  # Import teachers from KHNUE API
  #

  # bin/rails runner 'KhnueService.import_teachers'
  def self.import_teachers
    # Departments
    departments_ids = request_departments

    # Teachers
    request_teachers(departments_ids)

    # Iterate all to generate UUID (if empty)
    University.khnue.teachers.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }
  end

  # 1. Request departments for import teachers
  def self.request_departments
    url = "#{base_url}?q=departments&#{auth_key}"
    doc = perform_request(url)

    departments_ids = []

    @doc = doc.xpath('//element').each do |department|
      department_id = department.attributes['id'].value
      department_name = department.at('./displayName').children.to_s
      save_department(department_id, department_name)

      departments_ids.push(department_id)
    end

    # IDs of all departments
    departments_ids
  end

  def self.save_department(id, name)
    department = Department.where(server_id: id, name: name).first
    university = University.khnue

    return unless department.nil?

    # Save new department
    department = Department.new
    department.server_id = id
    department.name = name
    department.university = university
    department.save
  end

  # 2. Iterate through all departments_ids
  def self.request_teachers(departments_ids)
    departments_ids.each do |department_id|
      request_teachers_in_department(department_id)
    end
  end

  # 3. Request teacher by department_id
  def self.request_teachers_in_department(department_id)
    url = "#{base_url}?q=employees&departmentid=#{department_id}&#{auth_key}"
    doc = perform_request(url)

    @doc = doc.xpath('//element').each do |group|
      teacher_id = group.attributes['id'].value
      teacher_name = group.at('./displayName').children.to_s

      # Save to DB
      save_teacher(teacher_id, teacher_name, department_id)
    end
  end

  # 4. Save teacher to the DB
  def self.save_teacher(server_id, teacher_name, department_id)
    university = University.khnue
    department = Department.where(university: university).where(server_id: department_id).first

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
    end

    # Update
    teacher.department = department
    teacher.save
  end

  #
  # Import groups from KHNUE API
  #

  def self.import_groups
    # Faculties
    faculties_ids = request_faculties

    # Specialities
    request_specialities(faculties_ids)

    # Iterate all to generate UUID (if empty)
    University.khnue.groups.all? { |object|
      UniversitiesHelper.generate_uuid(object)
      object.save
    }
  end

  # 1. Request faculties for import groups
  def self.request_faculties
    url = "#{base_url}?q=faculties&#{auth_key}"
    doc = perform_request(url)

    faculties_ids = []

    @doc = doc.xpath('//element').each do |faculty|
      faculty_id = faculty.attributes['id'].value
      faculty_name = faculty.at('./displayName').children.to_s
      save_faculty(faculty_id, faculty_name)

      faculties_ids.push(faculty_id)
    end

    # IDs of all faculties
    faculties_ids
  end

  def self.save_faculty(id, name)
    object = Faculty.where(server_id: id, name: name).first
    object = Faculty.new if object.nil?
    save(object, id, name)
  end

  # 2. Request specialities by faculties_ids.
  # And request group by faculty_id and speciality_id.
  def self.request_specialities(faculties_ids)
    faculties_ids.each do |faculty_id|
      specialities_ids = request_specialty(faculty_id)

      specialities_ids.each do |speciality_id|
        (1..6).each do |course|
          request_groups(faculty_id, speciality_id, course)
        end
      end
    end
  end

  # 3. Request specialty by faculty_id
  def self.request_specialty(faculty_id)
    url = "#{base_url}?q=specialities&facultyid=#{faculty_id}&#{auth_key}"
    doc = perform_request(url)

    specialities_ids = []

    @doc = doc.xpath('//element').each do |specialty|
      speciality_id = specialty.attributes['id'].value
      speciality_name = specialty.at('./displayName').children.to_s
      save_speciality(speciality_id, speciality_name)

      specialities_ids.push(speciality_id)
    end

    # IDs of specialities
    specialities_ids
  end

  def self.save(object, id, name)
    university = University.khnue
    object.server_id = id
    object.name = name
    object.university = university
    object.save
  end

  def self.save_speciality(id, name)
    object = Speciality.where(server_id: id, name: name).first
    object = Speciality.new if object.nil?
    save(object, id, name)
  end

  # 4. Request groups by faculty_id, speciality_id and course
  def self.request_groups(faculty_id, speciality_id, course)
    url = "#{base_url}?q=groups&facultyid=#{faculty_id}&specialityid=#{speciality_id}&course=#{course}&#{auth_key}"
    doc = perform_request(url)

    @doc = doc.xpath('//element').each do |group|
      group_id = group.attributes['id'].value
      group_name = group.at('./displayName').children.to_s

      # Save to DB
      save_group(group_id, group_name, faculty_id, speciality_id)
    end
  end

  # 4. Save group to the DB
  def self.save_group(server_id, group_name, faculty_id, speciality_id)
    university = University.khnue
    faculty = Faculty.where(university: university)
                     .where(server_id: faculty_id).first
    speciality = Speciality.where(university: university)
                           .where(server_id: speciality_id).first

    # Conditions for find existing group
    conditions = {}
    conditions[:university_id] = university.id
    conditions[:server_id] = server_id
    conditions[:name] = group_name

    # Try to find existing group first
    group = Group.find_by(conditions)

    if group.nil?
      # New group
      group = Group.new
      group.server_id = server_id
      group.name = group_name
      group.university = university
      group.faculty = faculty
      group.speciality = speciality
    end

    # Update
    group.faculty = faculty
    group.speciality = speciality
    group.save
  end

  #
  # Import Discipline
  #
  def self.save_discipline(name, auditorium, groups, teacher)
    university = University.khnue
    discipline = Discipline.save_or_update(name, university, auditorium, groups, teacher)
    discipline
  end
end
