class AddSavedListingsListings < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_listings_listings, id: false do |t|
      t.integer :saved_listing_id
      t.integer :listing_id
    end
  end
end
