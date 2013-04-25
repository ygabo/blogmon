class AddIndexToUserBlogs < ActiveRecord::Migration
  def change
  	add_index :user_blogs, :user_id
  end
end
