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

  def friends_ids
    sended_requests = FriendRequest.where("sender_friend_id = ? and state = 'accepted'", id)
                                   .pluck(:reciever_friend_id)
    recieved_requests = FriendRequest.where("reciever_friend_id = ? and state = 'accepted'", id)
                                     .pluck(:sender_friend_id)
    [sended_requests, recieved_requests].flatten
  end

  def other_users
    # User.all.includes(:sended_friend_requests, :recieved_friend_requests, :profile).select do |user|
    #   (user.id != id) &&
    #     (friends.exclude? user) &&
    #     sended_friend_requests.where('reciever_friend_id = ?', user.id).none? &&
    #     recieved_friend_requests.where(state: 'pending').where('sender_friend_id = ?', user.id).none?
    # end
    ids = []
    ids << id
    ids << friends_ids
    ids << sended_friend_requests.where("state = 'pending'").pluck(:reciever_friend_id)
    ids << recieved_friend_requests.where("state = 'pending'").pluck(:sender_friend_id)
    User.where.not(id: ids.flatten).includes(:profile)
  end

  def init_profile
    build_profile.save
  end
end
