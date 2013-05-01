class RenameUserBlogIdInPosts < ActiveRecord::Migration
  def up
    add_column :posts, :user_blog_id, :integer
  end

  def down
    remove_column :posts, :user_blog_id
  end
end
