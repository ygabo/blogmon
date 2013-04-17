class RemoveCreateFromUserBlogs < ActiveRecord::Migration
  def up
    remove_column :user_blogs, :create
  end

  def down
    add_column :user_blogs, :create, :string
  end
end
