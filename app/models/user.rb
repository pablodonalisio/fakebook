class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sended_friend_requests, foreign_key: :sender_friend_id, class_name: "FriendRequest"
  has_many :recieved_friend_requests, foreign_key: :reciever_friend_id, class_name: "FriendRequest"
end
