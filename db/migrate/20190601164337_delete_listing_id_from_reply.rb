class DeleteListingIdFromReply < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :listing_id
  end
end
