class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    unless @post.likes.where('user_id = ?', current_user.id).exists?
      @post.likes.create({ user_id: current_user.id })
    end
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes.find_by(user_id: current_user.id).destroy
    redirect_to posts_path
  end
end
