class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :country
      t.integer :uw_dist
      t.integer :laurier_dist
      t.text :ammenities
      t.text :description

      t.timestamps
    end
  end
end
