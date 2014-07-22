class CreatePairRecords < ActiveRecord::Migration
  def change
    create_table :pair_records do |t|
      t.integer :user_id
      t.integer :pair_group_id
      t.text :condition
      t.text :record

      t.timestamps
    end
  end
end
