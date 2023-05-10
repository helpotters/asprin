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
    user_id { 1 }
    friend_id { 1 }
  end
  trait :with_two_users do
    association(:user, factory: :user)
    association(:friend, factory: :user)
  end
end
