class CreatePairGroups < ActiveRecord::Migration
  def change
    create_table :pair_groups do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :text
      t.string :members
      t.string :text

      t.timestamps
    end
  end
end
