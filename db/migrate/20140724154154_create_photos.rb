class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :category
      t.string :img_path
      t.string :resized_img_path

      t.timestamps
    end
  end
end
