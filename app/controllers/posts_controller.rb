class PostsController < ApplicationController
  def index
    @post = current_user.posts.build
    @posts = current_user.posts.all
  end

  def show
    
  end

  def new
  end
  
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Your post has been created"
    else 
      render "new_post"
    end 
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
