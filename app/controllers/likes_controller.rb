class LikesController < ApplicationController
  def index
    @likes = Post.find(params[:post_id]).likes
  end

  def create
    @post = Post.find(params[:post_id])
    unless @post.likes.where('user_id = ?', current_user.id).exists?
      @post.likes.create({ user_id: current_user.id })
    end
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end
end
