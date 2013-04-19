class FollowersController < ApplicationController
  def index
    @inverse_friendships = current_user.inverse_friendships

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friendships }
    end
  end
end
