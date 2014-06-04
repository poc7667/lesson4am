class AddAccumulatedPercentageToTwLaborIncomes < ActiveRecord::Migration
  def change
    add_column :tw_labor_incomes, :accumulated_percentage, :float
  end
end
