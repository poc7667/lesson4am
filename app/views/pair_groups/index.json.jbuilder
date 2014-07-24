json.array!(@pair_groups) do |pair_group|
  json.extract! pair_group, :id, :user_id, :title, :description, :text, :members, :text
  json.url pair_group_url(pair_group, format: :json)
end
