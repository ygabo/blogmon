class RemovePostIdFromUserBlog < ActiveRecord::Migration
  def up
    remove_column :user_blogs, :post_id
  end

  def down
    add_column :user_blogs, :post_id, :integer
  end
end
