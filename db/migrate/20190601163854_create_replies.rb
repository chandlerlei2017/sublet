class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :email
      t.text :body
      t.integer :listing_id

      t.timestamps
    end
  end
end
