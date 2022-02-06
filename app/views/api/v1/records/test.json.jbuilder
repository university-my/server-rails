json.model do
  json.partial! partial: 'auditoriums/auditorium', auditorium: @auditorium
end

json.records do
  json.partial! partial: 'records/record', collection: @records, as: :record
end
