json.model do
  json.partial! partial: 'auditoriums/auditorium', auditorium: @auditorium
end

json.lessons do
  json.partial! partial: 'records/record', collection: @lessons, as: :record
end
