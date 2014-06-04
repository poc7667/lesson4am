class CreateTwHousePrices < ActiveRecord::Migration
  def change
    create_table :tw_house_prices do |t|
      t.string :city
      t.string :town
      t.string :transaction_type
      t.string :target_type
      t.date :date
      t.string :address
      t.float :land_area
      t.float :house_area
      t.string :building_type
      t.float :parking_price
      t.float :total_price
      t.hstore :other_information

      t.timestamps
    end
  end
end
