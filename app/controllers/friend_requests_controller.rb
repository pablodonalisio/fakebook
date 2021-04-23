class FriendRequestsController < ApplicationController
  def index
    @friend_requests = current_user.pending_friend_requests.all
  end
end
