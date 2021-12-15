json.group do
  json.extract! @group, :id, :name, :uuid
end

json.records do
  json.partial! partial: 'records/record', collection: @records, as: :record
end
