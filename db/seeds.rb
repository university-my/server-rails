require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

if University.sumdu.nil?
  University.create(
    short_name: "СумДУ",
    full_name: "Сумський державний університет",  
    url: "sumdu",
    website: 'https://sumdu.edu.ua/uk',
    uid: 1
    )
end

if University.kpi.nil?
  University.create(
    short_name: "КПІ",
    full_name: 'Національний технічний університет України "Київський політехнічний інститут імені Ігоря Сікорського"',
    url: "kpi",
    website: 'https://kpi.ua',
    uid: 2
    )
end

if University.khnue.nil?
  University.create(
    short_name: "ХНЕУ",
    full_name: 'Харківський національний економічний університет',  
    url: "khnue",
    website: 'https://www.hneu.edu.ua',
    uid: 3
    )
end

if University.nau.nil?
  University.create(
    short_name: "НАУ",
    full_name: 'Національний авіаційний університет', 
    url: "nau",
    website: '',
    uid: 4
    )
end

if University.pnu.nil?
  University.create(
    short_name: "ПНУ",
    full_name: 'Прикарпатський національний університет імені Василя Стефаника', 
    url: "pnu",
    website: 'https://pnu.edu.ua',
    uid: 5
    )
end

if University.znau.nil?
  University.create(
    short_name: "ПНУ",
    full_name: 'Поліський національний університет', 
    url: 'polissya-national-university',
    website: 'https://polissiauniver.edu.ua',
    uid: 6
    )
end

if University.nuft.nil?
  University.create(
    short_name: "НУХТ",
    full_name: 'Національний університет харчових технологій', 
    url: "nuft",
    website: 'https://nuft.edu.ua',
    uid: 7
    )
end

if University.sspu.nil?
  University.create(
    short_name: "СумДПУ",
    full_name: 'Сумський державний педагогічний університет імені А.С.Макаренка',
    url: "sspu",
    website: 'https://sspu.edu.ua',
    uid: 8
    )
end

if University.gpnu.nil?
  University.create(
    short_name: "ГНПУ",
    full_name: 'Глухівський національний педагогічний університет імені Олександра Довженка',
    url: "gpnu",
    website: 'http://new.gnpu.edu.ua/uk',
    uid: 9
    )
end

if University.lnu.nil?
  University.create(
    short_name: "ЛНУ",
    full_name: 'Львівський національний університет імені Івана Франка',
    url: "lnu",
    website: 'https://lnu.edu.ua',
    uid: 10
    )
end

if University.nuwm.nil?
  University.create(
    short_name: "НУВГП",
    full_name: 'Національний університет водного господарства та природокористування',
    url: "nuwm",
    website: 'https://nuwm.edu.ua',
    uid: 11
    )
end

if University.ubs.nil?
  University.create(
    short_name: "УБС",
    full_name: 'Університет банківської справи',
    url: "ubs",
    website: 'https://ubs.edu.ua',
    uid: 12
    )
end

if University.ldubgd.nil?
  University.create(
    short_name: "ЛДУ БЖД",
    full_name: 'Львівський державний університет безпеки життєдіяльності',
    url: "ldubgd",
    website: 'https://ldubgd.edu.ua',
    uid: 13
    )
end

if University.nung.nil?
  University.create(
    short_name: "ІФНТУНГ",
    full_name: 'Івано-Франківський національний технічний університет нафти і газу',
    url: "nung",
    website: 'https://nung.edu.ua',
    uid: 14
    )
end

if University.npu.nil?
  University.create(
    short_name: "НПУ",
    full_name: 'Національний педагогічний університет імені М.П. Драгоманова',
    url: "npu",
    website: 'https://npu.edu.ua',
    uid: 16
    )
end

if University.ktepc_knute.nil?
  University.create(
    short_name: "ТЕК КНТЕУ",
    full_name: 'ВСП `Київський торговельно-економічний фаховий коледж КНТЕУ`',
    url: "ktepc_knute",
    website: 'https://ktepcknute.kyiv.ua',
    uid: 17
    )
end

if University.ugi.nil?
  University.create(
    short_name: "УГІ",
    full_name: 'Український гуманітарний інститут',
    url: "ugi",
    website: 'https://ugi.edu.ua',
    uid: 18
    )
end

if University.kneu.nil?
  University.create(
    short_name: "КНЕУ",
    full_name: 'ДВНЗ `Київський національний економічний університет імені Вадима Гетьмана`',
    url: "kneu",
    website: 'https://kneu.edu.ua',
    uid: 19
    )
end

if University.zu.nil?
  University.create(
    short_name: "ЖУ",
    full_name: 'Житомирський державний університет імені Івана Франка',
    url: "zu",
    website: 'https://zu.edu.ua',
    uid: 20
    )
end

if University.zhim.nil?
  University.create(
    short_name: "ЖМІ",
    full_name: 'Житомирський медичний інститут',
    url: "zhim",
    website: 'https://www.zhim.org.ua',
    uid: 21
    )
end

if University.kubg.nil?
  University.create(
    short_name: "КУБГ",
    full_name: 'Київський університет імені Бориса Грінченка',
    url: "kubg",
    website: 'https://kubg.edu.ua',
    uid: 22
    )
end

if University.kmk.nil?
  University.create(
    short_name: "KMK",
    full_name: 'Криворізький фаховий медичний коледж',
    url: "kmk",
    website: 'http://kmk.in.ua',
    uid: 23
    )
end

if University.vnu.nil?
  University.create(
    short_name: "ВНУ",
    full_name: 'Волинський національний університет імені Лесі Українки',
    url: "vnu",
    website: 'https://vnu.edu.ua/uk',
    uid: 24
    )
end

if University.uku.nil?
  University.create(
    short_name: "УКУ",
    full_name: 'Український католицький університет',
    url: "uku",
    website: 'https://ucu.edu.ua',
    uid: 25
    )
end

if University.chdtu.nil?
  University.create(
    short_name: "ЧДТУ",
    full_name: 'Черкаський державний технологічний університет',
    url: "chdtu",
    website: 'https://chdtu.edu.ua',
    uid: 26
    )
end

if University.karazin.nil?
  University.create(
    short_name: "КАРАЗІН",
    full_name: 'Харківський національний університет ім. В.Н. Каразіна',
    url: "karazin",
    website: 'https://karazin.ua',
    uid: 27
    )
end

if University.kemk.nil?
  University.create(
    short_name: "КЕМК",
    full_name: 'Київський електромеханічний фаховий коледж',
    url: "kemk",
    website: 'http://kemk.kiev.ua',
    uid: 28
    )
end

if University.ktgg.nil?
  University.create(
    short_name: "КТГГ",
    full_name: 'Київський фаховий коледж туризму та готельного господарства',
    url: "ktgg",
    website: 'https://www.ktgg.kiev.ua/uk',
    uid: 29
    )
end

if University.kcas.nil?
  University.create(
    short_name: "КФКПН",
    full_name: 'Київський фаховий коледж прикладних наук',
    url: "kcas",
    website: 'http://kcas.kiev.ua',
    uid: 30
    )
end

if University.onma.nil?
  University.create(
    short_name: "ОМА",
    full_name: 'Національний університет `Одеська морська академія`',
    url: "onma",
    website: 'http://www.onma.edu.ua',
    uid: 31
    )
end

if University.kmkkovel.nil?
  University.create(
    short_name: "КМК",
    full_name: 'Ковельський фаховий медичний коледж',
    url: "kmkkovel",
    website: 'http://www.kmk-kovel.in.ua',
    uid: 32
    )
end

if University.kmkk.nil?
  University.create(
    short_name: "КМКК",
    full_name: 'ЗФПО "Київський міський медичний фаховий коледж"',
    url: "kmkk",
    website: 'https://kmmk.net.ua',
    uid: 33
    )
end

if University.itstep.nil?
  University.create(
    short_name: "ІТ СТЕП",
    full_name: 'Приватний заклад вищої освіти `ІТ СТЕП Університет`',
    url: "itstep",
    website: 'https://itstep.edu.ua',
    uid: 34
    )
end

University.configure_university(University.sumdu, {
  show_classrooms: true,
  show_disciplines: true,
  description: "Інформація про аудиторії, викладачів та групи із сайту schedule.sumdu.edu.ua",
  show_info: true
})

University.configure_university(University.kpi, {
  description: "Інформація про викладачів та групи із сайту rozklad.org.ua",
  show_info: true
})

University.configure_university(University.khnue, {
  description: "Інформація про аудиторії, викладачів, групи, кафедри, факультети та спеціальності із сайту hneu.edu.ua"
})

nau = University.nau
nau.is_hidden = true
nau.save

University.configure_university(University.pnu, {
  description: "Інформація про викладачів та групи із сайту asu.pnu.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.znau, {
  description: "Інформація про викладачів та групи із сайту rozklad.znau.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.nuft, {
  description: "Інформація про викладачів та групи із сайту nmu.nuft.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.sspu, {
  description: "Інформація про викладачів та групи із сайту rozklad.sspu.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.gpnu, {
  description: "Інформація про викладачів та групи із сайту 193.169.125.234/cgi-bin/timetable.cgi"
})

University.configure_university(University.lnu, {
  description: "Інформація про викладачів та групи із сайту dekanat.lnu.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.nuwm, {
  description: "Інформація про викладачів та групи із сайту desk.nuwm.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.ubs, {
  description: "Інформація про викладачів та групи із сайту decanat.cibs.ubs.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.ldubgd, {
  description: "Інформація про викладачів та групи із сайту rozklad.ldubgd.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.nung, {
  description: "Інформація про викладачів та групи із сайту dekanat.nung.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.npu, {
  description: "Інформація про викладачів та групи із сайту nmu.npu.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.ktepc_knute, {
  description: "Інформація про викладачів та групи із сайту 178.151.58.56/cgi-bin/timetable.cgi"
})

University.configure_university(University.ugi, {
  description: "Інформація про викладачів та групи із сайту education.ugi.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.kneu, {
  description: "Інформація про викладачів та групи із сайту dekanat.kneu.kiev.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.zu, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту dekanat.kneu.kiev.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.zhim, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 46.219.3.27:8080/cgi-bin/timetable.cgi"
})

University.configure_university(University.kubg, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту dekanat.kubg.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.kmk, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 80.91.179.229:81/cgi-bin/timetable.cgi"
})

University.configure_university(University.vnu, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 194.44.187.20/cgi-bin/timetable.cgi"
})

University.configure_university(University.uku, {
  picture: false,
  logo: false,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту dekanat.ucu.edu.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.chdtu, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 195.95.232.162:8082/cgi-bin/timetable.cgi"
})

University.configure_university(University.karazin, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту online.karazin.ua:1443/cgi-bin/timetable.cgi"
})

University.configure_university(University.kemk, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту test.kemt.kiev.ua/cgi-bin/timetable.cgi"
})

University.configure_university(University.ktgg, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 217.76.201.218/cgi-bin/timetable.cgi"
})

University.configure_university(University.kcas, {
  picture: true,
  logo: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 94.131.204.108/cgi-bin/timetable.cgi"
})

University.configure_university(University.onma, {
  picture: false,
  logo: false,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 212.111.205.2/cgi-bin/timetable.cgi"
})

University.configure_university(University.kmkkovel, {
  picture: false,
  logo: false,
  is_hidden: true,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 93.183.214.222/cgi-bin/timetable.cgi"
})

University.configure_university(University.kmkk, {
  picture: false,
  logo: false,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту 178.150.254.27/cgi-bin/timetable.cgi"
})

University.configure_university(University.itstep, {
  picture: false,
  logo: false,
  is_beta: true,
  description: "Інформація про викладачів та групи із сайту stud.high.itstep.org/cgi-bin/timetable.cgi"
})

# Buildings for SumDU
sumdu_buildings = [
  { name: "АК", description: "" },
  { name: "АН", description: "" },
  { name: "БІЦ", description: "" },
  { name: "Г", description: "Головний" },
  { name: "ГТ4", description: "" },
  { name: "ГТ5", description: "" },
  { name: "ГТ6", description: "" },
  { name: "ЕТ", description: "Електронних технологій" },
  { name: "К1", description: "" },
  { name: "К2", description: "" },
  { name: "К3", description: "" },
  { name: "конАК", description: "" },
  { name: "КУКл", description: "" },
  { name: "ЛА", description: "" },
  { name: "ЛБ", description: "" },
  { name: "М", description: "" },
  { name: "Н", description: "Новий" },
  { name: "С", description: "" },
  { name: "СП", description: "" },
  { name: "ССМ", description: "" },
  { name: "Т", description: "" },
  { name: "ТЗ", description: "" },
  { name: "Ц", description: "Центральний" },
  { name: "кл.кафПА", description: "" },
  { name: "кл.кафХІР", description: "Кафедра хірургії" },
  { name: "клЛДВЦ", description: "" },
  { name: "клМДКЛ", description: "" },
  { name: "клМДКЛп2", description: "" },
  { name: "клМКЛ", description: "" },
  { name: "клМКПБ", description: "" },
  { name: "клМКСП", description: "" },
  { name: "клОДКЛ", description: "" },
  { name: "клОДРЗН", description: "" },
  { name: "клОКГВВ", description: "" },
  { name: "клОКЛ", description: "" },
  { name: "клОКЛФД", description: "" },
  { name: "клОКЛп", description: "" },
  { name: "клОКЛхір", description: "" },
  { name: "клОКПТД", description: "" },
  { name: "клОКПЦ", description: "" },
  { name: "клОКСП", description: "" },
  { name: "клОКСПд", description: "" },
  { name: "клЦРКЛ", description: "Центральна клінічна лікарня" },
  { name: "конНК2", description: "" },
  { name: "клОКПТДст", description: "" },
  { name: "клОНДдис", description: "" },
  { name: "клОНДнар", description: "" },
  { name: "клПрСТОМ", description: "" },
  { name: "клСОІКЛ", description: "" },
  { name: "клСОКД", description: "" },
  { name: "клСОКОД", description: "" },
  { name: "клЦЗору", description: "Цент Зору" },
  { name: "клОДКЛст", description: "" },
  { name: "клОДЦ", description: "" },
  { name: "клМЦелед", description: 'Медичний центр "Еледія"' },
  { name: "клМП", description: "" },
]
sumdu_buildings.each do |item|
  building = Building.find_by(university: University.sumdu, name: item[:name])
  building = Building.new unless building
  building.university = University.sumdu
  building.name = item[:name]
  building.description = item[:description]
  building.save
end

# Add visible name
Discipline.all.each do |discipline|
  if discipline.visible_name == ""
    discipline.visible_name = discipline.name.downcase
    discipline.save
  end
end

# get json string
disciplines_json = File.read("db/disciplines.json")

# parse and convert JSON to Ruby
disciplines = JSON.parse(disciplines_json)

disciplines['disciplines'].each do |discipline_json|
  discipline_name = discipline_json[0]
  visible_name = discipline_json[1]

  discipline = Discipline.where(name: discipline_name).first

  if discipline != nil
    if discipline.visible_name != visible_name
      discipline.visible_name = visible_name
      discipline.save

      p "#{discipline.name} -> #{discipline.visible_name}"
    end
  end
end
