# == Schema Information
#
# Table name: friend_requests
#
#  id                  :bigint           not null, primary key
#  notice_type         :string           not null
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  notice_id           :bigint           not null
#  requested_friend_id :bigint
#  user_id             :bigint
#
# Indexes
#
#  index_friend_requests_on_notice  (notice_type,notice_id)
#
FactoryBot.define do
  factory :friend_request do
    status { 1 }
    association :user, factory: :user
    association :requested_friend, factory: :user
  end
end
