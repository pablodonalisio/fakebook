class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  has_many :sended_friend_requests,
           foreign_key: :sender_friend_id,
           class_name: "FriendRequest",
           dependent: :destroy

  has_many :recieved_friend_requests, 
           foreign_key: :reciever_friend_id, 
           class_name: "FriendRequest", 
           dependent: :destroy

  has_many :posts, dependent: :destroy

  has_one :profile, dependent: :destroy
  
  def pending_friend_requests
    self.recieved_friend_requests.where(state: "pending")
  end

  def friends
    sended_requests = FriendRequest.where("sender_friend_id = ? and state = 'accepted'", self.id)
                                   .pluck(:reciever_friend_id)
    recieved_requests = FriendRequest.where("reciever_friend_id = ? and state = 'accepted'", self.id)
                                     .pluck(:sender_friend_id)
    friends_ids = [sended_requests, recieved_requests].flatten
    User.find(friends_ids)
  end 
end
