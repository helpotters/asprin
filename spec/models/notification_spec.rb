# == Schema Information
#
# Table name: notifications
#
#  id           :bigint           not null, primary key
#  notice_type  :string           not null
#  notifiable   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notice_id    :bigint           not null
#  recipient_id :integer
#
# Indexes
#
#  index_notifications_on_notice  (notice_type,notice_id)
#
require "rails_helper"

RSpec.describe Notification, type: :model do
  it { is_expected.to belong_to(:notice) }
  it { is_expected.to belong_to(:recipient) }
end
