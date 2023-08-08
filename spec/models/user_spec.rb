# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :text
#  image                  :string
#  last_name              :text
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  post_id                :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_post_id               (post_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:friendships).dependent(:destroy) }
  it { is_expected.to have_many(:friends) }

  it 'has an attached avatar' do
    user.avatar.attach(
      io: File.open(Rails.root.join('spec/support/assets/avatar.png')),
      filename: 'avatar.png'
    )
    expect(user.avatar).to be_attached
  end

  describe '#full_name' do
    let(:named_user) { create(:user, first_name: 'Billy', last_name: 'Jean') }

    it "returns user's full name" do
      expect(named_user.full_name).to eq('Billy Jean')
    end
  end
end
