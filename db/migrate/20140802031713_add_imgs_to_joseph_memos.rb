class AddImgsToJosephMemos < ActiveRecord::Migration
  def up
     add_attachment :joseph_memos, :imgs
  end
  def down
     remove_attachment :joseph_memos, :imgs    
  end
end
