class UsersController < ApplicationController
  before_filter :authenticate_user!
    
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    @my_friends = current_user.friends
    @my_friendships = current_user.friendships
  end

  def show
    @user = User.find(params[:id])
    @user_blog = @user.user_blog
    @posts = @user_blog.posts.sort_by { |post| post.created_at }.reverse.take(3)
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  

end
