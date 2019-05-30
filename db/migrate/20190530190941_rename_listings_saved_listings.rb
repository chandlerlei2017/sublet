class RenameListingsSavedListings < ActiveRecord::Migration[5.2]
  def change
    rename_table :saved_listings_listings, :listings_saved_listings
  end
end
