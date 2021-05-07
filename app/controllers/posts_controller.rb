class PostsController < ApplicationController
  def index
    @post = current_user.posts.build

    @user_liked_posts_ids = current_user.likes.where("likeable_type = 'Post'").pluck(:likeable_id)
    @posts = Post.all.includes(:likes, :comments, user: [:profile])

    @friends = User.where(id: current_user.friends_ids).includes(:profile)
  end

  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Your post has been created"
    else 
      render :new
    end 
    
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
