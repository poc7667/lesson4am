class BuyHouse < ActiveRecord::Base
  validates :age, :inclusion => 15..65
  validates :monthly_income, :inclusion => 10000..99999
end
