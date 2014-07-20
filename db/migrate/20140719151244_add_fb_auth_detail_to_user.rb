class AddFbAuthDetailToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_auth_detail, :text
  end
end
