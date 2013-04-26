class UserBlog < ActiveRecord::Base
  attr_accessible :blog_id, :user_id, :blog_title, :about_me
  
  belongs_to :user
  has_many :posts

  def to_param
  	if blog_title.blank?
  		super
  	else
  		"#{id}-#{blog_title.parameterize}"
  	end
  end
end
