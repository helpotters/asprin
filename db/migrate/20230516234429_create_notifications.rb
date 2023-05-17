class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.string :notifiable

      t.timestamps
    end
  end
end
