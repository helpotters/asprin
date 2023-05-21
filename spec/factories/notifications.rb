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
FactoryBot.define do
  factory :notification do
    recipient_id { 1 }
  end
end
