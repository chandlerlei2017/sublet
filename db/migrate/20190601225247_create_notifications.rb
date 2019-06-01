class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :email
      t.integer :type
      t.integer :user_id
      t.text :body
      t.boolean :read

      t.timestamps
    end
  end
end
