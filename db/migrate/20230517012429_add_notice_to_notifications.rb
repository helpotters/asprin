class AddNoticeToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :notice, polymorphic: true, null: false
  end
end
