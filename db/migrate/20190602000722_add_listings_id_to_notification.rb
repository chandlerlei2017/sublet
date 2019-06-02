class AddListingsIdToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :listing_id, :integer
  end
end
