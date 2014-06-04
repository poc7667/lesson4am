class CreateTwLaborIncomes < ActiveRecord::Migration
  def change
    create_table :tw_labor_incomes do |t|
      t.integer :year
      t.text :gender
      t.integer :age
      t.float :percentage
      t.float :income

      t.timestamps
    end
  end
end
