class AddAboutMeToUserBlogs < ActiveRecord::Migration
  def change
    add_column :user_blogs, :about_me, :text
  end
end
