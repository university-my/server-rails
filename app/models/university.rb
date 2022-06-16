class University < ApplicationRecord
  # Associations
  has_many :auditorium
  has_many :admin_users
  has_many :groups
  has_many :teachers
  has_many :buildings
  has_many :departments
  has_many :faculties
  has_many :specialities
  has_many :disciplines

  def self.all_universities
   [
    { uid: 1, service: 'SumduService' },
    { uid: 2, service: 'KpiService' },
    { uid: 3, service: 'KhnueService'},
    { uid: 4, service: 'NauService'},
    { uid: 5, service: 'PnuService'},
    { uid: 6, service: 'ZnauService'},
    { uid: 7, service: 'NuftService'},
    { uid: 8, service: 'SspuService'},
    { uid: 9, service: 'GpnuService'},
    { uid: 10, service: 'LnuService'},
    { uid: 11, service: 'NuwmService'},
    { uid: 12, service: 'UbsService'},
    { uid: 13, service: 'LdubgdService'},
    { uid: 14, service: 'NungService'},
    { uid: 16, service: 'NpuService'},
    { uid: 17, service: 'KtepcKnuteService'},
    { uid: 18, service: 'UgiService'},
    { uid: 19, service: 'KneuService'},
    { uid: 20, service: 'ZuService'},
    { uid: 21, service: 'ZhimService'},
    { uid: 22, service: 'KubgService'},
    { uid: 23, service: 'KmkService'},
    { uid: 24, service: 'VnuService'},
    { uid: 25, service: 'UkuService'},
    { uid: 26, service: 'ChdtuService'},
    { uid: 27, service: 'KarazinService'},
    { uid: 28, service: 'KemkService'},
    { uid: 29, service: 'KtggService'},
    { uid: 30, service: 'KcasService'},
    { uid: 31, service: 'OnmaService'},
    { uid: 32, service: 'KmkkovelService'},
    { uid: 33, service: 'KmkkService'},
    { uid: 34, service: 'ItstepService'}
  ]
end

  def self.service_for(uid)
    object = University.all_universities.select { |hash| hash[:uid] == uid }.first
    return if object.nil?
    return object[:service]
  end

  def self.short_names_array
    University.where(is_hidden: false).flat_map { |object|  object.short_name }
  end

  # Universities

  def self.sumdu
    University.find_by(uid: 1)
  end

  def self.kpi
    University.find_by(uid: 2)
  end

  def self.khnue
    University.find_by(uid: 3)
  end

  def self.nau
    University.find_by(uid: 4)
  end

  def self.pnu
    University.find_by(uid: 5)
  end

  def self.znau
    University.find_by(uid: 6)
  end

  def self.nuft
    University.find_by(uid: 7)
  end

  def self.sspu
    University.find_by(uid: 8)
  end

  def self.gpnu
    University.find_by(uid: 9)
  end

  def self.lnu
    University.find_by(uid: 10)
  end

  def self.nuwm
    University.find_by(uid: 11)
  end

  def self.ubs
    University.find_by(uid: 12)
  end

  def self.ldubgd
    University.find_by(uid: 13)
  end

  def self.nung
    University.find_by(uid: 14)
  end

  def self.npu
    University.find_by(uid: 16)
  end

  def self.ktepc_knute
    University.find_by(uid: 17)
  end

  def self.ugi
    University.find_by(uid: 18)
  end

  def self.kneu
    University.find_by(uid: 19)
  end

  def self.zu
    University.find_by(uid: 20)
  end

  def self.zhim
    University.find_by(uid: 21)
  end

  def self.kubg
    University.find_by(uid: 22)
  end

  def self.kmk
    University.find_by(uid: 23)
  end

  def self.vnu
    University.find_by(uid: 24)
  end

  def self.uku
    University.find_by(uid: 25)
  end

  def self.chdtu
    University.find_by(uid: 26)
  end

  def self.karazin
    University.find_by(uid: 27)
  end

  def self.kemk
    University.find_by(uid: 28)
  end

  def self.ktgg
    University.find_by(uid: 29)
  end

  def self.kcas
    University.find_by(uid: 30)
  end

  def self.onma
    University.find_by(uid: 31)
  end

  def self.kmkkovel
    University.find_by(uid: 32)
  end

  def self.kmkk
    University.find_by(uid: 33)
  end

  def self.itstep
    University.find_by(uid: 34)
  end

  def self.unavailable(university)
    university == University.khnue || university == University.kneu
  end

  def self.schedule_url_for(university)
    if university == University.khnue
      return "www.hneu.edu.ua"
    elsif university == University.kneu
      return "dekanat.kneu.kiev.ua/cgi-bin/timetable.cgi"
    end
  end

  def self.configure_university(university, options)

    if options.key?(:picture) && options[:picture] == false
      university.picture_white = ""
      university.picture_dark = ""
    else
      university.picture_white = "#{university.uid}_light.svg"
      university.picture_dark = "#{university.uid}_dark.svg"
    end

    university.show_classrooms = options.key?(:show_classrooms) ? options[:show_classrooms] : false
    university.show_groups = options.key?(:show_groups) ? options[:show_groups] : true
    university.show_teachers = options.key?(:show_teachers) ? options[:show_teachers] : true
    
    university.show_disciplines = options.key?(:show_disciplines) ? options[:show_disciplines] : false
    university.show_info = options.key?(:show_info) ? options[:show_info] : false
    university.is_beta = options.key?(:is_beta) ? options[:is_beta] : false
    university.is_hidden = options.key?(:is_hidden) ? options[:is_hidden] : false

    university.description = options[:description]

    if options.key?(:logo) && options[:logo] == false
      university.logo_dark = ""
      university.logo_light = ""
    else
      university.logo_dark = "#{university.uid}_dark.png"
      university.logo_light = "#{university.uid}_light.png"
    end

    university.save
  end

end
