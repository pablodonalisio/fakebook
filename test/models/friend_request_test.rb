require "test_helper"

class FriendRequestTest < ActiveSupport::TestCase
  test 'valid friend request' do
    fr = friend_requests(:one)
    assert_equal fr.reciever_friend_id, users(:three).id
  end
end
