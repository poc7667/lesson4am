class CreateBuyHouses < ActiveRecord::Migration
  def change
    create_table :buy_houses do |t|
      t.integer :user_id
      t.integer :age
      t.string :gender
      t.float :monthly_income
      t.text :job
      t.hstore :expenditure

      t.timestamps
    end
  end
end
