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
    website: 'http://znau.edu.ua',
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

sumdu = University.sumdu
sumdu.picture_white = "sumdu-white.svg"
sumdu.picture_dark = "sumdu.svg"
sumdu.show_classrooms = true
sumdu.show_groups = true
sumdu.show_teachers = true
sumdu.show_disciplines = true
sumdu.save

kpi = University.kpi
kpi.picture_white = "kpi-white.svg"
kpi.picture_dark = "kpi.svg"
kpi.show_groups = true
kpi.show_teachers = true
kpi.save

khnue = University.khnue
khnue.picture_white = "KNEU_white.svg"
khnue.picture_dark = "KNEU_black.svg"
khnue.show_groups = true
khnue.show_teachers = true
khnue.save

pnu = University.pnu
pnu.picture_white = "PNU_white.svg"
pnu.picture_dark = "PNU_Black.svg"
pnu.show_groups = true
pnu.show_teachers = true
pnu.save

znau = University.znau
znau.picture_white = "Polissya_white.svg"
znau.picture_dark = "Polissya_black.svg"
znau.show_groups = true
znau.show_teachers = true
znau.save

nuft = University.nuft
nuft.picture_white = "NUHT_white.svg"
nuft.picture_dark = "NUHT_black.svg"
nuft.show_groups = true
nuft.show_teachers = true
nuft.save

sspu = University.sspu
sspu.picture_white = "SDPU_White.svg"
sspu.picture_dark = "SDPU_Black.svg"
sspu.show_groups = true
sspu.show_teachers = true
sspu.save

gpnu = University.gpnu
gpnu.picture_white = "GPNU_white.svg"
gpnu.picture_dark = "GPNU_black.svg"
gpnu.show_groups = true
gpnu.show_teachers = true
gpnu.save

lnu = University.lnu
lnu.picture_white = "LNU_white.svg"
lnu.picture_dark = "LNU_black.svg"
lnu.show_groups = true
lnu.show_teachers = true
lnu.save

nuwm = University.nuwm
nuwm.picture_white = "NUWM_white_original.svg"
nuwm.picture_dark = "NUWM_black_original.svg"
nuwm.show_groups = true
nuwm.show_teachers = true
nuwm.save

ubs = University.ubs
ubs.picture_white = "UBS_white.svg"
ubs.picture_dark = "UBS_black.svg"
ubs.show_groups = true
ubs.show_teachers = true
ubs.save

ldubgd = University.ldubgd
ldubgd.picture_white = "LDUBGD_white.svg"
ldubgd.picture_dark = "LDUBGD_black.svg"
ldubgd.show_groups = true
ldubgd.show_teachers = true
ldubgd.save

nung = University.nung
nung.picture_white = "NUNG_white.svg"
nung.picture_dark = "NUNG_black.svg"
nung.show_groups = true
nung.show_teachers = true
nung.save

npu = University.npu
npu.picture_white = "NPU_white.svg"
npu.picture_dark = "NPU_black.svg"
npu.show_groups = true
npu.show_teachers = true
npu.save

ktepc_knute = University.ktepc_knute
ktepc_knute.picture_white = "KTEPCKNUTE_white.svg"
ktepc_knute.picture_dark = "KTEPCKNUTE_black.svg"
ktepc_knute.show_groups = true
ktepc_knute.show_teachers = true
ktepc_knute.save

ugi = University.ugi
ugi.picture_white = "UGI_white.svg"
ugi.picture_dark = "UGI_black.svg"
ugi.show_groups = true
ugi.show_teachers = true
ugi.save

kneu = University.kneu
kneu.picture_white = "KNEU_white.svg"
kneu.picture_dark = "KNEU_black.svg"
kneu.show_groups = true
kneu.show_teachers = true
kneu.save

zu = University.zu
zu.show_groups = true
zu.show_teachers = true
zu.save

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
