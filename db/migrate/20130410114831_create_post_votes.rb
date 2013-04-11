class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.references :post
      t.references :user
    end
    add_index(:post_votes, [:post_id, :user_id], :unique=>true)
  end
end
