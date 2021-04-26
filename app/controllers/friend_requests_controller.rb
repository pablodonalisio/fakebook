class FriendRequestsController < ApplicationController
  def index
    @friend_requests = current_user.pending_friend_requests.all
  end

  def create
    @request = current_user.sended_friend_requests.create!(friend_request_params) 
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update(friend_request_params)
    redirect_to friend_requests_path
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:state, :reciever_friend_id)
  end 
end
