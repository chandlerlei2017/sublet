class AddCostTermStartAndProvinceToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :province, :string
    add_column :listings, :cost, :integer
    add_column :listings, :duration, :integer
    add_column :listings, :start_date, :datetime
  end
end
