class RenameListingsAppliedListings < ActiveRecord::Migration[5.2]
  def change
    rename_table :listings_applied_listings, :applied_listings_listings
  end
end
