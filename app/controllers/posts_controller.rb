class PostsController < ApplicationController
  def index
  end

  def show
    
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
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:posts).permit(:body, :user_id)
  end
end
