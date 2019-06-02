class AddUtilitiesToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :utilities, :integer
  end
end
