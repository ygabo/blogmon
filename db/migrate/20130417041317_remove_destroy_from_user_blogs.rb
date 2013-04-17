class RemoveDestroyFromUserBlogs < ActiveRecord::Migration
  def up
    remove_column :user_blogs, :destroy
  end

  def down
    add_column :user_blogs, :destroy, :string
  end
end
