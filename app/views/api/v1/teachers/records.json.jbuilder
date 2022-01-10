json.teacher do
  json.extract! @teacher, :id, :name, :uuid
end

json.records do
  json.partial! partial: 'records/record', collection: @records, as: :record
end
