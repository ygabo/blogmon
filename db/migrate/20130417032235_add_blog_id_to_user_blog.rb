class AddBlogIdToUserBlog < ActiveRecord::Migration
  def change
    add_column :user_blogs, :blog_id, :integer
  end
end
