json.array!(@joseph_memos) do |joseph_memo|
  json.extract! joseph_memo, :id, :name, :title, :words, :videos
  json.url joseph_memo_url(joseph_memo, format: :json)
end
