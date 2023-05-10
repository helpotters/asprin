# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer
#  user_id    :integer
#
FactoryBot.define do
  factory :friendship do
    association :user, factory: :user
    association :friend, factory: :user
  end
end
