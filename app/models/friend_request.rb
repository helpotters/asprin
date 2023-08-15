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
  has_many :notifications, as: :notifiable, dependent: :destroy

  # Add a method to send a notification when a friend request is created
  after_create :send_notification

  private

  def send_notification
    Notification.create(notifiable: self, recipient: requested_friend)
  end

end
