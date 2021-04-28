class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    unless Like.where("user_id = ?", current_user.id).exists?
      @post.likes.create({ user_id: current_user.id })
    end
    redirect_to posts_path
  end
end
