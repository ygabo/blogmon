class CreateUserBlogs < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
