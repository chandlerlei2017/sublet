class AddDisplayModeForDistance < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :transport_mode, :integer
  end
end
