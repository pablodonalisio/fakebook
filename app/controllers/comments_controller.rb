class CommentsController < ApplicationController
  def create
    @commentable = Post.find(params[:commentable_id]) if params[:commentable_type] == 'Post'
    @commentable = Comment.find(params[:commentable_id]) if params[:commentable_type] == 'Comment'
    @commentable.comments.create({ user_id: current_user.id, body: params[:body] })
    redirect_to posts_path
  end
end
