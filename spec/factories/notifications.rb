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
FactoryBot.define do
  factory :notification do
    recipient_id { 1 }
    notifiable { "MyString" }
  end
end
