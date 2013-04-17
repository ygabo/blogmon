class Post < ActiveRecord::Base
  attr_accessible :entry, :title
  
  belongs_to :user
  belongs_to :user_blog
end
