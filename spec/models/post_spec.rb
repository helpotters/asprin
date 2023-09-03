# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  post_text  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:post_text) }
end
