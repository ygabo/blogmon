class UserBlogsController < ApplicationController
  # GET /user_blogs
  # GET /user_blogs.json
  def index
    @user_blogs = current_user.user_blog
    @posts = current_user.user_blog.posts || []
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_blogs }
    end
  end

  # GET /user_blogs/1
  # GET /user_blogs/1.json
  def show
    @user_blog = UserBlog.find(params[:id], include: [:user, :posts])
    @user = @user_blog.user
    @posts = @user_blog.posts
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_blog }
    end
  end

  # GET /user_blogs/new
  # GET /user_blogs/new.json
  def new
    @user_blog = UserBlog.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_blog }
    end
  end

  # GET /user_blogs/1/edit
  def edit
    if current_user.user_blog.nil?
      current_user.user_blog = UserBlog.new
      current_user.user_blog.save
    end
    @user_blog = current_user.user_blog
  end

  # POST /user_blogs
  # POST /user_blogs.json
  def create
    @user_blog = UserBlog.new(params[:user_blog])

    respond_to do |format|
      if @user_blog.save
        format.html { redirect_to @user_blog, notice: 'User blog was successfully created.' }
        format.json { render json: @user_blog, status: :created, location: @user_blog }
      else
        format.html { render action: "new" }
        format.json { render json: @user_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_blogs/1
  # PUT /user_blogs/1.json
  def update
     if current_user.user_blog.nil?
      current_user.user_blog = UserBlog.new
      current_user.user_blog.save
    end
    @user_blog = current_user.user_blog
    
    respond_to do |format|
      if @user_blog.update_attributes(params[:user_blog])
        format.html { redirect_to @user_blog, notice: 'User blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_blogs/1
  # DELETE /user_blogs/1.json
  def destroy
    @user_blog = UserBlog.find(params[:id])
    @user_blog.destroy

    respond_to do |format|
      format.html { redirect_to user_blogs_url }
      format.json { head :no_content }
    end
  end
end
