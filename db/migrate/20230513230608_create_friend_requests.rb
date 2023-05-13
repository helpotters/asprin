class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.integer :status
      t.references :requested_friend, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
