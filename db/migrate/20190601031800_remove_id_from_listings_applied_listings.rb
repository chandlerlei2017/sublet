class RemoveIdFromListingsAppliedListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings_applied_listings, :id
  end
end
