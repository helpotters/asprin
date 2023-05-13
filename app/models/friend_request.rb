# == Schema Information
#
# Table name: friend_requests
#
#  id                  :bigint           not null, primary key
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  requested_friend_id :bigint
#  user_id             :bigint
#
class FriendRequest < ApplicationRecord
  belongs_to :requested_friend, class_name: 'User'
  belongs_to :user
end
