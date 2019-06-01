class AddUsersToAppliedListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :applied_listings, :user, foreign_key: true
  end
end
