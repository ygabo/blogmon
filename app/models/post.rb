class Post < ActiveRecord::Base
  attr_accessible :entry, :title
  
  belongs_to :user
  belongs_to :user_blog

  default_scope order('created_at desc')

  def to_param
  	"#{id}-#{title.parameterize}" 
  end
end
