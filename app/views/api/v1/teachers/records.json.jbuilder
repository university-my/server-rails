json.model do
  json.partial! partial: 'teachers/teacher', teacher: @teacher
end

json.records do
  json.partial! partial: 'records/record', collection: @records, as: :record
end
