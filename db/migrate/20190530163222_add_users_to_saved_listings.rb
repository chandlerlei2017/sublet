class AddUsersToSavedListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :saved_listings, :user, foreign_key: true
  end
end
