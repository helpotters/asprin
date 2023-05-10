# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :text
#  last_name              :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  post_id                :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_post_id               (post_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@example.com" }
    first_name { 'First' }
    last_name { 'Last' }
    password { '123456' }
  end
end
