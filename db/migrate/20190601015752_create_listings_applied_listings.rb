class CreateListingsAppliedListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings_applied_listings do |t|
      t.integer :applied_listing_id
      t.integer :listing_id
    end
  end
end
