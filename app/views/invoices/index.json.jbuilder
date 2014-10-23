json.array!(@invoices) do |invoice|
  json.(invoice, :to_publish_date)
  json.prizes invoice.prizes
end
