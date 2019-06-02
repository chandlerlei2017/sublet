class RemoveEmailAndBodyFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :email
    remove_column :notifications, :body
  end
end
