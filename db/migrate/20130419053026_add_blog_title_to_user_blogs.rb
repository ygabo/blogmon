class AddBlogTitleToUserBlogs < ActiveRecord::Migration
  def change
    add_column :user_blogs, :blog_title, :string
  end
end
