class FriendRequest < ApplicationRecord
  belongs_to :sender_friend, class_name: "User"
  belongs_to :reciever_friend, class_name: "User"
end
