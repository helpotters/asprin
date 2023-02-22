# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  post_text  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    user { nil }
    post_text { "MyText" }
  end
end
