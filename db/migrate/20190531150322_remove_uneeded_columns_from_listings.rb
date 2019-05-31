class RemoveUneededColumnsFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :uw_dist
    remove_column :listings, :laurier_dist
    add_column :listings, :uw_commute, :string
    add_column :listings, :laurier_commute, :string
  end
end
