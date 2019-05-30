class CreateSavedListings < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_listings do |t|
      t.timestamps
    end
  end
end
