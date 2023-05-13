class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.integer :status
      t.bigint :user_id
      t.bigint :requested_friend_id
      t.timestamps
    end
  end
end
