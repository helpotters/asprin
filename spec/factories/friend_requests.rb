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
FactoryBot.define do
  factory :friend_request do
    status { 1 }
    association :user, factory: :user
    association :requested_friend, factory: :user
  end
end
