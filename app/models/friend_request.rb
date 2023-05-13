class FriendRequest < ApplicationRecord
  belongs_to :requested_friend
  belongs_to :user
end
