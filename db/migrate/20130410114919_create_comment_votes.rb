class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :comment
      t.references :user
    end
    add_index(:comment_votes, [:comment_id, :user_id], :unique=>true)
  end
end
