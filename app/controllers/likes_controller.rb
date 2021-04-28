class LikesController < ApplicationController
  def index
    @likes = Post.find(params[:post_id]).likes if params[:post_id]
    @likes = Comment.find(params[:comment_id]).likes if params[:comment_id]
  end

  def create
    @likeable = Post.find(params[:post_id]) if params[:post_id]
    @likeable = Comment.find(params[:comment_id]) if params[:comment_id]
    unless @likeable.likes.where('user_id = ?', current_user.id).exists?
      @likeable.likes.create({ user_id: current_user.id })
    end
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end
end
