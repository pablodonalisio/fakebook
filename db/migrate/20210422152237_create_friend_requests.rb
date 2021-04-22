class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.bigint :sender_friend_id
      t.bigint :reciever_friend_id
      t.string :state
      
      t.timestamps
    end
  end
end
