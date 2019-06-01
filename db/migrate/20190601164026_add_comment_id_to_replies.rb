class AddCommentIdToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :comment_id, :integer
  end
end
