class RemoveBlogIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :blog_id
  end

  def down
    add_column :posts, :blog_id, :integer
  end
end
