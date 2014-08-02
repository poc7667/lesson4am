class CreateJosephMemos < ActiveRecord::Migration
  def change
    create_table :joseph_memos do |t|
      t.string :name
      t.string :title
      t.text :words
      t.text :videos

      t.timestamps
    end
  end
end
