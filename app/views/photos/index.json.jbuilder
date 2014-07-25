json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :title, :description, :category, :img_path, :resized_img_path
  json.url photo_url(photo, format: :json)
end
