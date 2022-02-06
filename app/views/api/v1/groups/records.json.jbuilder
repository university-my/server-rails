json.model do
  json.partial! partial: 'groups/group', group: @group
end

json.records do
  json.partial! partial: 'records/record', collection: @records, as: :record
end
