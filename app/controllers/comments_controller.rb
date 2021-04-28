class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create({user_id: current_user.id, body: params[:body]})
    redirect_to posts_path
  end
end
