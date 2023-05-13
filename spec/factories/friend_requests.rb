FactoryBot.define do
  factory :friend_request do
    status { 1 }
    requested_friend { nil }
    user { nil }
  end
end
