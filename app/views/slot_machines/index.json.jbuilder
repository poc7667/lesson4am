json.array!(@slot_machines) do |slot_machine|
  json.extract! slot_machine, :id, :name, :description
  json.url slot_machine_url(slot_machine, format: :json)
end
