class RenameNoticeToNotifiableInNotifications < ActiveRecord::Migration[7.0]
  def change
    rename_column :notifications, :notice_id, :notifiable_id
    rename_column :notifications, :notice_type, :notifiable_type
  end
end
