class RemoveDurationAndAddEndDateToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :end_date, :datetime
    remove_column :listings, :duration
  end
end
