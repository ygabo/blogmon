class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in?
      if current_user.user_blog.blank?
        current_user.user_blog = UserBlog.new
        current_user.user_blog.save
      end
      @posts = current_user.user_blog.posts
      if !params[:id]
          for friend in current_user.friends
            if friend.user_blog.present?
                @posts += friend.user_blog.posts
            end
          end
      end     
      
      @posts = @posts.sort_by { |post| post.created_at }.reverse
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
      end
    else
      redirect_to new_user_session_path
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    if user_signed_in?
        @post = Post.new
        
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @post }
        end
    else
        redirect_to new_user_session_path
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    if !current_user.user_blog.present?
        current_user.user_blog = UserBlog.new(:user_id => current_user.id)
        current_user.user_blog.save
    end
    
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.user_blog_id = current_user.user_blog.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
