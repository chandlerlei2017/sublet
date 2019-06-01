class CreateAppliedListings < ActiveRecord::Migration[5.2]
  def change
    create_table :applied_listings do |t|
      t.timestamps
    end
  end
end
