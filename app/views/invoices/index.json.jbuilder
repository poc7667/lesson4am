json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :publish_date, :prizes
  json.url invoice_url(invoice, format: :json)
end
