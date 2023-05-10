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
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject(:friendship) { create(:friendship) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend) }
end
