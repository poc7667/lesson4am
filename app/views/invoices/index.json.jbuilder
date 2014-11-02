json.array!(@invoices) do |invoice|
  json.(invoice, :to_publish_date)
  json.(invoice, :to_prizes)
end
