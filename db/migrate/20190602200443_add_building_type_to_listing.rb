class AddBuildingTypeToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :building_type, :integer
  end
end
