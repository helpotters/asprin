# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  notifiable      :string
#  notifiable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint           not null
#  recipient_id    :integer
#
# Indexes
#
#  index_notifications_on_notice  (notifiable_type,notifiable_id)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { is_expected.to have_db_column(:notifiable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:notifiable_type).of_type(:string) }
  it { is_expected.to belong_to(:notifiable) }
  it { is_expected.to belong_to(:recipient) }
end
