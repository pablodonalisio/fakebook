class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :sended_friend_requests,
           foreign_key: :sender_friend_id,
           class_name: 'FriendRequest',
           dependent: :destroy

  has_many :recieved_friend_requests, 
           foreign_key: :reciever_friend_id,
           class_name: 'FriendRequest',
           dependent: :destroy

  has_many :posts, dependent: :destroy

  has_one :profile, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  after_create :init_profile

  def pending_friend_requests
    recieved_friend_requests.where(state: 'pending')
  end

  def friends
    sended_requests = FriendRequest.where("sender_friend_id = ? and state = 'accepted'", id)
                                   .pluck(:reciever_friend_id)
    recieved_requests = FriendRequest.where("reciever_friend_id = ? and state = 'accepted'", id)
                                     .pluck(:sender_friend_id)
    friends_ids = [sended_requests, recieved_requests].flatten
    User.find(friends_ids)
  end

  def other_users
    User.all.select do |user|
      (user.id != id) &&
        (friends.exclude? user) &&
        sended_friend_requests.where('reciever_friend_id = ?', user.id).none? &&
        pending_friend_requests.where('sender_friend_id = ?', user.id).none?
    end
  end

  def init_profile
    build_profile.save
  end
end
