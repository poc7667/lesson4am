json.array!(@buy_houses) do |buy_house|
  json.extract! buy_house, :id, :user_id, :age, :gender, :monthly_income, :job, :expenditure
  json.url buy_house_url(buy_house, format: :json)
end
