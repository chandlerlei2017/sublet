class AddEmailToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :email, :string
  end
end
