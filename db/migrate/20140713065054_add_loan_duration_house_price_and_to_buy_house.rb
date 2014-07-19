class AddLoanDurationHousePriceAndToBuyHouse < ActiveRecord::Migration
  def change
    add_column :buy_houses, :house_price, :integer
    add_column :buy_houses, :loan_duration, :integer
  end
end
