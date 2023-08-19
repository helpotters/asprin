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
require 'rails_helper'
require 'models/concerns/notifiable_spec'

RSpec.describe FriendRequest, type: :model do
  subject(:friend_request) { create(:friend_request) }

  it_behaves_like 'notifiable'
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:requested_friend) }
  it { is_expected.to have_many(:notifications).dependent(:destroy) }
end
