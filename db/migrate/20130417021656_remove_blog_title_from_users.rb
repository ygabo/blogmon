class RemoveBlogTitleFromUsers < ActiveRecord::Migration
  def up
    remove_columns :users, :blog_title
  end

  def down
    add_column :users, :blog_title, :string
  end
end
