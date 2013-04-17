class AddUserBlogIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :blog_id, :integer
  end
end
